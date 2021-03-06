package com.shop.domian;

import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

public class User implements HttpSessionBindingListener {
	
	private String uid;
	private String username;
	private String password;
	private String email;
	private String code;
	private int state;
	
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
	@Override
	public String toString() {
		return "User [uid=" + uid + ", username=" + username + ", password="
				+ password + ", email=" + email + ", code=" + code + ", state="
				+ state + "]";
	}
	@Override
	public void valueBound(HttpSessionBindingEvent hsbe) {
		
		System.out.println("放入到session中了~~~");
	}
	@Override
	public void valueUnbound(HttpSessionBindingEvent hsbe) {
		
		System.out.println("从session中取出来了~~~");
	}
	
}
