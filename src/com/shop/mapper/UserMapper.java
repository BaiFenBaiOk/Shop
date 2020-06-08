package com.shop.mapper;

import com.shop.pojo.User;

public interface UserMapper {
	User getLogin(User user);
	void saveUser(User user);
	void saveActive(String code);
}
