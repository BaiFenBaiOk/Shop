package com.shop.mapper;

import java.util.List;

import com.shop.pojo.GoodType;
import com.shop.pojo.Goods;
import com.shop.pojo.Order;
import com.shop.pojo.User;

public interface UserMapper {
	User getLogin(User user);
	void saveUser(User user);
	void saveActive(String code);
	List<User> findAllUser();
	User findUserByUid(User user);
	 void saveUserByUid(User user);
	 List<User> findAllUsers(int page,int size);
	 List<Order> findAllOrder();
	 Order findOrderById(Order order);
	 List<GoodType> findAllGoodType();
	 GoodType findGoodTypeById(GoodType goodType);
	 void saveGoodTypeByUid(GoodType goodType);
	 List<Goods> findAllGood();
	 Goods findGoodById(Goods good);
	 void saveGoodByUid(Goods good);
	 void sendOrderById(Order order);
	 void addGoodTypeNew(GoodType goodType);
}
