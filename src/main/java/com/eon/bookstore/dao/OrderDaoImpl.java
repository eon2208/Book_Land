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

        // get current hibernate session
        Session currentSession = sessionFactory.getCurrentSession();

        currentSession.saveOrUpdate(order);
    }

    @Override
    public List<Order> getUserOrders(long userId) {

        // get current hibernate session
        Session currentSession = sessionFactory.getCurrentSession();

        // create query
        Query<Order> theQuery = currentSession.createQuery("from Order where user.id =:userId", Order.class);
        theQuery.setParameter("userId", userId);

        // return list of orders for user where id:=id
        return theQuery.getResultList();
    }

    @Override
    public Order getOrderById(int orderId) {

        // get current hibernate session
        Session currentSession = sessionFactory.getCurrentSession();

        return currentSession.get(Order.class,orderId);
    }

    @Override
    public List<Order> getOrders() {

        // get current hibernate session
        Session currentSession = sessionFactory.getCurrentSession();

        Query<Order> theQuery = currentSession.createQuery("from Order order by date", Order.class);

        return theQuery.getResultList();
    }


}
