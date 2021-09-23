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
 * Servlet implementation class ForgetPassword
 */
@WebServlet("/ForgetPassword")
public class ForgetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgetPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		UserDao dao = new UserDao();
		EUser user = new EUser();
		PrintWriter out = response.getWriter();
		
		String uPassword = request.getParameter("change-password");
		String uPasswords = request.getParameter("confirm-change-password");
		String uEmail = request.getParameter("used-email");
		

		user.setPassword(uPassword);
		user.setConfirmPassword(uPasswords);
		user.setEmail(uEmail);
		
		HttpSession session = request.getSession();
		if(!(uPassword.equals(uPasswords))) {
			
			session.setAttribute("forget-failed-password", "Your both passwords are different");
			response.sendRedirect("forgetPassword.jsp");
		}else if(dao.updateUser(user)) {
	
			session.setAttribute("success-password", "Password change successfully...");
			response.sendRedirect("forgetPassword.jsp");			
		}else {
			
			session.setAttribute("forget-email-password", "Invalid email Id");
			response.sendRedirect("forgetPassword.jsp");
		}
	}

}
