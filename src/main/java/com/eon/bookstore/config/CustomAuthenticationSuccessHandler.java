package com.eon.bookstore.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eon.bookstore.entity.Basket;
import com.eon.bookstore.service.BasketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.eon.bookstore.entity.User;
import com.eon.bookstore.service.UserService;

@Component
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    @Autowired
    private UserService userService;

    @Autowired
	private BasketService basketService;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {

		System.out.println("\n\nIn customAuthenticationSuccessHandler\n\n");

		String userName = authentication.getName();
		
		System.out.println("userName=" + userName);

		User theUser = userService.findByUserName(userName);

		if(ifUserHasBasket(theUser)) {
			assignBasketToUser(theUser);
		}

		System.out.println("token : " + theUser.getBasketId());

		response.sendRedirect(request.getContextPath() + "/home/mainPage");
	}

	private boolean ifUserHasBasket(User theUser) {
		return theUser.getBasketId() == null;
	}

	private void assignBasketToUser(User theUser) {
		Basket basket = basketService.createBasket();
		theUser.setBasketId(basket.getId());
		userService.saveBasketId(theUser);
	}

}
