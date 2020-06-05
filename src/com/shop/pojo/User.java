package com.shop.pojo;

public class User {
	private String uid;
	private String username;
	private String password;
	private String iphone;
	private String email;
	private String code;
	private String state;
	private Integer type;

	public String getUid() {
		return uid;
	}

	public String getUsername() {
		return username;
	}

	public String getPassword() {
		return password;
	}

	public String getIphone() {
		return iphone;
	}

	public String getEmail() {
		return email;
	}

	public String getCode() {
		return code;
	}

	public String getState() {
		return state;
	}

	public Integer getType() {
		return type;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setIphone(String iphone) {
		this.iphone = iphone;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public void setState(String state) {
		this.state = state;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "User{" +
				"uid='" + uid + '\'' +
				", username='" + username + '\'' +
				", password='" + password + '\'' +
				", iphone='" + iphone + '\'' +
				", email='" + email + '\'' +
				", code='" + code + '\'' +
				", state='" + state + '\'' +
				", type=" + type +
				'}';
	}
}
