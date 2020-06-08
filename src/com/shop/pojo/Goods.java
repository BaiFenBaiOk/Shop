package com.shop.pojo;

public class Goods {
	private static Goods goods=new Goods();
	public static Goods getGoods() {
		return goods;
	}
	private String gId;
	private String gName;
	private double price;
	private String photo;
	private Integer count;
	private String goodId;
	public String getgId() {
		return gId;
	}
	public void setgId(String gId) {
		this.gId = gId;
	}
	public String getgName() {
		return gName;
	}
	public void setgName(String gName) {
		this.gName = gName;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public String getGoodId() {
		return goodId;
	}
	public void setGoodId(String goodId) {
		this.goodId = goodId;
	}
	@Override
	public String toString() {
		return "Goods [gId=" + gId + ", gName=" + gName + ", price=" + price + ", photo=" + photo + ", count=" + count
				+ ", goodId=" + goodId + "]";
	}
	
}