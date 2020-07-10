package com.eon.bookstore.dao;

import com.eon.bookstore.entity.PasswordResetToken;

import java.util.List;

public interface PasswordResetTokenDao {

    void createPasswordResetTokenForUser(PasswordResetToken passwordResetToken);

    PasswordResetToken findByToken(String token);

    void deletePasswordResetToken(PasswordResetToken passwordResetToken);

    List<PasswordResetToken> getListForUserId(long id);
}
