package com.shop.service;

import java.util.List;

import com.shop.pojo.GoodType;
import com.shop.pojo.Goods;
import com.shop.pojo.Order;
import com.shop.pojo.ProviceOfUser;
import com.shop.pojo.QuervVo;
import com.shop.pojo.TypeOfAll;
import com.shop.pojo.User;

public interface UserService {
	//登录
    User getLogin(User user);
    //注册
    void saveUser(User user);
    //激活
    void saveActive(String code);
    
    List<User> findAllUser();
    List<User> findAllUsers(int page,int size);
    
    List<Order> findAllList(int page,int size);
    
    User findUserByUid(User user);
    
    Order findOrderById(Order order);
    
    List<GoodType> findAllGoodType(int page, int size);
    List<Goods> findAllGood(int page, int size);
    GoodType findGoodTypeById(GoodType goodType);
    Goods findGoodById(Goods good);
    void saveUserByUid(User user);
    
    void saveGoodTypeByUid(GoodType goodType);
    void saveGoodByUid(Goods good);
    void sendOrderById(Order order);
    void addGoodTypeNew(GoodType goodType);
    void addGoodss(Goods good);
    void delUserByUid(QuervVo Vo);
    void delGoodTypeByUid(QuervVo Vo);
    void delGoodByUid(QuervVo Vo);
    void delListByUid(QuervVo Vo);
    void addGoodNew(Goods good);
    List<Order> findAll(int page,int size);
    void savaUserPwdByUid(User user);
    GoodType findGoodTypeById(Goods goods);
    List<GoodType> findGoodType();
    List<TypeOfAll> findTypeOfAll();
    List<ProviceOfUser> findProviceOfUser();
    List<User> findUserByName(User user,int page,int size);
}
