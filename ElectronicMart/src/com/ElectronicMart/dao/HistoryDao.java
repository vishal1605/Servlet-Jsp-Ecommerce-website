package com.ElectronicMart.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ElectronicMart.Bean.OrderHistory;
import com.ElectronicMart.Connection.EConnection;

public class HistoryDao {
	
	static EConnection connection = new EConnection();
	
	public boolean insertUser(OrderHistory history) {
			
			boolean f= false;
			String sql = "insert into orderhistory(oimage, oname, oquantity, oprice, ostatus, oemail) value(?,?,?,?,?,?)";
			
			try {
				
				PreparedStatement stmt=connection.getCon().prepareStatement(sql);
				stmt.setString(1, history.getOimage());
				stmt.setString(2, history.getOname());
				stmt.setInt(3, history.getOquantity());
				stmt.setInt(4, history.getOprice());
				stmt.setString(5, history.getOstatus());
				stmt.setString(6, history.getOemail());
				stmt.executeUpdate();
				connection.getCon().close();
				f=true;
			} catch (Exception e) {	
				e.printStackTrace();
			}
			return f;
			
			}
//	==============================List of history========================================
	
	public static List<OrderHistory> getAllHistory(String email){  
	    List<OrderHistory> historylist=new ArrayList<OrderHistory>();  
	    String sql = "select * from orderhistory where oemail=?";
	      
	    try{  
	          
	    	PreparedStatement stmt=connection.getCon().prepareStatement(sql); 
	    	stmt.setString(1, email);
	        ResultSet rs=stmt.executeQuery();  
	        while(rs.next()){  
	        	OrderHistory order = new OrderHistory(); 
	        	
	        	int hId=rs.getInt(1);
	        	order.setOid(hId);
	        	
	        	String hImage = rs.getString(2);
	        	order.setOimage(hImage);
	        	
	        	String hName = rs.getString(3);
	        	order.setOname(hName);
	        	
	        	int hQuantity = rs.getInt(4);
	        	order.setOquantity(hQuantity);
	        	
	        	int hPrice = rs.getInt(5);
	        	order.setOprice(hPrice);
	        	
	        	String hDate = rs.getString(6);
	        	order.setOdate(hDate);
	        	
	        	String hStatus = rs.getString(7);
	        	order.setOstatus(hStatus);
	        	
	        	String hEmail = rs.getString(8);
	        	order.setOemail(hEmail);
	        	
	        	System.out.println(hId+" "+hImage+" "+hName+" "+hQuantity+" "+hPrice+" "+hDate+" "+hStatus+" "+hEmail);
	            historylist.add(order);
	            
	        }    
	    }catch(Exception e){e.printStackTrace();}  
	      
	    return historylist;  
	} 
	
//======================================Delete History=====================================
	
	
	public static int deleteHistory(int id){  
        int status=0;  
        try{  
            String sql = "delete from orderhistory where oid=?";
            PreparedStatement stmt=connection.getCon().prepareStatement(sql);  
            stmt.setInt(1, id);
            status=stmt.executeUpdate();  
              
            connection.getCon().close();  
        }catch(Exception e){e.printStackTrace();}  
          
        return status;  
    }  


}
