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
 * Servlet implementation class addressRegister
 */
@WebServlet("/addressRegister")
public class addressRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addressRegister() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		EUser u = (EUser) session.getAttribute("currentUser");
		UserDao dao = new UserDao();
		String addresss = request.getParameter("address");
		int pincodes = Integer.parseInt(request.getParameter("zip"));
		long contacts = Long.parseLong(request.getParameter("contact"));
		double totals = Double.parseDouble(request.getParameter("total"));
		String cities = request.getParameter("city");
		String states = request.getParameter("state");
		String emails = request.getParameter("myEmail");
		
		u.setAddress(addresss);
		u.setPincode(pincodes);
		u.setContact(contacts);
		u.setTotal(totals);
		u.setCity(cities);
		u.setState(states);
		u.setEmail(emails);
		int status=dao.updateAddress(u);
		if(status>0) {
		response.sendRedirect("PaymentOption.jsp");
		}else {
			out.println("Fail");
		}
		
		
	}

}
