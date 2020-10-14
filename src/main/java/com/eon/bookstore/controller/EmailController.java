package com.eon.bookstore.controller;

import com.eon.bookstore.entity.User;
import com.eon.bookstore.model.Member;
import com.eon.bookstore.model.PasswordModel;
import com.eon.bookstore.service.TokenService;
import com.eon.bookstore.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.Optional;
import java.util.UUID;
import java.util.logging.Logger;

@Controller
@RequestMapping("/email")
public class EmailController {

    private final JavaMailSender mailSender;

    private final TokenService tokenService;

    private final UserService userService;

    public EmailController(JavaMailSender mailSender, TokenService tokenService, UserService userService) {
        this.mailSender = mailSender;
        this.tokenService = tokenService;
        this.userService = userService;
    }

    @InitBinder
    public void initBinder(WebDataBinder dataBinder) {

        StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
        dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
    }

    private Logger logger = Logger.getLogger(getClass().getName());

    

    @GetMapping("/emailForm")
    public String showEmailForm() {

        return "email/forgot-password";
    }

    @PostMapping("/resetPassword")
    public String resetPassword(Model model, @RequestParam("email") String userEmail, HttpServletRequest request) {

        User user = userService.findUserByEmail(userEmail);

        if (user == null) {
            model.addAttribute("infoError", "Email not found");
            return "email/forgot-password";
        }


        String token = UUID.randomUUID().toString();
        System.out.println(token);
        tokenService.createPasswordResetTokenForUser(user, token);

        mailSender.send(tokenService.constructResetTokenEmail(request.getContextPath(),
                request.getLocale(), token, user));

        logger.info("email sent");

        model.addAttribute("info","Email sent");
        return "email/forgot-password";
    }

    @GetMapping("/changePassword")
    public String showChangePasswordPage(Model model, @RequestParam("token") String token) {

        logger.info(token);
        String result = tokenService.validatePasswordResetToken(token);
        logger.info(result);
        if (result != null) {
            return "redirect:/login/showMyLoginPage";

        } else {
            model.addAttribute("token", token);
            model.addAttribute("passwordModel", new PasswordModel());
            return "email/updatePassword";
        }
    }

    @PostMapping("/savePassword")
    public String savePassword(@RequestParam("token") String token,
                               @Valid @ModelAttribute("passwordModel") PasswordModel passwordModel,
                               BindingResult bindingResult, Model model) {

        if (bindingResult.hasErrors()) {
            return "email/updatePassword";
        }

        String result = tokenService.validatePasswordResetToken(token);
        if (result != null) {
            model.addAttribute("info", "Error");
            return "user/fancy-login";
        }

        User user = userService.getUserByPasswordResetToken(token);

        userService.changeUserPassword(user, passwordModel.getPassword());

        model.addAttribute("info", "Password Reset completed");

        return "user/fancy-login";
    }

}
