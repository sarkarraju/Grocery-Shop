package com.grocery.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.grocery.entities.product;

public class productDao {
private Connection con;

public productDao(Connection con) {

	this.con = con;
}
public boolean addProduct(product product) {
	boolean f=false;
	
	try {
		
		String query="insert into products(name,price,quantity,unit,description,image)values(?,?,?,?,?,?)";
		PreparedStatement ptm=this.con.prepareStatement(query);
		ptm.setString(1,product.getName());
		ptm.setDouble(2, product.getPrice());
		ptm.setInt(3,product.getQuantity());
		System.out.println("Unit going to MySQL: [" + product.getUnit() + "]");
		ptm.setString(4, product.getUnit());
		ptm.setString(5, product.getDescription());
		ptm.setBytes(6, product.getImage());
		
		ptm.executeUpdate();
		f=true;
		
		
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	
	
	
	
	return f;
	
	
}

public List<product>getAllProducts(){
	List<product> list=new ArrayList<>();
	
	try {
		String query="select * from products";
		PreparedStatement ptm=this.con.prepareStatement(query);
		ResultSet rs=ptm.executeQuery();
		while (rs.next()) {
			product p=new product();
			p.setId(rs.getInt("id"));
			p.setName(rs.getString("name"));
			p.setPrice(rs.getDouble("price"));
			p.setQuantity(rs.getInt("quantity"));
			p.setUnit(rs.getString("unit"));
			p.setDescription(rs.getString("description"));
			p.setImage(rs.getBytes("image"));
			
			
			
			
			 list.add(p);
		}
		
		
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	
	
	
	
	return list;
}

public product getProductById(int id) {

    product p = null;

    try {

        String query = "SELECT * FROM products WHERE id=?";

        PreparedStatement ptm = this.con.prepareStatement(query);

        ptm.setInt(1, id);

        ResultSet rs = ptm.executeQuery();

        if (rs.next()) {

            p = new product();

            p.setId(rs.getInt("id"));
            p.setName(rs.getString("name"));
            p.setPrice(rs.getDouble("price"));
            p.setQuantity(rs.getInt("quantity"));
            p.setUnit(rs.getString("unit"));
            p.setDescription(rs.getString("description"));
            p.setImage(rs.getBytes("image"));
        }

    } catch (Exception e) {

        e.printStackTrace();
    }

    return p;
}

public boolean deleteProduct(int id) {

    boolean result = false;

    try {

        String sql = "DELETE FROM products WHERE id = ?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, id);

        int rows = ps.executeUpdate();

        if (rows > 0) {
            result = true;
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return result;
}

public boolean updateProduct(product p) {

    boolean result = false;

    try {

        String sql = "UPDATE products SET name=?, price=?, quantity=?, unit=?, description=? WHERE id=?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, p.getName());
        ps.setDouble(2, p.getPrice());
        ps.setInt(3, p.getQuantity());
        ps.setString(4, p.getUnit());
        ps.setString(5, p.getDescription());
        ps.setInt(6, p.getId());

        int rows = ps.executeUpdate();

        if (rows > 0) {
            result = true;
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return result;
}

}
