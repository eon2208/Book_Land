package com.eon.bookstore.service;

import com.eon.bookstore.dao.PasswordResetTokenDao;
import com.eon.bookstore.dao.UserDao;
import com.eon.bookstore.entity.PasswordResetToken;
import com.eon.bookstore.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Locale;
import java.util.Optional;

@Service
public class TokenServiceImpl implements TokenService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private PasswordResetTokenDao passwordResetTokenDao;

    @Override
    public void createPasswordResetTokenForUser(User user, String token) {

        // create new object
        PasswordResetToken passwordResetToken = new PasswordResetToken();

        passwordResetToken.setUser(user);
        passwordResetToken.setToken(token);

        passwordResetTokenDao.createPasswordResetTokenForUser(passwordResetToken);
    }

    @Override
    public void changeUserPassword(Object o, String newPassword) {

    }

    @Override
    public Optional getUserByPasswordResetToken(String token) {
        return Optional.empty();
    }

    @Override
    public String validatePasswordResetToken(String token) {
        return null;
    }

    @Override
    public PasswordResetToken getPasswordResetTokenByUserName(String userName) {
        return passwordResetTokenDao.getPasswordResetTokenByUserName(userName);
    }

    @Override
    public SimpleMailMessage constructResetTokenEmail(String contextPath, Locale locale, String token, User user) {
        String url = contextPath + "/user/changePassword?token=" + token;
        return constructEmail("Reset Password",url, user);
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
}
