package com.ElectronicMart.Bean;

public class EUser {
	private int eid;
	private String userName;
	private String email;
	private String password;
	private String confirmPassword;
	private String term;
	private String address;
	private int pincode;
	private long contact;
	private double total;
	private String city;
	private String state;
	
		
	public EUser() {
		super();
	}
	
	
	public EUser(String userName, String email, String password, String confirmPassword, String term, String address, int pincode, long contact, double total, String city, String state) {
		super();
		this.userName = userName;
		this.email = email;
		this.password = password;
		this.confirmPassword = confirmPassword;
		this.term = term;
		this.address = address;
		this.pincode = pincode;
		this.contact = contact;
		this.total = total;
		this.city = city;
		this.state = state;
	}
	
	public EUser(int eid, String userName, String email, String password, String confirmPassword, String term, String address, int pincode, long contact, double total, String city, String state) {
		super();
		this.eid = eid;
		this.userName = userName;
		this.email = email;
		this.password = password;
		this.confirmPassword = confirmPassword;
		this.term = term;
		this.address = address;
		this.pincode = pincode;
		this.contact = contact;
		this.total = total;
		this.city = city;
		this.state = state;
	}
	
	
	public int getEid() {
		return eid;
	}
	public void setEid(int eid) {
		this.eid = eid;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
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
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	public String getTerm() {
		return term;
	}
	public void setTerm(String term) {
		this.term = term;
	}
	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public int getPincode() {
		return pincode;
	}


	public void setPincode(int pincode) {
		this.pincode = pincode;
	}


	public long getContact() {
		return contact;
	}


	public void setContact(long contact) {
		this.contact = contact;
	}


	public double getTotal() {
		return total;
	}


	public void setTotal(double total) {
		this.total = total;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public String getState() {
		return state;
	}


	public void setState(String state) {
		this.state = state;
	}



}
