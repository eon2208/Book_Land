package com.eon.bookstore.service;

import com.eon.bookstore.entity.Order;
import com.eon.bookstore.entity.User;

import java.util.List;

public interface AdminService {

    List<User> getUsers();

    User getUserByUserId(long userId);

    void deleteUser(String userName);

}
