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

@WebServlet("/admin/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // Get form values

        int id = Integer.parseInt(request.getParameter("id"));

        String name = request.getParameter("name");

        double price =
                Double.parseDouble(request.getParameter("price"));

        int quantity =
                Integer.parseInt(request.getParameter("quantity"));

        String unit =
                request.getParameter("unit");

        String description =
                request.getParameter("description");


        // Create product object

        product p = new product();

        p.setId(id);
        p.setName(name);
        p.setPrice(price);
        p.setQuantity(quantity);
        p.setUnit(unit);
        p.setDescription(description);


        // Update database

        productDao dao =
                new productDao(DBconnection.getConnection());

        boolean result =
                dao.updateProduct(p);


        // Go back to product page

        response.sendRedirect("product.jsp");
    }
}