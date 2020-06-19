package com.shop.service.impl;

import com.github.pagehelper.PageHelper;
import com.shop.mapper.UserMapper;
import com.shop.pojo.GoodType;
import com.shop.pojo.Goods;
import com.shop.pojo.Order;
import com.shop.pojo.OrderItem;
import com.shop.pojo.ProviceOfUser;
import com.shop.pojo.QuervVo;
import com.shop.pojo.TypeOfAll;
import com.shop.pojo.User;
import com.shop.service.UserService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User getLogin(User user) {
    	System.out.println(user.toString());
        return userMapper.getLogin(user);
    }

	@Override
	public void saveUser(User user) {
		System.out.println(user.toString());
		userMapper.saveUser(user);
	}

	@Override
	public void saveActive(String code) {
		// TODO Auto-generated method stub
		userMapper.saveActive(code);
	}

	@Override
	public List<User> findAllUser() {
		// TODO Auto-generated method stub
		return userMapper.findAllUser();
	}

	@Override
	public User findUserByUid(User user) {
		return userMapper.findUserByUid(user);
	}

	@Override
	public void saveUserByUid(User user) {
		userMapper.saveUserByUid(user);
	}

	@Override
	public List<User> findAllUsers(int page, int size) {
		PageHelper.startPage(page, size);
		return userMapper.findAllUser();
	}

	@Override
	public List<Order> findAllList(int page, int size) {
		PageHelper.startPage(page, size);
		return userMapper.findAllOrder();
	}

	@Override
	public Order findOrderById(Order order) {
		return userMapper.findOrderById(order);
	}

	@Override
	public List<GoodType> findAllGoodType(int page, int size) {
		PageHelper.startPage(page, size);
		return userMapper.findAllGoodType();
	}

	@Override
	public GoodType findGoodTypeById(GoodType goodType) {
		 return userMapper.findGoodTypeById(goodType);
	}

	@Override
	public void saveGoodTypeByUid(GoodType goodType) {
		System.out.println(goodType.toString());
		userMapper.saveGoodTypeByUid(goodType);
	}

	@Override
	public List<Goods> findAllGood(int page, int size) {
		PageHelper.startPage(page, size);
		return userMapper.findAllGood();
	}

	@Override
	public Goods findGoodById(Goods good) {
		return userMapper.findGoodById(good);
	}

	@Override
	public void saveGoodByUid(Goods good) {
		userMapper.saveGoodByUid(good);
	}

	@Override
	public void sendOrderById(Order order) {
		userMapper.sendOrderById(order);
	}

	@Override
	public void addGoodTypeNew(GoodType goodType) {
		userMapper.addGoodTypeNew(goodType);
	}

	@Override
	public void addGoodss(Goods good) {
		userMapper.addGoodss(good);
	}

	@Override
	public void delUserByUid(QuervVo Vo) {
		userMapper.delUserByUid(Vo);
	}

	@Override
	public void delGoodTypeByUid(QuervVo Vo) {
		userMapper.delGoodTypeByUid(Vo);
	}

	@Override
	public void delGoodByUid(QuervVo Vo) {
		userMapper.delGoodByUid(Vo);
	}

	@Override
	public void delListByUid(QuervVo Vo) {
		userMapper.delListByUid(Vo);
	}

	@Override
	public void addGoodNew(Goods good) {
		userMapper.addGoodNew(good);
	}

	@Override
	public List<Order> findAll(int page, int size) {
		PageHelper.startPage(page, size);
		List<Order> orders= userMapper.findAllByOrder();
		for(Order order : orders) {
			User user = userMapper.findUserByOrder(order.getuId());
			order.setUser(user);
			OrderItem orderItem = userMapper.findItemByOrder(order.getoId());
			order.setOrderItem(orderItem);
			Goods good = userMapper.findGoodByOrder(order.getOrderItem());
			order.setGoods(good);
			GoodType goodType =  userMapper.findGoodTypeByOrder(order.getGoods());
			order.setGoodType(goodType);
		}
		return orders;
	}

	@Override
	public void savaUserPwdByUid(User user) {
		userMapper.saveUserPwdByUid(user);
	}

	@Override
	public GoodType findGoodTypeById(Goods goods) {
		return userMapper.findGoodTypeByIdd(goods);
	}

	@Override
	public List<GoodType> findGoodType() {
		return userMapper.findGoodType();
	}

	@Override
	public List<TypeOfAll> findTypeOfAll() {
		// TODO Auto-generated method stub
		return userMapper.findTypeOfAll();
	}

	@Override
	public List<ProviceOfUser> findProviceOfUser() {
		// TODO Auto-generated method stub
		return userMapper.findProviceOfUser();
	}

	@Override
	public List<User> findUserByName(User user,int page, int size) {
		PageHelper.startPage(page, size);
		return userMapper.findUserByName(user);
	}
}
