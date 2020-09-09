package com.eon.bookstore.service;

import com.eon.bookstore.dao.UserDao;
import com.eon.bookstore.entity.User;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {

    @Autowired
    private UserService userService;

    @Autowired
    private UserDao userDao;

    @Override
    public List<User> getUsers() {
        return userService.getUserList();
    }

    @Override
    public User getUserByUserId(long userId) {
        return userService.getUserById(userId);
    }

    @Override
    public void deleteUser(String userName) {

        User user = userService.findByUserName(userName);

        userService.deleteUser(user);
    }
}
