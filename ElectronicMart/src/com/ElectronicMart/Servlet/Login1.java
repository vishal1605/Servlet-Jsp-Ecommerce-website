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
 * Servlet implementation class Login1
 */
public class Login1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category=null;
		UserDao dao = new UserDao();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String lEmail=(String)session.getAttribute("email");
		String lPassword=(String)session.getAttribute("password");
		EUser b=dao.loginUser(lEmail,lPassword);
		EUser admin=dao.loginUser(lEmail,lPassword);
		


		if((lEmail.equals("Admin1234@gmail.com"))&&(lPassword.equals("admin"))){
			session.setAttribute("Admin", admin);
			response.sendRedirect("Admin.jsp");
			
		}else if(b==null) {
			session.setAttribute("invilid-Id", "Invalid Id");
			response.sendRedirect("Login.jsp");
		
		 }else {
			
		session.setAttribute("currentUser", b);
		
		
		response.sendRedirect("Welcome.jsp?category=all");		
		
		}
		
		
	}

}
