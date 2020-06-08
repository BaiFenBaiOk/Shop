package com.shop.pojo;

public class GoodType {
	private static GoodType goodType=new GoodType();
	public static GoodType getGoodType() {
		return goodType;
	}
	private String goodId;
	private String goodName;
	public String getGoodId() {
		return goodId;
	}
	public void setGoodId(String goodId) {
		this.goodId = goodId;
	}
	public String getGoodName() {
		return goodName;
	}
	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}
	@Override
	public String toString() {
		return "GoodType [goodId=" + goodId + ", goodName=" + goodName + "]";
	}
	
}
