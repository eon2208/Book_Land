package com.eon.bookstore.service;

import com.eon.bookstore.dao.BasketDao;
import com.eon.bookstore.dao.OrderDao;
import com.eon.bookstore.dao.OrderedBooksDao;
import com.eon.bookstore.dao.TotalBasketDao;
import com.eon.bookstore.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDao orderDao;

    @Autowired
    private OrderedBooksDao orderedBooksDao;

    @Autowired
    private BasketService basketService;

    @Override
    public void saveOrder(List<TotalBasket> totalBasketList, Basket basket, User user) {

        java.sql.Time time = new java.sql.Time(Calendar.getInstance().getTime().getTime());

        Order order = new Order();

        order.setAddressID(user.getAddress().getId());
        order.setDate(time);
        order.setStatus(1);
        order.setUser(user);
        order.setValue(basket.getTotalPrice());

        orderDao.saveOrder(order);

        for (TotalBasket totalBasket : totalBasketList) {

            OrderedBooks orderedBooks = new OrderedBooks();

            orderedBooks.setBooks(totalBasket.getBooks());
            orderedBooks.setOrder(order);
            orderedBooks.setQuantity(totalBasket.getQuantity());

            orderedBooksDao.saveToOrderedBooks(orderedBooks);
            basketService.deleteTotalBasketById(totalBasket.getId());

        }
        basketService.getFinalPrice(basket.getId());
    }

    @Override
    public List<Order> getOrdersByUserId(long userId) {

        return orderDao.getUserOrders(userId);
    }

    @Override
    public List<OrderedBooks> getListOrderedBooksByOrderId(int orderId) {
        return orderedBooksDao.getListOrderedBooksByOrderId(orderId);
    }

    @Override
    public Order getOrderById(int orderId) {

        return orderDao.getOrderById(orderId);
    }

    @Override
    public OrderedBooks getOrderedBooksByOrderId(int orderId) {

        return orderedBooksDao.getOrderedBooksByOrderId(orderId);
    }


}
