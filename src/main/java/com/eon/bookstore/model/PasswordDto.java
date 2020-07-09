package com.eon.bookstore.model;

import com.eon.bookstore.validation.ValidPassword;

public class PasswordDto {

    private String oldPassword;

    private  String token;

    @ValidPassword
    private String newPassword;

    public PasswordDto(String oldPassword, String token, String newPassword) {
        this.oldPassword = oldPassword;
        this.token = token;
        this.newPassword = newPassword;
    }

    public PasswordDto() {
    }

    public String getOldPassword() {
        return oldPassword;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }
}