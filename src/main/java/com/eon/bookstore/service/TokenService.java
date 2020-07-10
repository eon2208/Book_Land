package com.eon.bookstore.service;

import com.eon.bookstore.entity.PasswordResetToken;
import com.eon.bookstore.entity.User;
import org.springframework.mail.SimpleMailMessage;

import java.util.List;
import java.util.Locale;
import java.util.Optional;

public interface TokenService {

    void createPasswordResetTokenForUser(User user, String token);

    String validatePasswordResetToken(String token);

    boolean isTokenFound(PasswordResetToken passToken);

    boolean isTokenExpired(PasswordResetToken passToken);

    SimpleMailMessage constructResetTokenEmail(String contextPath, Locale locale, String token, User user);

    SimpleMailMessage constructEmail(String subject, String body, User user);

    PasswordResetToken findByToken(String token);

    void deleteForUserId(long id);

}
