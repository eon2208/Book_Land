package com.eon.bookstore.service;

import com.eon.bookstore.entity.User;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private UserService userService;

    @Override
    public List<User> getUsers() {
        return userService.getUserList();
    }

    @Override
    public User getUserByUserId(long userId) {
        return null;
    }

    @Override
    public void deleteUser(String userName) {

        // get User by username
        User user = userService.findByUserName(userName);

        // delete User
        userService.deleteUser(user);
    }
}
