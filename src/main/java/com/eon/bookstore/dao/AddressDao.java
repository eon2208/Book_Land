package com.eon.bookstore.dao;

import com.eon.bookstore.entity.Address;
import com.eon.bookstore.entity.User;


public interface AddressDao {

    Address getAddressById(int addressId);

    void saveAddress(Address address, User user);

}
