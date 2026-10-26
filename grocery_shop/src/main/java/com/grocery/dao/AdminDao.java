package com.grocery.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.grocery.entities.admin;
import com.grocery.entities.user;

public class AdminDao {
private Connection con;

public AdminDao(Connection con) {
	
	this.con = con;
}
public boolean saveAdmin(admin admin) {
	boolean f=false;
	
	
	try {
		String query="insert into admin(name,email,password)values(?,?,?)";
		PreparedStatement ptm=this.con.prepareStatement(query);
		ptm.setString(1,admin.getName());
		ptm.setString(2,admin.getEmail());
		ptm.setString(3,admin.getPassword());
		
		ptm.executeUpdate();
		f=true;
		
		
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	
	
	return f;
}

public admin getAdminByEmailAndPassword(String email,String password) {
	admin admin=null;
	try {
		
		String query="select * from admin where email=? and password=?";
		PreparedStatement pst=con.prepareStatement(query);
		pst.setString(1, email);
		pst.setString(2, password);
	ResultSet set=pst.executeQuery();		

	if(set.next()) {
		admin =new admin();
		String name=set.getString("name");
		admin.setName(name);
		admin.setId(set.getInt("id"));
		admin.setEmail(set.getString("email"));
		admin.setPassword(set.getString("password"));
		
		
	}
}
	catch (Exception e) {
		e.printStackTrace();
		// TODO: handle exception
	}
	return admin;
}


}


