package com.eon.bookstore.service;

import com.eon.bookstore.entity.Address;
import com.eon.bookstore.entity.User;
import com.eon.bookstore.model.OrderDetail;
import com.eon.bookstore.model.UserInfoForm;
import com.eon.bookstore.model.Member;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface UserService extends UserDetailsService {

    List<User> getUserList();

    User findByUserName(String userName);

    Address getAddressById(int addressId);

    void saveAddress(UserInfoForm userInfoForm, User user);

    void save(Member member);

    void saveBasketId(User user);

    void deleteUser(User user);

    void saveUserInfoForm(UserInfoForm userInfoForm, String userName);

    UserInfoForm userInfoFormModel(String userName);
}
