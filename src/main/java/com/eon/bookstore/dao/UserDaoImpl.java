package com.eon.bookstore.dao;

import com.eon.bookstore.entity.Books;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import com.eon.bookstore.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDaoImpl implements UserDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public User findByUserName(String userName) {

        Session currentSession = sessionFactory.getCurrentSession();

        Query<User> theQuery = currentSession.createQuery("from User where userName=:uName", User.class);
        theQuery.setParameter("uName", userName);
        User user = null;

        try {
            user = theQuery.getSingleResult();
        } catch (Exception e) {
            user = null;
        }
        return user;
    }

    @Override
    public List<User> getUsersList() {

        Session session = sessionFactory.getCurrentSession();

        Query<User> query = session.createQuery("from User order by lastName", User.class);

        List<User> userList = query.getResultList();

        return userList;
    }

    @Override
    public void save(User user) {

        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.saveOrUpdate(user);
    }

    @Override
    public void saveBasketId(User user) {

        Session currentSession = sessionFactory.getCurrentSession();

        Query query = currentSession.createQuery("update User set basketId =: basketId where userName =:uName");
        query.setParameter("uName", user.getUserName());
        query.setParameter("basketId", user.getBasketId());
        query.executeUpdate();

    }

    @Override
    public void deleteUser(User user) {

        Session currentSession = sessionFactory.getCurrentSession();

        currentSession.delete(user);
    }

    @Override
    public User findUserByEmail(String userEmail) {

        Session currentSession = sessionFactory.getCurrentSession();

        Query<User> theQuery = currentSession.createQuery("from User where email=:uEmail", User.class);
        theQuery.setParameter("uEmail", userEmail);
        User user = null;

        try {
            user = theQuery.getSingleResult();
        } catch (Exception e) {
            user = null;
        }
        return user;
    }

    @Override
    public User getUserById(long id) {

        Session currentSession = sessionFactory.getCurrentSession();

        User user = currentSession.get(User.class, id);

        return user;
    }

}

