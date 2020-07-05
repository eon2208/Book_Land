package com.eon.bookstore.controller;

import com.eon.bookstore.entity.User;
import com.eon.bookstore.service.AdminService;
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

    @Autowired
    private AdminService adminService;

    @GetMapping("/list")
    public String listUsers(Model model) {

        List<User> userList = adminService.getUsers();

        model.addAttribute("userList", userList);

        return "user-list";
    }

    @GetMapping("delete")
    public String deleteUser(@RequestParam("userId") long userId, Model model) {

        return "redirect:/admin/list";
    }
}
