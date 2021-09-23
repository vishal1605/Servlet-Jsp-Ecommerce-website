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
 * Servlet implementation class AdminUpdateDetails
 */
@WebServlet("/AdminUpdateDetails")
public class AdminUpdateDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUpdateDetails() {
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
		String name = request.getParameter("edit-name");
		String email = request.getParameter("edit-email");
		
		HttpSession session = request.getSession();
		EUser a=(EUser)session.getAttribute("Admin");
		
		a.setUserName(name);
		a.setEmail(email);
		
		
		if(dao.updateProfile(a)) {
			session.setAttribute("update-success", "Successfully Update");
			response.sendRedirect("AdminDashboard.jsp");
		}else {
			session.setAttribute("update-failed", "failed to Update");
			response.sendRedirect("AdminUpdate-details.jsp");
		}
	}

}
