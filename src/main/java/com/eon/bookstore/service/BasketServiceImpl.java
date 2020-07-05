package com.eon.bookstore.service;

import com.eon.bookstore.dao.BookDao;
import com.eon.bookstore.dao.BasketDao;
import com.eon.bookstore.dao.TotalBasketDao;
import com.eon.bookstore.entity.Basket;
import com.eon.bookstore.entity.Books;
import com.eon.bookstore.entity.TotalBasket;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class BasketServiceImpl implements BasketService {

    @Autowired
    private BasketDao basketDao;

    @Autowired
    private BookDao bookDao;

    @Autowired
    private TotalBasketDao totalBasketDao;

    @Override
    public Basket createBasket() {

        Basket basket = new Basket();
        basket.setTotalPrice(0);

        return basketDao.createBasket(basket);
    }

    @Override
    public void saveToCart(int bookId, int quantity, String basketId, boolean edit) {

        Books books = bookDao.getBookById(bookId);
        TotalBasket totalBasket = new TotalBasket();

        if (totalBasketDao.existsOnTotalBasket(bookId)) {
            totalBasket = getTotalBasketByBookId(bookId);
            if (edit) {
                totalBasket.setQuantity(quantity);
            } else {
                totalBasket.setQuantity(totalBasket.getQuantity() + quantity);
            }
        } else {
            totalBasket.setQuantity(quantity);
            totalBasket.setBasket(getBasketById(basketId));
            totalBasket.setBooks(books);
            totalBasket.setPrice(books.getPrice());
        }

        totalBasketDao.saveToCart(totalBasket);
        getFinalPrice(basketId);
    }

    @Override
    public List<TotalBasket> getTotalBasketUser(String id) {
        return totalBasketDao.getTotalBasketUser(id);
    }

    @Override
    public Basket getBasketById(String id) {
        return basketDao.getBasketById(id);
    }

    @Override
    public TotalBasket getTotalBasketById(int id) {
        return totalBasketDao.getTotalBasketById(id);
    }

    @Override
    public TotalBasket getBasketByBookId(int id) {
        return totalBasketDao.getTotalBasketByBookId(id);
    }

    @Override
    public TotalBasket getTotalBasketByBookId(int bookId) {
        return totalBasketDao.getTotalBasketByBookId(bookId);
    }

    @Override
    public void getFinalPrice(String id) {
        List<TotalBasket> totalBasketList = getTotalBasketUser(id);
        double totalPrice = 0;

        for (TotalBasket totalBasket : totalBasketList) {
            totalPrice += totalBasket.getPrice() * totalBasket.getQuantity();
        }

        Basket basket = basketDao.getBasketById(id);
        basket.setTotalPrice(totalPrice);
        basketDao.saveToCart(basket);
    }

    @Override
    public void deleteTotalBasketById(int id) {
        totalBasketDao.deleteTotalBasketId(id);
    }

    @Override
    public void deleteBasketById(String basketId) {
        basketDao.deleteBasketById(basketId);
    }


}
