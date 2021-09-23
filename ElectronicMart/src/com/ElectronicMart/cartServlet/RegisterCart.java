package com.ElectronicMart.cartServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ElectronicMart.Bean.EUser;
import com.ElectronicMart.Bean.cartItem;
import com.ElectronicMart.dao.ShoppingCart;

@MultipartConfig
public class RegisterCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		String cartImage = request.getParameter("cImage");		
		String cartName = request.getParameter("cName");
		int cartPrice = Integer.parseInt(request.getParameter("cPrice"));
		int cartQuantity = Integer.parseInt(request.getParameter("cQuantity"));
		int cartTotal = Integer.parseInt(request.getParameter("cTotal"));
		String cartEmail = request.getParameter("cEmail");
		String name=null;
		EUser u=(EUser)session.getAttribute("currentUser");
		String email = u.getEmail();

		ShoppingCart dao = new ShoppingCart();
		List<cartItem> list = dao.getAllCart(email);
		int z=0;
		for(cartItem items: list) {
			name=items.getCname();
			if(name.equals(cartName)) {
				z=1;
			}
			
		}
		if(z==1) {
			session.setAttribute("Cart-msg", "Product Already in cart! Please increase quantity in Cart");
			response.sendRedirect("Welcome.jsp?category=all");
			
		}else {
			cartItem cart = new cartItem();
			cart.setCimage(cartImage);
			cart.setCname(cartName);
			cart.setCprice(cartPrice);
			cart.setCquantity(cartQuantity);
			cart.setCsubtotal(cartTotal);
			cart.setEmail(cartEmail);
			
			ShoppingCart sc = new ShoppingCart();
			boolean sCart=sc.insertCart(cart);
			
			if(sCart) {
				session.setAttribute("product-msg", "Product added successfully..");
				response.sendRedirect("Welcome.jsp?category=all");				
			}else {
//				session5.setAttribute("product-failed", "Product failed to add..");
				response.sendRedirect("Dashboard.jsp");
			}

		}
			
		
		
		
		
		
		
		
//=======================================================Real Code====================================================
//		String cartImage = request.getParameter("cImage");		
//		String cartName = request.getParameter("cName");
//		int cartPrice = Integer.parseInt(request.getParameter("cPrice"));
//		int cartQuantity = Integer.parseInt(request.getParameter("cQuantity"));
//		int cartTotal = Integer.parseInt(request.getParameter("cTotal"));
//		String cartEmail = request.getParameter("cEmail");
//		
//		cartItem cart = new cartItem();
//		cart.setCimage(cartImage);
//		cart.setCname(cartName);
//		cart.setCprice(cartPrice);
//		cart.setCquantity(cartQuantity);
//		cart.setCsubtotal(cartTotal);
//		cart.setEmail(cartEmail);
//		
//		ShoppingCart sc = new ShoppingCart();
//		boolean sCart=sc.insertCart(cart);
//		
//		if(sCart) {
////			session5.setAttribute("product-msg", "Product added successfully..");
//			response.sendRedirect("Welcome.jsp");
//			
//		}else {
////			session5.setAttribute("product-failed", "Product failed to add..");
//			response.sendRedirect("Dashboard.jsp");
//		}
	}

}
