package com.shop.pojo;

public class TypeOfAll {
	private String type;
	private String count;
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "TypeOfAll [type=" + type + ", count=" + count + "]";
	}
}
