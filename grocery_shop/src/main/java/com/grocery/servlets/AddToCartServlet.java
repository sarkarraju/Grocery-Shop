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

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            // Get product ID
            int productId = Integer.parseInt(
                    request.getParameter("productId")
            );

            // Get logged-in user
            HttpSession session = request.getSession();

            user currentUser =
                    (user) session.getAttribute("current user");

            // User must login
            if (currentUser == null) {

                response.sendRedirect("login.jsp");
                return;
            }

            // Get user ID
            int userId = currentUser.getId();

            // Quantity
            int quantity = 1;

            String quantityParameter =
                    request.getParameter("quantity");

            if (quantityParameter != null) {

                quantity =
                        Integer.parseInt(quantityParameter);
            }

            // DAO
            cartDao dao = new cartDao();

            boolean result =
                    dao.addToCart(userId, productId, quantity);

            if (result) {

                response.sendRedirect("cart.jsp");

            } else {

                response.sendRedirect("index.jsp");
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect("index.jsp");
        }
    }
}