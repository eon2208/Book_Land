package com.eon.bookstore.service;

import com.eon.bookstore.dao.PasswordResetTokenDao;
import com.eon.bookstore.dao.UserDao;
import com.eon.bookstore.entity.PasswordResetToken;
import com.eon.bookstore.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;
import java.util.Optional;

@Service
@Transactional
public class TokenServiceImpl implements TokenService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private PasswordResetTokenDao passwordResetTokenDao;

    @Override
    public void createPasswordResetTokenForUser(User user, String token) {

        deleteForUserId(user.getId());

        PasswordResetToken passwordResetToken = new PasswordResetToken();

        passwordResetToken.setUser(user);
        passwordResetToken.setToken(token);

        passwordResetTokenDao.createPasswordResetTokenForUser(passwordResetToken);
    }

    @Override
    public String validatePasswordResetToken(String token) {

        final PasswordResetToken passToken = passwordResetTokenDao.findByToken(token);

        return !isTokenFound(passToken) ? "invalidToken" : isTokenExpired(passToken) ? "expired" : null;
    }

    @Override
    public boolean isTokenFound(PasswordResetToken passToken) {
        return passToken != null;
    }

    @Override
    public boolean isTokenExpired(PasswordResetToken passToken) {
        final Calendar cal = Calendar.getInstance();
        return passToken.getExpiryDate().before(cal.getTime());
    }


    @Override
    public SimpleMailMessage constructResetTokenEmail(String contextPath, Locale locale, String token, User user) {
        String url = contextPath + "/email/changePassword?token=" + token;
        return constructEmail("Reset Password","http://localhost:8080" + url, user);
    }

    @Override
    public SimpleMailMessage constructEmail(String subject, String body, User user) {
        SimpleMailMessage email = new SimpleMailMessage();
        email.setSubject(subject);
        email.setText(body);
        email.setTo(user.getEmail());
        email.setFrom("Book_Land");
        return email;
    }

    @Override
    public PasswordResetToken findByToken(String token) {
        return passwordResetTokenDao.findByToken(token);
    }

    @Override
    public void deleteForUserId(long id) {

        List<PasswordResetToken> passwordResetTokenList = passwordResetTokenDao.getListForUserId(id);

        try {
            for (PasswordResetToken passwordResetToken : passwordResetTokenList) {
                passwordResetTokenDao.deletePasswordResetToken(passwordResetToken);
            }
        } catch (Exception ex) {
            System.out.println(ex   );
        }
    }


}
