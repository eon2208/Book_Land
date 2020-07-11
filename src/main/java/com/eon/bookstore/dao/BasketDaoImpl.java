package com.eon.bookstore.dao;

import com.eon.bookstore.entity.Basket;
import com.eon.bookstore.entity.Books;
import com.eon.bookstore.entity.TotalBasket;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BasketDaoImpl implements BasketDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void saveToCart(Basket basket) {

        Session currentSession = sessionFactory.getCurrentSession();

        currentSession.saveOrUpdate(basket);
    }

    @Override
    public Basket createBasket(Basket basket) {

        Session currentSession = sessionFactory.getCurrentSession();

                currentSession.saveOrUpdate(basket);

        return basket;
    }

    @Override
    public Basket getBasketById(String basketId) {

        Session currentSession = sessionFactory.getCurrentSession();

       return currentSession.get(Basket.class,basketId);
    }

    @Override
    public void deleteBasketById(String basketId) {

        Session session = sessionFactory.getCurrentSession();

        Basket basket = getBasketById(basketId);

        session.delete(basket);
    }

}
