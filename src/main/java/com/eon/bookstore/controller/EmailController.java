package com.eon.bookstore.controller;

import com.eon.bookstore.entity.PasswordResetToken;
import com.eon.bookstore.entity.User;
import com.eon.bookstore.service.TokenService;
import com.eon.bookstore.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamSource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;
import java.util.logging.Logger;

@Controller
@RequestMapping("/email")
public class EmailController {

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private TokenService tokenService;

    @Autowired
    private UserService userService;

    // Diagnostic Logger
    private Logger logger = Logger.getLogger(getClass().getName());

    @GetMapping("/emailForm")
    public String showEmailForm(){

        return "email/forgot-password";
    }

    @PostMapping("/resetPassword")
    public String resetPassword(Model model, @RequestParam("email") String userEmail, HttpServletRequest request) {

        User user = userService.findUserByEmail(userEmail);
        logger.info("user found");

        if (user == null) {
            model.addAttribute("exception", "Email not found");
            return "redirect:/email/error";
        }

        String token = UUID.randomUUID().toString();
        System.out.println(token);
        tokenService.createPasswordResetTokenForUser(user, token);

        mailSender.send(tokenService.constructResetTokenEmail(request.getRequestURI(),
                request.getLocale(), token, user));

        logger.info("email sent");

        return "redirect:/login/showMyLoginPage";
    }

}