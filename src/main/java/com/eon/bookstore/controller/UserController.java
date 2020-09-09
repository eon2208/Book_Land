package com.eon.bookstore.controller;

import com.eon.bookstore.entity.Order;
import com.eon.bookstore.entity.OrderedBooks;
import com.eon.bookstore.entity.User;
import com.eon.bookstore.service.OrderService;
import com.eon.bookstore.service.UserService;
import com.eon.bookstore.model.UserInfoForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.mail.MailSender;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.logging.Logger;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private OrderService orderService;

    private Logger logger = Logger.getLogger(getClass().getName());

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

        return "user/user-detail";
    }

    @GetMapping("/showUserInfoForm")
    public String showOrderForm(Authentication authentication, Model model) {

        UserInfoForm userInfoForm = userService.userInfoFormModel(authentication.getName());

        model.addAttribute("userInfoForm", userInfoForm);

        return "user/userInfo-form";
    }

    @PostMapping("/saveUserInfoForm")
    public String saveMember(@Valid @ModelAttribute("userInfoForm") UserInfoForm userInfoForm, BindingResult bindingResult, Authentication authentication) {

        if (bindingResult.hasErrors()) {
            return "user/userInfo-form";
        }

        String userName = authentication.getName();

        userService.saveUserInfoForm(userInfoForm, userName);

        return "redirect:/user/showUserInfoForm";
    }

    @GetMapping("/showHistory")
    public String showOrderHistory(Authentication authentication, Model model) {

        User user = userService.findByUserName(authentication.getName());

        List<Order> orderList = orderService.getOrdersByUserId(user.getId());
        if(orderList != null){
            model.addAttribute("orderHistory", orderList);
            return "order/order-history";
        }
        else {
            model.addAttribute("cartAlert", true);
        }
        return "redirect:/user/userDetail";

    }

    @GetMapping("/historyDetail")
    public String showOrderInfo(@RequestParam("orderId") int orderId, Model model) {

        List<OrderedBooks> orderedBooks = orderService.getListOrderedBooksByOrderId(orderId);

        model.addAttribute("orderedBooks", orderedBooks);
        return "order/order-info";
    }

    @GetMapping("accessDenied")
    public String showAccessDeniedSite() {
        return "/user/access-denied";
    }

    @GetMapping("/emailForm")
    public String showEmailForm(){

        return "email/forgot-password";
    }

}
