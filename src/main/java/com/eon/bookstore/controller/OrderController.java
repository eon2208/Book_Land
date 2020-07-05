package com.eon.bookstore.controller;

import com.eon.bookstore.entity.Basket;
import com.eon.bookstore.entity.TotalBasket;
import com.eon.bookstore.entity.User;
import com.eon.bookstore.model.UserInfoForm;
import com.eon.bookstore.service.BasketService;
import com.eon.bookstore.service.OrderService;
import com.eon.bookstore.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private UserService userService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private BasketService basketService;

    @GetMapping("/summary")
    public String completeOrder(Authentication authentication, Model model) {

        User user = userService.findByUserName(authentication.getName());
        List<TotalBasket> totalBasketList = basketService.getTotalBasketUser(user.getBasketId());
        Basket basket = basketService.getBasketById(user.getBasketId());

        model.addAttribute("basket", basket);
        model.addAttribute("totalBasket", totalBasketList);
        model.addAttribute("user", user);

        return "order-detail";
    }

    @GetMapping("/confirm")
    public String confirmOrder(Authentication authentication, Model model) {

        User user = userService.findByUserName(authentication.getName());
        Basket basket = basketService.getBasketById(user.getBasketId());
        List<TotalBasket> totalBasket = basketService.getTotalBasketUser(user.getBasketId());

        orderService.saveOrder(totalBasket, basket, user);


        return "order-confirmation";
    }




}
