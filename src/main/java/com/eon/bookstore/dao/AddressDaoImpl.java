package com.eon.bookstore.dao;

import com.eon.bookstore.entity.Address;
import com.eon.bookstore.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AddressDaoImpl implements AddressDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Address getAddressById(int addressId) {

        Session session = sessionFactory.getCurrentSession();

        return session.get(Address.class,addressId);
    }

    @Override
    public void saveAddress(Address address, User user) {

        Session session = sessionFactory.getCurrentSession();

        session.saveOrUpdate(address);

        // changing basic address
        if (user.getAddress().getId() == 1) {
            System.out.println(">>>>" + address.getId());

            user.setAddress(address);
            session.saveOrUpdate(user);

        }
    }

}
