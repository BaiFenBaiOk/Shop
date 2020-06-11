package com.shop.pojo;

import java.sql.Date;

public class Order {
	private static Order order=new Order();
	public static Order getOrder() {
		return order;
	}
	private String id;
	private String oId;
	private String uId;
	private Date createTime;
	private Integer count;
	private double totol;
	private Integer state;
	private User user;
	private OrderItem orderItem;
	private GoodType goodType;
	private Goods goods;
	
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	public OrderItem getOrderItem() {
		return orderItem;
	}
	public void setOrderItem(OrderItem orderItem) {
		this.orderItem = orderItem;
	}
	public GoodType getGoodType() {
		return goodType;
	}
	public void setGoodType(GoodType goodType) {
		this.goodType = goodType;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getoId() {
		return oId;
	}
	public void setoId(String oId) {
		this.oId = oId;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public double getTotol() {
		return totol;
	}
	public void setTotol(double totol) {
		this.totol = totol;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "Order [id=" + id + ", oId=" + oId + ", uId=" + uId + ", createTime=" + createTime + ", count=" + count
				+ ", totol=" + totol + ", state=" + state + ", user=" + user + "]";
	}
	
	
}
