package com.grocery.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.grocery.connection.DBconnection;
import com.grocery.dao.userDao;
import com.grocery.entities.Message;
import com.grocery.entities.user;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
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
		
		
		
		String userEmail=request.getParameter("email");
		String userPassword=request.getParameter("password");
		
		
		userDao dao=new userDao(DBconnection.getConnection());
		
		user u=dao.getUserByEmailAndPassword(userEmail, userPassword);
		
		if(u==null) {
			//System.out.println("Invalid inputs");
			
			Message msg=new Message("invalid details..","error","alert-error");
			HttpSession s=request.getSession();
			s.setAttribute("msg", msg);
			
			
			response.sendRedirect("login.jsp");
			
			
		}else {
			HttpSession s=request.getSession();
			s.setAttribute("current user", u);
			response.sendRedirect("profile.jsp");
		
		
		
		}
		
		
		
		
	
	}

}
