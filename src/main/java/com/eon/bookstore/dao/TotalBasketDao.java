package com.eon.bookstore.dao;

import com.eon.bookstore.entity.TotalBasket;

import java.util.List;

public interface TotalBasketDao {

    TotalBasket getTotalBasketById(int totalBasketId);

    List<TotalBasket> getTotalBasketUser(String basketId);

    void saveToCart(TotalBasket totalBasket);

    void createBasket(TotalBasket totalBasket);

    TotalBasket getTotalBasketByBookId(int bookId);

    boolean existsOnTotalBasket(int totalBasketId);

    void deleteTotalBasketId(int totalBasketId);

    void deleteTotalBasketByBasketId(String basketId);
}
