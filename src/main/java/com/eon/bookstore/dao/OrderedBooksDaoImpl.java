package com.eon.bookstore.dao;

import com.eon.bookstore.entity.OrderedBooks;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class OrderedBooksDaoImpl implements OrderedBooksDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void saveToOrderedBooks(OrderedBooks orderedBooks) {

        Session currentSession = sessionFactory.getCurrentSession();

        currentSession.save(orderedBooks);
    }

    @Override
    public List<OrderedBooks> getListOrderedBooksByOrderId(int orderId) {

        Session currentSession = sessionFactory.getCurrentSession();

        Query<OrderedBooks> theQuery = currentSession.createQuery("from OrderedBooks where order.id =: orderId", OrderedBooks.class);
        theQuery.setParameter("orderId", orderId);

        return theQuery.getResultList();
    }

    @Override
    public OrderedBooks getOrderedBooksByOrderId(int orderId) {

        Session currentSession = sessionFactory.getCurrentSession();

        Query<OrderedBooks> theQuery = currentSession.createQuery("from OrderedBooks where order.id =: orderId", OrderedBooks.class);
        OrderedBooks orderedBooks = null;

        try{
            orderedBooks = theQuery.getSingleResult();
        } catch (Exception e) {
            orderedBooks = null;
        }

        return orderedBooks;
    }
}
