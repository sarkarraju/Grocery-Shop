package com.grocery.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.grocery.connection.DBconnection;
import com.grocery.dao.OrderDao;
import com.grocery.entities.Order;
import com.grocery.entities.user;

@WebServlet("/PlaceOrderServlet")
public class PlaceOrderServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        user user = (user) session.getAttribute("current user");

        // User not logged in
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = user.getId();

        double totalAmount = 0;
        boolean cartHasItems = false;

        try {

            Connection con = DBconnection.getConnection();

            // Get cart items and product prices
            String sql =
                    "SELECT c.quantity, p.price " +
                    "FROM cart c " +
                    "JOIN products p ON c.product_id = p.id " +
                    "WHERE c.user_id = ?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                cartHasItems = true;

                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");

                totalAmount += price * quantity;
            }

            rs.close();
            ps.close();

            // Cart is empty
            if (!cartHasItems) {

                con.close();

                response.sendRedirect("cart.jsp");
                return;
            }

            // Create Order
            Order order = new Order(userId, totalAmount);

            // Save order
            OrderDao orderDao = new OrderDao();

            boolean saved = orderDao.saveOrder(order);

            if (saved) {

                // Delete user's cart
                String deleteSql =
                        "DELETE FROM cart WHERE user_id = ?";

                PreparedStatement deletePs =
                        con.prepareStatement(deleteSql);

                deletePs.setInt(1, userId);

                deletePs.executeUpdate();

                deletePs.close();

                con.close();

                // Send total to success page
                session.setAttribute("orderTotal", totalAmount);

                response.sendRedirect("orderSucess.jsp");

            } else {

                con.close();

                response.sendRedirect("cart.jsp");
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect("cart.jsp");
        }
    }
}