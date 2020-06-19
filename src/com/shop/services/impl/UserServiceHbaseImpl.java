package com.shop.services.impl;

import com.shop.dao.UserDaoHbase;
import com.shop.domian.User;
import com.shop.services.UserService;


public class UserServiceHbaseImpl implements UserService  {

	private UserDaoHbase userDaoregist = new UserDaoHbase();

	@Override
	public String userLogin(User user) throws Exception {
		return userDaoregist.getResultScann("user",user.getUsername(),user.getPassword());
	}
	
	
}
