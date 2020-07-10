package com.eon.bookstore.dao;

import com.eon.bookstore.entity.PasswordResetToken;
import com.eon.bookstore.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PasswordResetTokenDaoImpl implements PasswordResetTokenDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void createPasswordResetTokenForUser(PasswordResetToken passwordResetToken) {

        // get current hibernate session
        Session currentSession = sessionFactory.getCurrentSession();

        // save password token
        currentSession.saveOrUpdate(passwordResetToken);
    }

    @Override
    public PasswordResetToken findByToken(String token) {

        // get current hibernate session
        Session currentSession = sessionFactory.getCurrentSession();

        // create query
        Query<PasswordResetToken> theQuery = currentSession.createQuery("from PasswordResetToken where token =: token", PasswordResetToken.class);
        theQuery.setParameter("token", token);

        // create object
        PasswordResetToken passwordResetToken = null;

        try {
            passwordResetToken = theQuery.getSingleResult();
        } catch (Exception e) {
            passwordResetToken = null;
        }
        // return got user
        return passwordResetToken;
    }

    @Override
    public void deletePasswordResetToken(PasswordResetToken passwordResetToken) {

        // get current hibernate session
        Session currentSession = sessionFactory.getCurrentSession();

        // delete object
        currentSession.delete(passwordResetToken);
    }


    @Override
    public List<PasswordResetToken> getListForUserId(long id) {

        // get current hibernate session
        Session session = sessionFactory.getCurrentSession();

        // create query
        Query<PasswordResetToken> theQuery = session.createQuery("from PasswordResetToken where user.id =: uId",PasswordResetToken.class);
        theQuery.setParameter("uId", id);

        // return list of tokens for user
        return theQuery.getResultList();

    }
}
