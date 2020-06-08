package com.shop.mapper;

import java.util.List;

import com.shop.pojo.User;

public interface UserMapper {
	User getLogin(User user);
	void saveUser(User user);
	void saveActive(String code);
	List<User> findAllUser();
	User findUserByUid(User user);
	 void saveUserByUid(User user);
}
