package com.ElectronicMart.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.ElectronicMart.Bean.cartItem;
import com.ElectronicMart.Connection.EConnection;

public class ShoppingCart {
	int allTotal;
	
	static EConnection connection = new EConnection();
	
//	=============================================Add to Cart Operation===========================================
	
	public boolean insertCart(cartItem cart) {
			
			boolean f= false;
			String sql = "insert into shoppingcart(cimage, cname, cprice, cquantity, csubtotal, email) value(?,?,?,?,?,?)";
			
			try {
				
				PreparedStatement stmt=connection.getCon().prepareStatement(sql);
				stmt.setString(1, cart.getCimage());
				stmt.setString(2, cart.getCname());
				stmt.setInt(3, cart.getCprice());
				stmt.setInt(4, cart.getCquantity());
				stmt.setInt(5, cart.getCsubtotal());
				stmt.setString(6, cart.getEmail());
				stmt.executeUpdate();
				
				connection.getCon().close();
				f=true;
				
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			return f;
			
			}
	
//	=============================================Get All Cart Operation=======================================
	public static List<cartItem> getAllCart(String email){  
	    List<cartItem> list=new ArrayList<cartItem>();  
	    String sql = "select * from shoppingcart where email=?";
	      
	    try{  
	          
	    	PreparedStatement stmt=connection.getCon().prepareStatement(sql); 
	    	stmt.setString(1, email);
	        ResultSet rs=stmt.executeQuery();  
	        while(rs.next()){  
	        	cartItem item = new cartItem(); 
	        	
	        	int id=rs.getInt(1);
	        	item.setCid(id);
	        	
	        	String image = rs.getString(2);
	        	item.setCimage(image);
	        	
	        	String name = rs.getString(3);
	        	item.setCname(name);
	        	
	        	int price = rs.getInt(4);
	        	item.setCprice(price);
	        	
	        	int quantity = rs.getInt(5);
	        	item.setCquantity(quantity);
	        	
	        	int subTotal = rs.getInt(6);
	        	item.setCsubtotal(subTotal);
	        	
	        	String myEmail = rs.getString(7);
	        	item.setEmail(myEmail);
	        	System.out.println(id+" "+image+" "+name+" "+price+" "+quantity+" "+subTotal+" "+myEmail);
	            list.add(item);
	            
	        }    
	    }catch(Exception e){e.printStackTrace();}  
	      
	    return list;  
	} 
	
//	==========================================DElete=Operation============================================
	
		 public static int deleteCart(int id){  
	        int status=0;  
	        try{  
	            String sql = "delete from shoppingcart where cid=?";
	            PreparedStatement stmt=connection.getCon().prepareStatement(sql);  
	            stmt.setInt(1, id);
	            status=stmt.executeUpdate();  
	              
	            connection.getCon().close();  
	        }catch(Exception e){e.printStackTrace();}  
	          
	        return status;  
	    }  
		 
//  ============================================Update=Cart=Opeartion=============================================
		 
		 public static int updateCart(cartItem cart){  
		        int status=0;  
		        try{  
		            String sql = "update shoppingcart set cquantity=?, csubtotal=? where cid=?";
		            PreparedStatement stmt=connection.getCon().prepareStatement(sql);  
		            stmt.setInt(1, cart.getCquantity());
		            stmt.setInt(2, cart.getCsubtotal());
		            stmt.setInt(3, cart.getCid());
		            status=stmt.executeUpdate();  
		              
		            connection.getCon().close();  
		        }catch(Exception e){e.printStackTrace();}  
		          
		        return status;  
		    }  
		 
	 

}
