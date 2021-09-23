package com.ElectronicMart.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ElectronicMart.Bean.EUser;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String lEmail = request.getParameter("lEmail");
		String lPassword = request.getParameter("lPassword");
		session.setAttribute("email", lEmail);
		session.setAttribute("password", lPassword);
	    EUser u=(EUser)session.getAttribute("currentUser");
	    EUser a=(EUser)session.getAttribute("Admin");
		
	    if(a!=null) {
			session.setAttribute("already-login", "You Already Logged in");
			response.sendRedirect("Admin.jsp");
		
		 }else if(u!=null) {
			session.setAttribute("already-login", "You Already Logged in");
			response.sendRedirect("Welcome.jsp?category=all");
		
		 }else {
		    response.sendRedirect("Login1");		
		
		}

	}

}
