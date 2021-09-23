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
import com.ElectronicMart.dao.UserDao;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out = response.getWriter();
		String myName=request.getParameter("rName");
		String myEmail = request.getParameter("rEmail");
		String myPassword= request.getParameter("rPassword");
		String myPasswords = request.getParameter("rPasswords");
		String myCondition = request.getParameter("rTerm");
		
		UserDao dao = new UserDao();
		EUser user = new EUser();
		
		user.setUserName(myName);
		user.setEmail(myEmail);
		user.setPassword(myPassword);
		user.setConfirmPassword(myPasswords);
		user.setTerm(myCondition);
		
		if(!(myPassword.equals(myPasswords))) {
			HttpSession session = request.getSession();
			session.setAttribute("password-msg", "Your both password are different");
			response.sendRedirect("Register.jsp");
//			out.println("Pls Check again your Paasword");
		}else if(dao.insertUser(user)) {
			HttpSession session = request.getSession();
			session.setAttribute("reg-msg", "Register successfully...");
			response.sendRedirect("Register.jsp");	
//		}else {
//			HttpSession session = request.getSession();
//			session.setAttribute("email-msg", "This Email is already taken");
//			response.sendRedirect("Register.jsp");
////			out.println("Sorry! Change your Email...");
		}
	}

}
