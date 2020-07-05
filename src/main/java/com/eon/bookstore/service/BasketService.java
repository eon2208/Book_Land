package com.eon.bookstore.service;

import com.eon.bookstore.entity.Basket;
import com.eon.bookstore.entity.TotalBasket;

import java.util.List;

public interface BasketService {

    Basket createBasket();

    void saveToCart(int bookId, int quantity, String basketId, boolean edit);

    List<TotalBasket> getTotalBasketUser(String id);

    Basket getBasketById(String id);

    TotalBasket getTotalBasketById(int id);

    TotalBasket getBasketByBookId(int id);

    TotalBasket getTotalBasketByBookId(int bookId);

    void getFinalPrice(String id);

    void deleteTotalBasketById(int id);

    void deleteBasketById(String basketId);
}
