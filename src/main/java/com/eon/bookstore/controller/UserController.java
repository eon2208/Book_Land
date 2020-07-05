package com.eon.bookstore.controller;

import com.eon.bookstore.entity.Order;
import com.eon.bookstore.entity.OrderedBooks;
import com.eon.bookstore.entity.User;
import com.eon.bookstore.service.OrderService;
import com.eon.bookstore.service.UserService;
import com.eon.bookstore.model.UserInfoForm;
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
@RequestMapping("/User")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private OrderService orderService;

    @InitBinder
    public void initBinder(WebDataBinder dataBinder) {

        StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
        dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
    }

    @GetMapping("/userDetail")
    public String userDetail(Model model, Authentication authentication) {

        String userName = authentication.getName();
        System.out.println("userName =" + userName);

        User user = userService.findByUserName(userName);
        model.addAttribute("user", user);

        return "user-detail";
    }

    @GetMapping("/showUserInfoForm")
    public String showOrderForm(Authentication authentication, Model model) {

        // linking user for infoChange
        UserInfoForm userInfoForm = userService.userInfoFormModel(authentication.getName());

        model.addAttribute("userInfoForm", userInfoForm);

        return "userInfo-form";
    }

    @PostMapping("/saveUserInfoForm")
    public String saveMember(@Valid @ModelAttribute("userInfoForm") UserInfoForm userInfoForm, BindingResult bindingResult, Authentication authentication) {

        // form validation
        if (bindingResult.hasErrors()) {
            return "userInfo-form";
        }

        String userName = authentication.getName();

        userService.saveUserInfoForm(userInfoForm, userName);

        return "redirect:/User/showUserInfoForm";
    }

    @GetMapping("showHistory")
    public String showOrderHistory(Authentication authentication, Model model) {

        User user = userService.findByUserName(authentication.getName());

        List<Order> orderList = orderService.getOrdersByUserId(user.getId());
        model.addAttribute("orderHistory", orderList);

        return "order-history";
    }

    @GetMapping("historyDetail")
    public String showOrderInfo(@RequestParam("orderId") int orderId, Model model) {

        List<OrderedBooks> orderedBooks = orderService.getListOrderedBooksByOrderId(orderId);

        model.addAttribute("orderedBooks", orderedBooks);
        return "order-info";
    }
}
