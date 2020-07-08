package com.eon.bookstore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login")
public class LoginController {

    @GetMapping("/showMyLoginPage")
    public String showMyLoginPage(){

        return "user/fancy-login";
    }

    @GetMapping("/access-denied")
    public String showAccessDenied(){

        return "user/access-denied";
    }
}
