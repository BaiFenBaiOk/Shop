package com.shop.pojo;

public class OrderItem {
	
	public OrderItem getOrderItem() {
		return orderItem;
	}
	public void setOrderItem(OrderItem orderItem) {
		this.orderItem = orderItem;
	}
	private String oId;
	private String gId;
	private String uId;
	private Integer count;
	private OrderItem orderItem;
	public String getoId() {
		return oId;
	}
	public void setoId(String oId) {
		this.oId = oId;
	}
	public String getgId() {
		return gId;
	}
	public void setgId(String gId) {
		this.gId = gId;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "OrderItem [oId=" + oId + ", gId=" + gId + ", uId=" + uId + ", count=" + count + "]";
	}
	
	
}
