package com.glostock.model;

import java.sql.Timestamp;

public class UserVO {

	private String username;  
	private String nickname;
	private String email;
	private String password; 
	private String phone; 
	private String dataagree; 
	private Timestamp regdate;
	private String newpassword; 
	private String newpassword2; 
	
	
	public UserVO() {
	
	}

	public UserVO(String username, String nickname, String email, String password, String phone, String dataagree,
			Timestamp regdate) {
		super();
		this.username = username;
		this.nickname = nickname;
		this.email = email;
		this.password = password;
		this.phone = phone;
		this.dataagree = dataagree;
		this.regdate = regdate;
		this.newpassword = newpassword;
		this.newpassword2= newpassword2;
	}

	
	public String getNewpassword() {
		return newpassword;
	}

	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}

	public String getNewpassword2() {
		return newpassword2;
	}

	public void setNewpassword2(String newpassword2) {
		this.newpassword2 = newpassword2;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getDataagree() {
		return dataagree;
	}

	public void setDataagree(String dataagree) {
		this.dataagree = dataagree;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	
	
}
