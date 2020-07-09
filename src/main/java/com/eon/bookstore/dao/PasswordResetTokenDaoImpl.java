package com.eon.bookstore.dao;

import com.eon.bookstore.entity.PasswordResetToken;
import com.eon.bookstore.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PasswordResetTokenDaoImpl implements PasswordResetTokenDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void createPasswordResetTokenForUser(PasswordResetToken passwordResetToken) {

        // get current hibernate session
        Session currentSession = sessionFactory.getCurrentSession();

        // save password token
        currentSession.save(passwordResetToken);
    }

    @Override
    public PasswordResetToken getPasswordResetTokenByUserName(String userName) {

        // get current hibernate session
        Session currentSession = sessionFactory.getCurrentSession();

        // create query
        Query<PasswordResetToken> theQuery = currentSession.createQuery("from PasswordResetToken where user.userName =: uName",PasswordResetToken.class);
        theQuery.setParameter("uName", userName);

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
}
