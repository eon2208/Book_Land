package com.eon.bookstore.dao;

import com.eon.bookstore.entity.Order;

import java.util.List;

public interface OrderDao {

    void saveOrder(Order order);

    List<Order> getUserOrders(long userId);

    Order getOrderById(int orderId);

    List<Order> getOrders();
}
