package com.eon.bookstore.controller;

import com.eon.bookstore.entity.Basket;
import com.eon.bookstore.entity.Books;
import com.eon.bookstore.service.BookService;
import com.eon.bookstore.service.BasketService;
import com.eon.bookstore.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/home")
public class BookLandController {

    // Spring field injections
    @Autowired
    private BookService bookService;

    @Autowired
    private BasketService basketService;

    @Autowired
    private UserService userService;

    // main page Controller
    @GetMapping("/mainPage")
    public String showHomePage(Model model, @RequestParam(value = "page", required = false, defaultValue = "1") int page, Authentication authentication) {

        List<Books> booksList = bookService.getBooks(page);
        model.addAttribute("books", booksList);
        Basket basket = null;

        try {
            basket = basketService.getBasketById(userService.findByUserName(authentication.getName()).getBasketId());
            model.addAttribute("userCart", basket);
        } catch (Exception ex) {
            basket = null;
        }

        return "books/home";
    }


    // searching books
    @GetMapping("/search")
    public String searchBook(@RequestParam("search") String search, Model model) {

        // search Books from service
        List<Books> booksList = bookService.searchByTitle(search);

        // add books to model
        model.addAttribute("books", booksList);

        return "books/home";
    }

    // details of book
    @GetMapping("/details")
    public String showBook(@RequestParam("bookId") int bookId, Model model) {

        // search books from service by bookId
        Books book = bookService.getBookById(bookId);

        model.addAttribute("book", book);

        return "books/book-detail";
    }

}
