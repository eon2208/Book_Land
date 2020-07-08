package com.eon.bookstore.controller;

import com.eon.bookstore.entity.Order;
import com.eon.bookstore.entity.User;
import com.eon.bookstore.service.AdminService;
import com.eon.bookstore.service.BookService;
import com.eon.bookstore.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    // Basic CRUD options

    // Spring field injections
    @Autowired
    private AdminService adminService;

    @Autowired
    private BookService bookService;

    @Autowired
    private OrderService orderService;

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

}
