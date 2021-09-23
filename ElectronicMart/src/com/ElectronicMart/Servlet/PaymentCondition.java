package com.ElectronicMart.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ElectronicMart.Bean.EUser;
import com.ElectronicMart.Bean.cartItem;
import com.ElectronicMart.dao.ShoppingCart;

/**
 * Servlet implementation class PaymentCondition
 */
@WebServlet("/PaymentCondition")
public class PaymentCondition extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentCondition() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		EUser u = (EUser) session.getAttribute("currentUser");
		String userEmail = request.getParameter("cartEmail");
		
		
		String payment = request.getParameter("PaymentOption"); 
		if (payment.equals("Cash")) { 
			response.sendRedirect("CashPayment.jsp?cartEmail="+u.getEmail());
			}else if(payment.equals("Upi")) {
				response.sendRedirect("PaymentUpi.jsp?cartEmail="+u.getEmail());
			}else if(payment.equals("Card")) {
				response.sendRedirect("CardPayment.jsp?cartEmail="+u.getEmail());
			}
		 
	}

}
