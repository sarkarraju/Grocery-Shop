package com.grocery.servlets;

import java.io.IOException;

import com.grocery.connection.DBconnection;
import com.grocery.dao.productDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/DeleteProductServlet")
public class DeleteProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        productDao dao = new productDao(DBconnection.getConnection());

        boolean result = dao.deleteProduct(id);

        response.sendRedirect("product.jsp");
    }
}