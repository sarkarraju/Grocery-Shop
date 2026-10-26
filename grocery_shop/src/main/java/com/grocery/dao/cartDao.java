package com.grocery.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.grocery.connection.DBconnection;
import com.grocery.entities.CartItem;

public class cartDao {

    // ADD TO CART
    public boolean addToCart(int userId, int productId, int quantity) {

        boolean result = false;

        try {

            Connection con = DBconnection.getConnection();

            String sql = "INSERT INTO cart(user_id, product_id, quantity) VALUES (?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, userId);
            ps.setInt(2, productId);
            ps.setInt(3, quantity);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                result = true;
            }

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    
    public List<CartItem> getCartByUser(int userId) {

        List<CartItem> cart = new ArrayList<>();

        try {

            Connection con = DBconnection.getConnection();

            String sql =
                "SELECT c.product_id, c.quantity, " +
                "p.name, p.price " +
                "FROM cart c " +
                "JOIN products p ON c.product_id = p.id " +
                "WHERE c.user_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                CartItem item = new CartItem(
                    rs.getInt("product_id"),
                    rs.getString("name"),
                    rs.getDouble("price"),
                    rs.getInt("quantity")
                );

                cart.add(item);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return cart;
    }
    

    // UPDATE QUANTITY
    public boolean updateQuantity(int userId, int productId, int quantity) {

        boolean result = false;

        try {

            Connection con = DBconnection.getConnection();

            String sql = "UPDATE cart SET quantity=? WHERE user_id=? AND product_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, quantity);
            ps.setInt(2, userId);
            ps.setInt(3, productId);

            int rows = ps.executeUpdate();

            System.out.println("Rows updated: " + rows);

            if (rows > 0) {
                result = true;
            }

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }


	public boolean removeCartItem(int userId, int productId) {
		
		
		 try {
			  Connection con = DBconnection.getConnection();
		        String sql = "DELETE FROM cart WHERE user_id = ? AND product_id = ?";

		        PreparedStatement ps = con.prepareStatement(sql);

		        ps.setInt(1, userId);
		        ps.setInt(2, productId);

		        int rows = ps.executeUpdate();

		        return rows > 0;

		    } catch (Exception e) {
		        e.printStackTrace();
		    }

		    return false;
		}
    
    
    
}