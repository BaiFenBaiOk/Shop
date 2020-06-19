package com.shop.pojo;

public class ProviceOfUser {
	private String address;
	private String count;
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "ProviceOfUser [address=" + address + ", count=" + count + "]";
	}
	
}
