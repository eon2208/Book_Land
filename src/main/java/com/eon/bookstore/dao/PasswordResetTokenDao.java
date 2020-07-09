package com.eon.bookstore.dao;

import com.eon.bookstore.entity.PasswordResetToken;

public interface PasswordResetTokenDao {

    void createPasswordResetTokenForUser(PasswordResetToken passwordResetToken);

    PasswordResetToken getPasswordResetTokenByUserName(String userName);

}
