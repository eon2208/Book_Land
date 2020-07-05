package com.eon.bookstore.service;

import com.eon.bookstore.dao.BookDao;
import com.eon.bookstore.entity.Books;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class BookServiceImpl implements BookService{

    @Autowired
    private BookDao bookDao;

    @Override
    public List<Books> getBooks(int page) {
        return bookDao.getBooks(page);
    }

    @Override
    public void deleteBook(int id) {
        bookDao.deleteBook(id);
    }

    @Override
    public List<Books> searchByTitle(String search) {
        return bookDao.searchByTitle(search);
    }

    @Override
    public Books getBookById(int bookId) {
        return bookDao.getBookById(bookId);
    }

}
