package com.grocery.dao;
import java.sql.*;

import com.grocery.entities.user;
public class userDao {
	private Connection con;

	public userDao(Connection con) {
		
		this.con = con;
	}
	
	//method to insert database 
	public boolean saveUser(user user) {
		
		boolean f=false;
		
		
		try {
			String query="insert into users(name,email,password)values (?,?,?)";
			
			
			PreparedStatement ptm=this.con.prepareStatement(query);
			
			ptm.setString(1, user.getName());
			ptm.setString(2, user.getEmail());
			ptm.setString(3, user.getPassword());
			
			ptm.executeUpdate();
			f=true;
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		return f;
	}
	
	//get user by email and password
	
	public user getUserByEmailAndPassword(String email,String password) {
		user user=null;
		try {
			
			String query="select * from users where email=? and password=?";
			PreparedStatement pst=con.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2, password);
		ResultSet set=pst.executeQuery();		

		if(set.next()) {
			user =new user();
			String name=set.getString("name");
			user.setName(name);
			user.setId(set.getInt("id"));
			user.setEmail(set.getString("email"));
			user.setPassword(set.getString("password"));
			
			
		}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		
		return user;
		
	}
	
	public int getTotalUsers() {

	    int total = 0;

	    try {

	        String sql = "SELECT COUNT(*) FROM users";

	        PreparedStatement ps = con.prepareStatement(sql);

	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            total = rs.getInt(1);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return total;
	}

}
