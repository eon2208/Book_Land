package com.eon.bookstore.dao;

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
        session.save(order);
    }

    @Override
    public void changeStatusWhereOrderId(int userId, int orderStatus) {

        Session session = sessionFactory.getCurrentSession();

        Query theQuery = session.createQuery("update Order set status =: statusValue where id =: userId",Order.class);
        theQuery.setParameter("statusValue", orderStatus);
        theQuery.setParameter("userId",userId);
        theQuery.executeUpdate();
    }

    @Override
    public List<Order> getUserOrders(long userId) {

        Session session = sessionFactory.getCurrentSession();

        Query<Order> theQuery = session.createQuery("from Order where user.id =:userId", Order.class);
        theQuery.setParameter("userId", userId);

        // return list of orders for user where id:=id
        return theQuery.getResultList();
    }

    @Override
    public Order getOrderById(int orderId) {

        Session session = sessionFactory.getCurrentSession();

        Query<Order> theQuery = session.createQuery("from Order where id =: id", Order.class);
        theQuery.setParameter("id", orderId);
        Order order = null;

        try {
            order = theQuery.getSingleResult();
        } catch (Exception e) {
            order = null;
        }
        return order;
    }


}
