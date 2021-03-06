package com.eon.bookstore.dao;

import com.eon.bookstore.entity.Books;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BookDaoImpl implements BookDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Books> getBooks(int page) {

        Session currentSession = sessionFactory.getCurrentSession();

        Query<Books> theQuery = currentSession.createQuery("from Books order by id", Books.class);

        if (page == 1) {
            theQuery.setFirstResult(1);
        } else
            theQuery.setFirstResult(10 * page);
        theQuery.setMaxResults(100);

        List<Books> books = theQuery.getResultList();

        return books;
    }

    @Override
    public void deleteBook(int bookId) {

        Session currentSession = sessionFactory.getCurrentSession();

        Query query = currentSession.createQuery("delete from Books where id=:bookId");
        query.setParameter("bookId", bookId);
        query.executeUpdate();

    }

    @Override
    public List<Books> searchByTitle(String search) {

        Session session = sessionFactory.getCurrentSession();

        Query<Books> query = null;

        if (search != null && search.trim().length() > 0) {
            query = session.createQuery("from Books where lower(title) like :search" +
                    " or lower(authors) like :search" +
                    " or Lower(originalPublicationYear) like :search ", Books.class);
            query.setParameter("search", "%" + search.toLowerCase() + "%");
        } else {

            query = session.createQuery("from Books", Books.class);
        }

        List<Books> books = query.getResultList();

        return books;
    }

    @Override
    public Books getBookById(int bookId) {

        Session currentSession = sessionFactory.getCurrentSession();

        return currentSession.get(Books.class,bookId);
    }

}
