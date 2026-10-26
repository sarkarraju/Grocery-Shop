package com.grocery.servlets;

import java.io.IOException;

import com.grocery.connection.DBconnection;
import com.grocery.dao.productDao;
import com.grocery.entities.product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/EditProductServlet")
public class EditProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        // Get product ID from URL
        int id = Integer.parseInt(request.getParameter("id"));

        // Create DAO
        productDao dao = new productDao(DBconnection.getConnection());

        // Get product from database
        product p = dao.getProductById(id);

        // Send product to edit page
        request.setAttribute("product", p);

        request.getRequestDispatcher("/admin/editProduct.jsp")
               .forward(request, response);
    }
}