package com.grocery.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.grocery.connection.DBconnection;
import com.grocery.dao.AdminDao;
import com.grocery.entities.Message;
import com.grocery.entities.admin;
import com.grocery.entities.user;

/**
 * Servlet implementation class AdminloginServlet
 */
@WebServlet("/admin/AdminloginServlet")
public class AdminloginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminloginServlet() {
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
		// TODO Auto-generated method stub
	String email=request.getParameter("email");
	String pass=request.getParameter("password");
	AdminDao dao=new AdminDao(DBconnection.getConnection());
	admin amn=dao.getAdminByEmailAndPassword(email, pass);
	
	if(amn==null) {
		//System.out.println("Invalid inputs");
		
		Message msg=new Message("invalid details..","error","alert-error");
		HttpSession s=request.getSession();
		s.setAttribute("msg", msg);
		
		
		response.sendRedirect("AdminLogin.jsp");
		
		
	}else {
		HttpSession s=request.getSession();
		s.setAttribute("current admin", amn);
		response.sendRedirect("dashboard.jsp");
	
	
	
	}
	
		
	}

}
