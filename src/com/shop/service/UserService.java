package com.shop.service;

import java.util.List;

import com.shop.pojo.GoodType;
import com.shop.pojo.Goods;
import com.shop.pojo.User;

public interface UserService {
	//登录
    User getLogin(User user);
    //注册
    void saveUser(User user);
    //激活
    void saveActive(String code);
    
    List<User> findAllUser();
    
    User findUserByUid(User user);
    
    void saveUserByUid(User user);
    //菜单（导航条）
    List<GoodType> menu();
    //商品列表
    List<Goods> goodsList();
    //详情
    Goods getGood(Goods good);
    
}