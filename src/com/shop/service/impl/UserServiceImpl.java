package com.shop.service.impl;

import com.shop.mapper.UserMapper;
import com.shop.pojo.User;
import com.shop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Service
@Repository("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User getLogin(User user) {
    	System.out.println(user.toString());
        return userMapper.getLogin(user);
    }
}
