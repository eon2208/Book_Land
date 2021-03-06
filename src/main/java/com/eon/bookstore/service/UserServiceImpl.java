package com.eon.bookstore.service;

import com.eon.bookstore.dao.AddressDao;
import com.eon.bookstore.dao.RoleDao;
import com.eon.bookstore.dao.UserDao;
import com.eon.bookstore.entity.Address;
import com.eon.bookstore.entity.PasswordResetToken;
import com.eon.bookstore.entity.Role;
import com.eon.bookstore.entity.User;
import com.eon.bookstore.model.UserInfoForm;
import com.eon.bookstore.model.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.*;
import java.util.stream.Collectors;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private RoleDao roleDao;

    @Autowired
    private AddressDao addressDao;

    @Autowired
    private BasketService basketService;

    @Autowired
    private TokenService tokenService;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Override
    public List<User> getUserList() {
        return userDao.getUsersList();
    }

    @Override
    public User findByUserName(String userName) {

        return userDao.findByUserName(userName);
    }

    @Override
    public Address getAddressById(int addressId) {
        return addressDao.getAddressById(addressId);
    }

    @Override
    public User getUserById(long id) {
        return userDao.getUserById(id);
    }

    @Override
    public void saveAddress(UserInfoForm userInfoForm, User user) {

        Address address = new Address();

        // assign data
        address.setCity(userInfoForm.getCity());
        address.setCountry(userInfoForm.getCountry());
        address.setStreet(userInfoForm.getStreet());
        address.setPostalCode(userInfoForm.getPostalCode());
        address.setPhone(userInfoForm.getPhone());

        if (user.getAddress().getId() != 1) {
            address.setId(user.getAddress().getId());
        }

        // save address
        addressDao.saveAddress(address, user);
    }

    @Override
    public void save(Member member) {

        User user = new User();

        user.setUserName(member.getUserName());
        user.setPassword(passwordEncoder.encode(member.getPassword()));
        user.setFirstName(member.getFirstName());
        user.setLastName(member.getLastName());
        user.setEmail(member.getEmail());
        user.setAddress(addressDao.getAddressById(1));

        user.setRoles(Collections.singletonList(roleDao.findRoleByName("ROLE_USER")));

        userDao.save(user);
    }

    @Override
    public void saveBasketId(User user) {
        userDao.saveBasketId(user);
    }

    @Override
    public void deleteUser(User user) {

        basketService.deleteBasketById(user.getBasketId());
        userDao.deleteUser(user);
    }

    @Override
    public void saveUserInfoForm(UserInfoForm userInfoForm, String userName) {

        User user = findByUserName(userName);
        Address address = getAddressById(user.getAddress().getId());

        if(address.getId() == 1) {
            address = new Address();
            address.setId(0);
        }

        user.setFirstName(userInfoForm.getFirstName());
        user.setLastName(userInfoForm.getLastName());
        user.setEmail(userInfoForm.getEmail());

        address.setCountry(userInfoForm.getCountry());
        address.setPhone(userInfoForm.getPhone());
        address.setCity(userInfoForm.getCity());
        address.setStreet(userInfoForm.getStreet());
        address.setPostalCode(userInfoForm.getPostalCode());

        addressDao.saveAddress(address, user);
        userDao.save(user);
    }

    @Override
    public UserInfoForm userInfoFormModel(String userName) {

        User user = findByUserName(userName);

        return saveUserInfoForm(user);
    }

    private UserInfoForm saveUserInfoForm(User user) {
        UserInfoForm userInfoForm = new UserInfoForm();
        userInfoForm.setId(user.getId());
        userInfoForm.setFirstName(user.getFirstName());
        userInfoForm.setLastName(user.getLastName());
        userInfoForm.setEmail(user.getEmail());
        userInfoForm.setCity(user.getAddress().getCity());
        userInfoForm.setCountry(user.getAddress().getCountry());
        userInfoForm.setPhone(user.getAddress().getPhone());
        userInfoForm.setPostalCode(user.getAddress().getPostalCode());
        userInfoForm.setStreet(user.getAddress().getStreet());

        return userInfoForm;
    }

    @Override
    public User findUserByEmail(String userEmail) {
        return userDao.findUserByEmail(userEmail);
    }

    @Override
    public void changeUserPassword(User user, String password) {
        user.setPassword(passwordEncoder.encode(password));

        userDao.save(user);
    }

    @Override
    public User getUserByPasswordResetToken(String token) {

        User user = userDao.getUserById(tokenService.findByToken(token).getUser().getId());

        return user;
    }


    @Override
    public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {

        User user = userDao.findByUserName(userName);

        if (user == null) {
            throw new UsernameNotFoundException("Invalid username or password.");
        }
        return new org.springframework.security.core.userdetails.User(user.getUserName(), user.getPassword(), mapRolesToAuthorities(user.getRoles()));
    }

    private Collection<? extends GrantedAuthority> mapRolesToAuthorities(Collection<Role> roles) {
        return roles.stream().map(role -> new SimpleGrantedAuthority(role.getName())).collect(Collectors.toList());
    }
}
