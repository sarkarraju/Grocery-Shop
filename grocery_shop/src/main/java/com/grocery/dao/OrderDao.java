package com.grocery.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.grocery.connection.DBconnection;
import com.grocery.entities.Order;

public class OrderDao {

	  public OrderDao() {
	    }
	
	
    // =========================
    // SAVE ORDER
    // =========================
    public boolean saveOrder(Order order) {

        boolean result = false;

        try {

            Connection con = DBconnection.getConnection();

            String sql = "INSERT INTO orders(user_id, total_amount) VALUES (?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, order.getUserId());
            ps.setDouble(2, order.getTotalAmount());

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


    // =========================
    // TOTAL REVENUE
    // =========================
    public double getTotalRevenue() {

        double totalRevenue = 0;

        try {

            Connection con = DBconnection.getConnection();

            String sql =
                "SELECT COALESCE(SUM(total_amount), 0) AS totalRevenue " +
                "FROM orders";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                totalRevenue = rs.getDouble("totalRevenue");
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return totalRevenue;
    }


    // =========================
    // TOTAL ORDERS
    // =========================
    public int getTotalOrders() {

        int totalOrders = 0;

        try {

            Connection con = DBconnection.getConnection();

            String sql = "SELECT COUNT(*) AS totalOrders FROM orders";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                totalOrders = rs.getInt("totalOrders");
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return totalOrders;
    }
    
    
    public List<Order> getAllOrders() {

        List<Order> orderList = new ArrayList<>();

        try {

            Connection con = DBconnection.getConnection();

            String sql = "SELECT * FROM orders ORDER BY order_date DESC";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Order order = new Order();

                order.setId(rs.getInt("id"));
                order.setUserId(rs.getInt("user_id"));
                order.setTotalAmount(rs.getDouble("total_amount"));

                orderList.add(order);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orderList;
    }
}
