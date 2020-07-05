package com.eon.bookstore.service;

import com.eon.bookstore.entity.Books;

import java.util.List;

public interface BookService {

    List<Books> getBooks(int page);

    void deleteBook (int id);

    List<Books> searchByTitle(String search);

    Books getBookById(int bookId);


}
