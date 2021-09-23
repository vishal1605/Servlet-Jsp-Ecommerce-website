package com.ElectronicMart.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ElectronicMart.Bean.EProduct;
import com.ElectronicMart.Bean.EUser;
import com.ElectronicMart.Connection.EConnection;

public class ProductDao {
	
	EProduct product = new EProduct();
	static EConnection connection = new EConnection();
	
public boolean addProduct(EProduct product) {
		
		boolean f= false;
		String sql = "insert into myproduct(name, description, price, image, category) value(?,?,?,?,?)";
		
		try {
			
			PreparedStatement stmt=connection.getCon().prepareStatement(sql);
			stmt.setString(1, product.getName());
			stmt.setString(2, product.getDescription());
			stmt.setInt(3, product.getPrice());
			stmt.setString(4, product.getImage());
			stmt.setString(5, product.getCategory());
			stmt.executeUpdate();
			
			connection.getCon().close();
			f=true;
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return f;
		
		}


public static List<EProduct> getAllProduct(){  
    List<EProduct> list=new ArrayList<EProduct>();  
    String sql = "select * from myproduct";
      
    try{  
          
    	PreparedStatement stmt=connection.getCon().prepareStatement(sql);  
        ResultSet rs=stmt.executeQuery();  
        while(rs.next()){  
        	EProduct product = new EProduct();  
            product.setId(rs.getInt(1));  
            product.setName(rs.getString(2)); 
            product.setDescription(rs.getString(3));
            product.setPrice(rs.getInt(4));
            product.setImage(rs.getString(5));
            product.setCategory(rs.getString(6));
            
            list.add(product);  
        }    
    }catch(Exception e){e.printStackTrace();}  
      
    return list;  
} 

public static List<EProduct> getProductByCat(String category){  
    List<EProduct> catList=new ArrayList<EProduct>();  
    String sql = "select * from myproduct where category=?";
      
    try{  
          
    	PreparedStatement stmt=connection.getCon().prepareStatement(sql);  
    	stmt.setString(1, category);
        ResultSet rs=stmt.executeQuery();  
        while(rs.next()){  
        	EProduct product = new EProduct();  
            product.setId(rs.getInt(1));  
            product.setName(rs.getString(2)); 
            product.setDescription(rs.getString(3));
            product.setPrice(rs.getInt(4));
            product.setImage(rs.getString(5));
            product.setCategory(rs.getString(6));
            
            catList.add(product);  
        }    
    }catch(Exception e){e.printStackTrace();}  
      
    return catList;  
} 

public static boolean updateProduct(EProduct product) {
	boolean rowUpdate=false;
	try {
		String sql = "update myproduct set name=?, description=?, price=?, image=?, category=? where id=?";
		
		PreparedStatement statement=connection.getCon().prepareStatement(sql);
		statement.setString(1, product.getName());
		statement.setString(2, product.getDescription());
		statement.setInt(3, product.getPrice());
		statement.setString(4, product.getImage());
		statement.setString(5, product.getCategory());
		statement.setInt(6, product.getId());
		rowUpdate=statement.executeUpdate()>0;		
	
		connection.getCon().close();

	} catch (Exception e) {
		
		e.printStackTrace();
	}
	return rowUpdate;
}

public EProduct viewUser(int pid) {
	EProduct product = new EProduct();
	String sql = "select * from myproduct where id=?";
	try {
		PreparedStatement statement = connection.getCon().prepareStatement(sql);
		statement.setInt(1, pid);
		ResultSet set=statement.executeQuery();
		if(set.next()) {
			 product.setId(set.getInt(1));
			 product.setName(set.getString(2));
			 product.setDescription(set.getString(3));
			 product.setPrice(set.getInt(4));
			 product.setImage(set.getString(5));
			 product.setCategory(set.getString(6));
			 System.out.println(set.getInt(1));
			
			
		}
		connection.getCon().close();
	} catch (Exception e) {
		
		e.printStackTrace();
	}
	return product;
	
}


}
