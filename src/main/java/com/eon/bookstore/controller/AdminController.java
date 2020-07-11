package com.eon.bookstore.controller;

import com.eon.bookstore.entity.Order;
import com.eon.bookstore.entity.User;
import com.eon.bookstore.model.UserInfoForm;
import com.eon.bookstore.service.AdminService;
import com.eon.bookstore.service.BookService;
import com.eon.bookstore.service.OrderService;
import com.eon.bookstore.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.logging.Logger;

@Controller
@RequestMapping("/admin")
public class AdminController {

    // Basic CRUD options

    // Diagnostic Logger
    private Logger logger = Logger.getLogger(getClass().getName());

    // Spring field injections
    @Autowired
    private AdminService adminService;

    @Autowired
    private BookService bookService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private UserService userService;

    // mapping for listing Users
    @GetMapping("/list")
    public String listUsers(Model model) {

        List<User> userList = adminService.getUsers();

        model.addAttribute("userList", userList);

        return "admin/user-list";
    }

    // mapping for deleting users
    @GetMapping("deleteUser")
    public String deleteUser(@RequestParam("userName") String userName, Model model) {

        adminService.deleteUser(userName);

        return "redirect:/admin/list";
    }


    // delete a book
    @GetMapping("/delete")
    public String delete(@RequestParam("bookId") int id) {

        bookService.deleteBook(id);

        return "redirect:/home/mainPage";
    }

    // listing all orders
    // changing status of order for user
    @GetMapping("/orders")
    public String showOrders(Model model) {

        // get all orders
        List<Order> orderList = orderService.getOrders();
        if (orderList.isEmpty()) {
            model.addAttribute("emptyError", true);

            return "redirect:/admin/list";
        }

        // send it as a model
        model.addAttribute("orderList", orderList);

        return "admin/order-list";
    }

    @GetMapping("/editStatus")
    public String editOrderStatus(@RequestParam("orderStatus") int status, @RequestParam("orderId") int orderId) {

        orderService.changeStatusWhereOrderId(orderId, status);

        return "redirect:/admin/orders";
    }

    @GetMapping("/showInfo")
    public String showInfoForUser(@RequestParam("userName") String userName, Model model) {

        UserInfoForm userInfoForm = userService.userInfoFormModel(userName);
        User user = userService.findByUserName(userName);

        model.addAttribute("user",user);
        model.addAttribute("userInfoForm", userInfoForm);

        return "user/userInfo-form";
    }

    @PostMapping("/saveUser")
    public String editUser(@Valid @ModelAttribute("userInfoForm") UserInfoForm userInfoForm, BindingResult bindingResult, @RequestParam("userName") String userName) {

        try{
            // form validation
            if (bindingResult.hasErrors()) {
                return "user/userInfo-form";
            }

            logger.info(userName);
            userService.saveUserInfoForm(userInfoForm, userName);


        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/admin/list";
    }
}
