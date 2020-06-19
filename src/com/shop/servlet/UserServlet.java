package com.shop.servlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.domian.User;
import com.shop.services.UserService;
import com.shop.services.impl.UserServiceHbaseImpl;


public class UserServlet extends BaseServlet {

	private UserService userService=new UserServiceHbaseImpl();
	
	public String userLogin(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		String user1 = userService.userLogin(user);
		System.out.println(user1);
		if(user1 == "1")return "/index.jsp";
		return "/404.jsp";
	}
}
