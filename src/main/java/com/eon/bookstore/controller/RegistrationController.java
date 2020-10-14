package com.eon.bookstore.controller;

import com.eon.bookstore.entity.User;
import com.eon.bookstore.service.UserService;
import com.eon.bookstore.model.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
@RequestMapping("/register")
public class RegistrationController {

    private final UserService userService;

    public RegistrationController(UserService userService) {
        this.userService = userService;
    }

    @InitBinder
    public void initBinder(WebDataBinder dataBinder) {

        StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
        dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
    }

    @GetMapping("/showRegistrationForm")
    public String showMyLoginPage(Model model){

        model.addAttribute("member",new Member());

        return "user/registration/registration-form";
    }

    @PostMapping("/processRegistrationForm")
    public String processRegistrationForm(@Valid @ModelAttribute("member") Member member, BindingResult bindingResult, Model model) {

        if (bindingResult.hasErrors()) {
            return "user/registration/registration-form";
        }

        User user = userService.findByUserName(member.getUserName());
        if (user != null) {
            model.addAttribute("member", new Member());
            model.addAttribute("infoError", "User name already exists");

            return "user/registration/registration-form";
        }

        userService.save(member);

        model.addAttribute("info", "Registration Successful");

        return "user/registration/registration-form";
    }
}
