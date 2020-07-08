package com.eon.bookstore.service;

import com.eon.bookstore.entity.*;

import java.util.List;

public interface OrderService {

    void saveOrder(List<TotalBasket> totalBasketList, Basket basket, User user);

    List<Order> getOrdersByUserId(long userId);

    List<OrderedBooks> getListOrderedBooksByOrderId(int orderId);

    Order getOrderById(int orderId);

    OrderedBooks getOrderedBooksByOrderId(int orderId);

    List<Order> getOrders();
}
