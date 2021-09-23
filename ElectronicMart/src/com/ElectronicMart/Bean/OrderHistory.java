package com.ElectronicMart.Bean;

public class OrderHistory {
	private int oid;
	private String oimage;
	private String oname;
	private int oquantity;
	private int oprice;
	private String odate;
	private String ostatus;
	private String oemail;
	
	public int getOid() {
		return oid;
	}

	public void setOid(int oid) {
		this.oid = oid;
	}

	public String getOimage() {
		return oimage;
	}

	public void setOimage(String oimage) {
		this.oimage = oimage;
	}

	public String getOname() {
		return oname;
	}

	public void setOname(String oname) {
		this.oname = oname;
	}

	public int getOquantity() {
		return oquantity;
	}

	public void setOquantity(int oquantity) {
		this.oquantity = oquantity;
	}

	public int getOprice() {
		return oprice;
	}

	public void setOprice(int oprice) {
		this.oprice = oprice;
	}
	

	public String getOdate() {
		return odate;
	}

	public void setOdate(String odate) {
		this.odate = odate;
	}

	public String getOstatus() {
		return ostatus;
	}

	public void setOstatus(String ostatus) {
		this.ostatus = ostatus;
	}

	public String getOemail() {
		return oemail;
	}

	public void setOemail(String oemail) {
		this.oemail = oemail;
	}

	public OrderHistory() {
		super();
	}

	public OrderHistory(String oimage, String oname, int oquantity, int oprice, String odate, String ostatus, String oemail) {
		super();
		this.oimage = oimage;
		this.oname = oname;
		this.oquantity = oquantity;
		this.oprice = oprice;
		this.odate = odate;
		this.ostatus = ostatus;
		this.oemail = oemail;
	}
	
	public OrderHistory(int oid, String oimage, String oname, int oquantity, int oprice, String odate, String ostatus,
			String oemail) {
		super();
		this.oid = oid;
		this.oimage = oimage;
		this.oname = oname;
		this.oquantity = oquantity;
		this.oprice = oprice;
		this.odate = odate;
		this.ostatus = ostatus;
		this.oemail = oemail;
	}
	

}
