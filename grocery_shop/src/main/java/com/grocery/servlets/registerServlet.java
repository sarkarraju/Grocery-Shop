package com.grocery.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.grocery.connection.DBconnection;
import com.grocery.dao.userDao;
import com.grocery.entities.user;

/**
 * Servlet implementation class registerServlet
 */
@WebServlet("/registerServlet")
public class registerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		String check=request.getParameter("check");
		if(check==null) {
			System.out.println("please filled the check box.");
		}else {
			String user_name=request.getParameter("user_name");
			String user_email=request.getParameter("user_email");
			String user_password=request.getParameter("user_password");
			user user=new user(user_name,user_email,user_password);
			
			
		userDao dao=new userDao(DBconnection.getConnection());
		
		if(dao.saveUser(user)) {
			System.out.println("done");
		}else {
		System.out.println("Error");
		}
		
		
	
		
		
	}
	}
}

