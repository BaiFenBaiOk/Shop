package com.shop.controller;

import com.shop.pojo.User;
import com.shop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("login")
    public String login(User user, Model model){
    	 System.out.println(user.toString());
        User user1 = userService.getLogin(user);
        System.out.println(user1.toString());
        if(user1 != null ){
        	System.out.println(user1.toString());
            model.addAttribute("msg","登录成功");
            return "msg";
        }
        return "null";
    }
}
