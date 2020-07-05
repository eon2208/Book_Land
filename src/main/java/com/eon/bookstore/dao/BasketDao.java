package com.eon.bookstore.dao;

import com.eon.bookstore.entity.Basket;
import com.eon.bookstore.entity.TotalBasket;

import java.util.List;

public interface BasketDao {

    void saveToCart(Basket basket);

    Basket createBasket(Basket basket);

    Basket getBasketById(String basketId);

    void deleteBasketById(String basketId);
}
