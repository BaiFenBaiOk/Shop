package com.shop.pojo;

import java.util.List;


//包装
public class QuervVo {
	private User user;
	private List<String> ids;

	

	public List<String> getIds() {
		return ids;
	}

	public void setIds(List<String> ids) {
		this.ids = ids;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
