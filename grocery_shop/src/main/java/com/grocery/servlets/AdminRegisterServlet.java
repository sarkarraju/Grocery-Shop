package com.grocery.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.grocery.connection.DBconnection;
import com.grocery.dao.AdminDao;
import com.grocery.entities.admin;

/**
 * Servlet implementation class AdminRegisterServlet
 */
@WebServlet("/admin/AdminRegisterServlet")
public class AdminRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminRegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String adminName=request.getParameter("name");
		String adminEmail=request.getParameter("email");
		String adminPassword=request.getParameter("password");
		
		admin admin=new admin(adminName,adminEmail,adminPassword);
		
		
		AdminDao dao=new AdminDao(DBconnection.getConnection());
		if (dao.saveAdmin(admin)) {
		    System.out.println("ADMIN SAVED SUCCESSFULLY");
		    response.sendRedirect("AdminLogin.jsp");
		} else {
		    System.out.println("ADMIN NOT SAVED");
		    response.sendRedirect("adminRegister.jsp");
		}

}
}