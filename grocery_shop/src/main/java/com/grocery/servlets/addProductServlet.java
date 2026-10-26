package com.grocery.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;

import com.grocery.connection.DBconnection;
import com.grocery.dao.productDao;
import com.grocery.entities.product;

/**
 * Servlet implementation class addProductServlet
 */
@WebServlet("/admin/addProductServlet")
@MultipartConfig
public class addProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name=request.getParameter("product");
		double price = Double.parseDouble(request.getParameter("price"));

		int qty = Integer.parseInt(request.getParameter("qty"));
		String unit=request.getParameter("unit");
		String desc=request.getParameter("description");
		
		
		System.out.println("========== PRODUCT ==========");
		System.out.println("Name: " + name);
		System.out.println("Price: " + price);
		System.out.println("Quantity: " + qty);
		System.out.println("Unit: " + unit);
		System.out.println("Description: " + desc);
		
		Part imagePart=request.getPart("image");
		
	InputStream inputStream=imagePart.getInputStream();
	byte[] image=inputStream.readAllBytes();
	product p=new product(name,price,qty,unit,desc,image);
	System.out.println("Unit inside product object: [" + p.getUnit() + "]");
	
	productDao dao=new productDao(DBconnection.getConnection());
	if(dao.addProduct(p)) {
		System.out.println("Product Successfully added.");
		response.sendRedirect("product.jsp");
	}
//	else {
//		System.out.println("error");
//	}
	}

}
