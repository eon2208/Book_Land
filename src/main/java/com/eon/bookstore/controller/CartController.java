package com.eon.bookstore.controller;

import com.eon.bookstore.entity.Basket;
import com.eon.bookstore.entity.TotalBasket;
import com.eon.bookstore.entity.User;
import com.eon.bookstore.service.BasketService;
import com.eon.bookstore.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private BasketService basketService;

    @Autowired
    private UserService userService;

    @GetMapping("/")
    public String printCart(Model model, Authentication authentication) {

        // get list of all items in cart
        Basket basket = basketService.getBasketById(userService.findByUserName(authentication.getName()).getBasketId());
        List<TotalBasket> totalBasketList = basketService.getTotalBasketUser(basket.getId());

        model.addAttribute("basket", basket);
        model.addAttribute("totalBasket", totalBasketList);

        return "books/cart";
    }

    @GetMapping("/addToCart")
    public String addToCart(@RequestParam("quantity") int quantity, @RequestParam("bookId") int bookId, Authentication authentication) {

        // false --> add new item
        basketService.saveToCart(bookId, quantity, userService.findByUserName(authentication.getName()).getBasketId(), false);

        return "redirect:/home/mainPage";
    }

    @GetMapping("/editCart")
    public String editCart(@RequestParam("quantity") int quantity, @RequestParam("bookId") int bookId, Authentication authentication) {

        // true --> edit cart
        basketService.saveToCart(bookId, quantity, userService.findByUserName(authentication.getName()).getBasketId(), true);

        return "redirect:/cart/";
    }

    @GetMapping("/delete")
    public String deleteLine(@RequestParam("totalBasketId") int totalBasketId, @RequestParam("basketId") String basketId){

        basketService.deleteTotalBasketById(totalBasketId);
        basketService.getFinalPrice(basketId);

        return "redirect:/cart/";
    }

    @GetMapping("/deleteAll")
    public String deleteAll(Authentication authentication) {

        // get current user
        User user = userService.findByUserName(authentication.getName());
        String basketId = user.getBasketId();

        // delete all items in basket
        basketService.deleteTotalBasketByBasketId(basketId);
        basketService.getFinalPrice(basketId);

        return "redirect:/cart/";
    }
}
