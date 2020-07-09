package com.eon.bookstore.controller;

import com.eon.bookstore.entity.Order;
import com.eon.bookstore.entity.OrderedBooks;
import com.eon.bookstore.entity.User;
import com.eon.bookstore.model.GenericResponse;
import com.eon.bookstore.model.PasswordDto;
import com.eon.bookstore.service.OrderService;
import com.eon.bookstore.service.UserService;
import com.eon.bookstore.model.UserInfoForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.http.HttpRequest;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.mail.Message;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;
import java.util.Locale;
import java.util.Optional;
import java.util.UUID;
import java.util.logging.Logger;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private MailSender mailSender;

    // Diagnostic Logger
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

        // linking user for infoChange
        UserInfoForm userInfoForm = userService.userInfoFormModel(authentication.getName());

        model.addAttribute("userInfoForm", userInfoForm);

        return "user/userInfo-form";
    }

    @PostMapping("/saveUserInfoForm")
    public String saveMember(@Valid @ModelAttribute("userInfoForm") UserInfoForm userInfoForm, BindingResult bindingResult, Authentication authentication) {

        // form validation
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


    /*

    @PostMapping("/savePassword")
    public String savePassword(Model model, @Valid PasswordDto passwordDto) {

        String result = userService.validatePasswordResetToken(passwordDto.getToken());

        if(result != null) {
            model.addAttribute("info", "Success");
        }

        Optional user = userService.getUserByPasswordResetToken(passwordDto.getToken());
        if(user.isPresent()) {
            userService.changeUserPassword(user.get(), passwordDto.getNewPassword());
        }
        else{

        }
    }*/

}
