package com.ElectronicMart.cartServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ElectronicMart.Bean.cartItem;
import com.ElectronicMart.dao.ShoppingCart;

/**
 * Servlet implementation class UpdateCartQuantity
 */
@WebServlet("/UpdateCartQuantity")
public class UpdateCartQuantity extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCartQuantity() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		int quantity=0;
		int subtotal=0;
		int price=0;
		
		int productId = Integer.parseInt(request.getParameter("did"));
		quantity = Integer.parseInt(request.getParameter("quantity"));
		String button = request.getParameter("button");
		price= Integer.parseInt(request.getParameter("price"));
		subtotal= Integer.parseInt(request.getParameter("subTotal"));
		ShoppingCart sc = new ShoppingCart();
		cartItem cart = new cartItem();
		
		if((quantity==1) && (button.equals("dec"))){
			session.setAttribute("notIncDec", "Not possible! You have to remove product");
			response.sendRedirect("ShoppingCart.jsp");
			
		}else if((quantity!=1) && (button.equals("dec"))) {
			quantity= quantity-1;
			subtotal=subtotal-price;
			
			cart.setCquantity(quantity);
			cart.setCsubtotal(subtotal);
			cart.setCid(productId);
			
			sc.updateCart(cart);
			session.setAttribute("DecMsg", "Product quantity decreased");
			response.sendRedirect("ShoppingCart.jsp");
				
			
		}else {
			quantity= quantity+1;
			subtotal=price*quantity;
						
			cart.setCquantity(quantity);
			cart.setCsubtotal(subtotal);
			cart.setCid(productId);
			
			sc.updateCart(cart);
			session.setAttribute("IncMsg", "Product quantity increased");
			response.sendRedirect("ShoppingCart.jsp");
		}
		
		
		
		
		
		
	}

}
