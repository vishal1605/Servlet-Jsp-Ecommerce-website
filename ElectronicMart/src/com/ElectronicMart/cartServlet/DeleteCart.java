package com.ElectronicMart.cartServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ElectronicMart.Bean.EUser;
import com.ElectronicMart.dao.ShoppingCart;

/**
 * Servlet implementation class DeleteCart
 */
public class DeleteCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session  = request.getSession();
		int deleteId = Integer.parseInt(request.getParameter("did"));
		ShoppingCart sc = new ShoppingCart();
		 EUser u=(EUser)session.getAttribute("currentUser");
		
		sc.deleteCart(deleteId);
		session.setAttribute("cartDelete", "Item removed Successfully");
		response.sendRedirect("ShoppingCart.jsp?cartEmail="+u.getEmail());
		
	}

}
