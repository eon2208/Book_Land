package com.eon.bookstore.dao;

import com.eon.bookstore.entity.PasswordResetToken;
import com.eon.bookstore.entity.User;

import java.util.List;

public interface UserDao {

    User findByUserName(String userName);

    List<User> getUsersList();

    void save(User user);

    void saveBasketId(User user);

    void deleteUser(User user);

    User findUserByEmail(String userEmail);

    User getUserById(long id);

}
