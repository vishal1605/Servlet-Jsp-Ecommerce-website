package com.ElectronicMart.cartServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ElectronicMart.Bean.cartItem;
import com.ElectronicMart.dao.ShoppingCart;

/**
 * Servlet implementation class ViewCart
 */
@WebServlet("/ViewCart")
public class ViewCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		PrintWriter out1 = response.getWriter();
//		String userEmail = request.getParameter("cartEmail");
//		ShoppingCart dao = new ShoppingCart();
//		List<cartItem> list=dao.getAllCart(userEmail);
//		
//		for(cartItem cart:list) {
//			out1.println(cart.getCid());
//			out1.println(cart.getCimage());
//			out1.println(cart.getCname());
//			out1.println(cart.getCprice());
//			out1.println(cart.getCquantity());
//			out1.println(cart.getCsubtotal());
//			
//		}
			
	}

}
