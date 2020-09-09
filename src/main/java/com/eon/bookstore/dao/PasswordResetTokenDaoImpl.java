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

        Session currentSession = sessionFactory.getCurrentSession();

        currentSession.saveOrUpdate(passwordResetToken);
    }

    @Override
    public PasswordResetToken findByToken(String token) {

        Session currentSession = sessionFactory.getCurrentSession();

        Query<PasswordResetToken> theQuery = currentSession.createQuery("from PasswordResetToken where token =: token", PasswordResetToken.class);
        theQuery.setParameter("token", token);

        PasswordResetToken passwordResetToken = null;

        try {
            passwordResetToken = theQuery.getSingleResult();
        } catch (Exception e) {
            passwordResetToken = null;
        }
        return passwordResetToken;
    }

    @Override
    public void deletePasswordResetToken(PasswordResetToken passwordResetToken) {

        Session currentSession = sessionFactory.getCurrentSession();

        currentSession.delete(passwordResetToken);
    }


    @Override
    public List<PasswordResetToken> getListForUserId(long id) {

        Session session = sessionFactory.getCurrentSession();

        Query<PasswordResetToken> theQuery = session.createQuery("from PasswordResetToken where user.id =: uId",PasswordResetToken.class);
        theQuery.setParameter("uId", id);

        return theQuery.getResultList();

    }
}
