package com.SportyShoes.MODELS;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int user_id;
	
	private String user_Realname;
	private String username;
	private String password;
	private String user_type;
	private String phonenumber;
	private String user_city;
	private Date user_dob;
	
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(int user_id, String user_Realname, String username, String password, String user_type,
			String phonenumber, String user_city, Date user_dob) {
		super();
		this.user_id = user_id;
		this.user_Realname = user_Realname;
		this.username = username;
		this.password = password;
		this.user_type = user_type;
		this.phonenumber = phonenumber;
		this.user_city = user_city;
		this.user_dob = user_dob;
	}
	
	public User(String user_Realname, String username, String password, String user_type, String phonenumber,
			String user_city, Date user_dob) {
		super();
		this.user_Realname = user_Realname;
		this.username = username;
		this.password = password;
		this.user_type = user_type;
		this.phonenumber = phonenumber;
		this.user_city = user_city;
		this.user_dob = user_dob;
	}
	
	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", user_Realname=" + user_Realname + ", username=" + username
				+ ", password=" + password + ", user_type=" + user_type + ", phonenumber=" + phonenumber
				+ ", user_city=" + user_city + ", user_dob=" + user_dob + "]";
	}
	
	


	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	
	public String getUser_Realname() {
		return user_Realname;
	}

	public void setUser_Realname(String user_Realname) {
		this.user_Realname = user_Realname;
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


	public String getUser_type() {
		return user_type;
	}


	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}


	public String getPhonenumber() {
		return phonenumber;
	}


	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}


	public String getUser_city() {
		return user_city;
	}


	public void setUser_city(String user_city) {
		this.user_city = user_city;
	}

	public Date getUser_dob() {
		return user_dob;
	}

	public void setUser_dob(Date user_dob) {
		this.user_dob = user_dob;
	}
	
	
}
