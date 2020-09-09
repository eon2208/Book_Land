package com.eon.bookstore.dao;

import com.eon.bookstore.entity.TotalBasket;
import com.eon.bookstore.service.BasketService;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;


@Repository
public class TotalBasketDaoImpl implements TotalBasketDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Autowired
    private BasketService basketService;

    @Override
    public TotalBasket getTotalBasketById(int totalBasketId) {

        Session currentSession = sessionFactory.getCurrentSession();

        Query<TotalBasket> theQuery = currentSession.createQuery("from TotalBasket where id =:totalBasketId", TotalBasket.class);
        theQuery.setParameter("totalBasketId", totalBasketId);
        TotalBasket totalBasket = null;

        try {
            totalBasket = theQuery.getSingleResult();
        } catch (Exception e) {
            totalBasket = null;
        }
        return totalBasket;
    }

    @Override
    public List<TotalBasket> getTotalBasketUser(String basketId) {

        Session currentSession = sessionFactory.getCurrentSession();

        Query<TotalBasket> theQuery = currentSession.createQuery("from TotalBasket where basket.id=:totalBasketId", TotalBasket.class);
        theQuery.setParameter("totalBasketId", basketId);
        List<TotalBasket> totalBasket = null;

        try {
            totalBasket = theQuery.getResultList();
        } catch (Exception e) {
            totalBasket = null;
        }
        return totalBasket;
    }

    @Override
    public void saveToCart(TotalBasket totalBasket) {

        Session currentSession = sessionFactory.getCurrentSession();

        currentSession.saveOrUpdate(totalBasket);
    }


    @Override
    public TotalBasket getTotalBasketByBookId(int bookId) {

        Session currentSession = sessionFactory.getCurrentSession();

        Query<TotalBasket> theQuery = currentSession.createQuery("from TotalBasket where books.id =:totalBasketBookId", TotalBasket.class);
        theQuery.setParameter("totalBasketBookId", bookId);
        TotalBasket totalBasket = null;

        try {
            totalBasket = theQuery.getSingleResult();
        } catch (Exception e) {
            totalBasket = null;
        }
        return totalBasket;

    }

    @Override
    public boolean existsOnTotalBasket(int bookId) {

        Session currentSession = sessionFactory.getCurrentSession();

        Query<TotalBasket> theQuery = currentSession.createQuery("from TotalBasket where books.id =:totalBasketId", TotalBasket.class);
        theQuery.setParameter("totalBasketId", bookId);
        return (theQuery.uniqueResult() != null);
    }

    @Override
    public void deleteTotalBasketId(int totalBasketId) {

        Session currentSession = sessionFactory.getCurrentSession();

        TotalBasket totalBasket = getTotalBasketById(totalBasketId);
        currentSession.delete(totalBasket);

    }

    @Override
    public void deleteTotalBasketByBasketId(String basketId) {

        List<TotalBasket> totalBasketList = getTotalBasketUser(basketId);

        for (TotalBasket totalBasket : totalBasketList) {
            Session session = sessionFactory.getCurrentSession();

            session.delete(totalBasket);
        }
    }
}
