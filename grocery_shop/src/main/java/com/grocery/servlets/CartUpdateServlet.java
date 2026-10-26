package com.grocery.servlets;

import java.io.IOException;

import com.grocery.dao.cartDao;
import com.grocery.entities.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CartUpdateServlet")
public class CartUpdateServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            // Get product ID
            int productId =
                    Integer.parseInt(request.getParameter("productId"));

            // Get new quantity
            int quantity =
                    Integer.parseInt(request.getParameter("quantity"));

            // Get session
            HttpSession session = request.getSession();

            // Get logged-in user
            user user =
                    (user) session.getAttribute("current user");

            // Check if user is logged in
            if (user == null) {

                response.sendRedirect("login.jsp");
                return;
            }

            // Get user ID
            int userId = user.getId();

            System.out.println("Product ID: " + productId);
            System.out.println("New Quantity: " + quantity);
            System.out.println("User ID: " + userId);

            // Create DAO
            cartDao dao = new cartDao();

            // Update quantity
            boolean result =
                    dao.updateQuantity(userId, productId, quantity);

            System.out.println("Update result: " + result);

            // Return to cart
            response.sendRedirect("cart.jsp");

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect("cart.jsp");
        }
    }
}