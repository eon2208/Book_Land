package com.eon.bookstore.dao;

import com.eon.bookstore.entity.Books;
import com.eon.bookstore.entity.Order;
import com.eon.bookstore.entity.Order;
import com.eon.bookstore.entity.TotalBasket;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class OrderDaoImpl implements OrderDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void saveOrder(Order order) {

        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(order);
    }

    @Override
    public List<Order> getUserOrders(long userId) {

        // get current hibernate session
        Session session = sessionFactory.getCurrentSession();

        // create query
        Query<Order> theQuery = session.createQuery("from Order where user.id =:userId", Order.class);
        theQuery.setParameter("userId", userId);

        // return list of orders for user where id:=id
        return theQuery.getResultList();
    }

    @Override
    public Order getOrderById(int orderId) {

        Session session = sessionFactory.getCurrentSession();

        return session.get(Order.class,orderId);
    }

    @Override
    public List<Order> getOrders() {

        Session session = sessionFactory.getCurrentSession();

        Query<Order> theQuery = session.createQuery("from Order order by date", Order.class);

        return theQuery.getResultList();
    }


}
