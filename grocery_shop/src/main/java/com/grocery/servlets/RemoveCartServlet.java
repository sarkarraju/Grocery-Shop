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

@WebServlet("/RemoveCartServlet")
public class RemoveCartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        // Get logged-in user from session
        HttpSession session = request.getSession();

        user u = (user) session.getAttribute("current user");

        // If user is not logged in
        if (u == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Get product ID from URL
        String productId = request.getParameter("productId");

        // Check product ID
        if (productId == null || productId.isEmpty()) {
            response.sendRedirect("cart.jsp");
            return;
        }

        int pid = Integer.parseInt(productId);

        // Create DAO object
        cartDao dao = new cartDao();

        // Remove product from cart
        boolean result = dao.removeCartItem(u.getId(), pid);

        // Redirect back to cart
        response.sendRedirect("cart.jsp");
    }
}