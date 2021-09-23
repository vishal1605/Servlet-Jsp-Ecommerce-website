package com.ElectronicMart.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ElectronicMart.Bean.EProduct;
import com.ElectronicMart.Bean.EUser;
import com.ElectronicMart.Connection.EConnection;



public class UserDao {
	EUser user = new EUser();
	static EConnection connection = new EConnection();
	
public boolean insertUser(EUser user) {
		
		boolean f= false;
		String sql = "insert into ecomdb(userName, email, password, confirmPassword, term) value(?,?,?,?,?)";
		
		try {
			System.out.println("3");
			PreparedStatement stmt=connection.getCon().prepareStatement(sql);
			stmt.setString(1, user.getUserName());
			stmt.setString(2, user.getEmail());
			stmt.setString(3, user.getPassword());
			stmt.setString(4, user.getConfirmPassword());
			stmt.setString(5, user.getTerm());
			stmt.executeUpdate();
			
			connection.getCon().close();
			f=true;
			System.out.println("5");
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return f;
		
		}
//  =========================================Shopping details===========================================

public static int updateAddress(EUser user) {
	int status=0;
	try {
		String sql = "update ecomdb set address=?, pincode=?, contact=?, total=?, city=?, state=? where email=?";
		
		PreparedStatement statement=connection.getCon().prepareStatement(sql);
		statement.setString(1, user.getAddress());
		statement.setInt(2, user.getPincode());
		statement.setLong(3, user.getContact());
		statement.setDouble(4, user.getTotal());
		statement.setString(5, user.getCity());
		statement.setString(6, user.getState());
		statement.setString(7, user.getEmail());
		status=statement.executeUpdate();		
	    
		connection.getCon().close();

	} catch (Exception e) {
		
		e.printStackTrace();
	}
	return status;
}


//===================================Login Start here================================================================

	public EUser loginUser(String lEmail, String lPassword) {
		EUser user = null;
		String sql = "select * from ecomdb where email=? and password=?";
		try {
			PreparedStatement statement = connection.getCon().prepareStatement(sql);
			statement.setString(1, lEmail);
			statement.setString(2, lPassword);
			ResultSet set=statement.executeQuery();
			if(set.next()) {
				 user = new EUser();
				int id = set.getInt(1);
				user.setEid(id);
				
				String name= set.getString(2);
				user.setUserName(name);
				
				String email = set.getString(3);
				user.setEmail(email);
				
				
				String password = set.getString(4);
				user.setPassword(password);
				
				String passwords = set.getString(5);
				user.setConfirmPassword(passwords);
				
				String term = set.getString(6);
				user.setTerm(term);
				
				String address = set.getString(7);
				user.setAddress(address);
				
				int pincode = set.getInt(8);
				user.setPincode(pincode);
				
				long contact  = set.getLong(9);
				user.setContact(contact);
				
				double total = set.getDouble(10);
				user.setTotal(total);
				
				String city = set.getString(11);
				user.setCity(city);
				
				String state = set.getString(12);
				user.setState(state);

				System.out.println("name: "+name + " email: "+email + " password: " +password + " confirm-password: " +passwords);
				
			}
			connection.getCon().close();
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return user;
		
	}
	
	//========================================================Update password Start here=============================================================
	
	public static boolean updateUser(EUser user) {
		boolean rowUpdate= false;
		
		String sql = "update ecomdb set password=?, confirmPassword=? where email=?";
		try {
			PreparedStatement statement=connection.getCon().prepareStatement(sql);
			statement.setString(1, user.getPassword());
			statement.setString(2, user.getConfirmPassword());
			statement.setString(3, user.getEmail());
			
			rowUpdate=statement.executeUpdate()>0;
			
			connection.getCon().close();
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return rowUpdate;
	}
//===============================================================Dashboard id access==========================================================
	public EUser viewUser(int fid) {
		EUser user = null;
		String sql = "select * from ecomdb where eid=?";
		try {
			PreparedStatement statement = connection.getCon().prepareStatement(sql);
			statement.setInt(1, fid);
			ResultSet set=statement.executeQuery();
			if(set.next()) {
				 user = new EUser();
				int id = set.getInt(1);
				user.setEid(id);
				
				String name= set.getString(2);
				user.setUserName(name);
				
				String email = set.getString(3);
				user.setEmail(email);
				
				
				String password = set.getString(4);
				user.setPassword(password);
				
				String passwords = set.getString(5);
				user.setConfirmPassword(passwords);
				
				String term = set.getString(6);
				user.setTerm(term);
				
				String address = set.getString(7);
				user.setAddress(address);
				
				int pincode = set.getInt(8);
				user.setPincode(pincode);
				
				long contact  = set.getLong(9);
				user.setContact(contact);
				
				double total = set.getDouble(10);
				user.setTotal(total);
				
				String city = set.getString(11);
				user.setCity(city);
				
				String state = set.getString(12);
				user.setState(state);

				System.out.println("name: "+name + " email: "+email + " password: " +password + " confirm-password: " +passwords);
				
			}
			connection.getCon().close();
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return user;
		
	}
	
public boolean updateProfile(EUser user) {
		
		boolean f=false;
		try {
			String sql = "update ecomdb set userName=?, email=? where eid=?";
			
			PreparedStatement statement=connection.getCon().prepareStatement(sql);
			statement.setString(1, user.getUserName());
			statement.setString(2, user.getEmail());
			statement.setInt(3, user.getEid());
			statement.executeUpdate();
			f=true;
			connection.getCon().close();

		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return f;
	}


public List<EUser> getAllUser(){
	List<EUser> list=new ArrayList<EUser>(); 
	String sql = "select * from ecomdb";
	try {
		PreparedStatement statement = connection.getCon().prepareStatement(sql);
		ResultSet rs=statement.executeQuery();
		while(rs.next()) {
			EUser user = new EUser();
			user.setEid(rs.getInt(1));
			user.setUserName(rs.getString(2));
			user.setEmail(rs.getString(3));
			user.setPassword(rs.getString(4));
			user.setConfirmPassword(rs.getString(5));
			list.add(user);
			
		}
	}catch(Exception e) {
		e.printStackTrace();
	}
	return list;
	
}


}
