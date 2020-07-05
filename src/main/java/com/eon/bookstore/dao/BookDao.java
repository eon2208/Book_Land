package com.eon.bookstore.dao;

import com.eon.bookstore.entity.Books;

import java.util.List;

public interface BookDao {

    List <Books> getBooks(int page) ;

    void deleteBook(int bookId);

    List<Books> searchByTitle(String searchTitle);

    Books getBookById(int bookId);
}
