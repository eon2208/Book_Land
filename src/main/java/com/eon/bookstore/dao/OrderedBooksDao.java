package com.eon.bookstore.dao;

import com.eon.bookstore.entity.OrderedBooks;

import java.util.List;

public interface OrderedBooksDao {

    void saveToOrderedBooks(OrderedBooks orderedBooks);

    List<OrderedBooks> getListOrderedBooksByOrderId(int orderId);

    OrderedBooks getOrderedBooksByOrderId(int orderId);

}
