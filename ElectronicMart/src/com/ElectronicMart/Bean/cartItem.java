package com.ElectronicMart.Bean;

public class cartItem {
	
	private int cid;
	private String cimage;
	private String cname;
	private int cprice;
	private int cquantity;
	private int csubtotal;
	private String email;
	
	
	public cartItem() {
		super();
	}
	
	public cartItem(String cimage, String cname, int cprice, int cquantity, int csubtotal, String email) {
		super();
		this.cimage = cimage;
		this.cname = cname;
		this.cprice = cprice;
		this.cquantity = cquantity;
		this.csubtotal = csubtotal;
		this.email = email;
	}
	
	
	public cartItem(int cid, String cimage, String cname, int cprice, int cquantity, int csubtotal, String email) {
		super();
		this.cid = cid;
		this.cimage = cimage;
		this.cname = cname;
		this.cprice = cprice;
		this.cquantity = cquantity;
		this.csubtotal = csubtotal;
		this.email = email;
	}
	
	
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCimage() {
		return cimage;
	}
	public void setCimage(String cimage) {
		this.cimage = cimage;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public int getCprice() {
		return cprice;
	}
	public void setCprice(int cprice) {
		this.cprice = cprice;
	}
	public int getCquantity() {
		return cquantity;
	}
	public void setCquantity(int cquantity) {
		this.cquantity = cquantity;
	}
	public int getCsubtotal() {
		return csubtotal;
	}
	public void setCsubtotal(int csubtotal) {
		this.csubtotal = csubtotal;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	

}
