package com.ElectronicMart.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ElectronicMart.Bean.EUser;
import com.ElectronicMart.Bean.OrderHistory;
import com.ElectronicMart.Bean.cartItem;
import com.ElectronicMart.Connection.EConnection;
import com.ElectronicMart.dao.HistoryDao;
import com.ElectronicMart.dao.ShoppingCart;

/**
 * Servlet implementation class HistoryServlet
 */
@WebServlet("/HistoryServlet")
public class HistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HistoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		EUser u = (EUser) session.getAttribute("currentUser");
		String email = u.getEmail();
		OrderHistory history = new OrderHistory();
		HistoryDao dao1 = new HistoryDao();

		ShoppingCart dao = new ShoppingCart();

		List<cartItem> list = dao.getAllCart(email);
		for(cartItem items: list) {
			String image=items.getCimage();
			String name = items.getCname();
			int quantity = items.getCquantity();
			int subTotal = items.getCsubtotal();
			String status = "processing";
			String myEmail = items.getEmail();
			
			history.setOimage(image);
			history.setOname(name);
			history.setOquantity(quantity);
			history.setOprice(subTotal);
			history.setOstatus(status);
			history.setOemail(myEmail);
			
			dao1.insertUser(history);
			
			int productId = items.getCid();
			dao.deleteCart(productId);
			
			
		}
		response.sendRedirect("TotalRemove");
		
		
		
		
		
//=============================Dont touch================================================
//		EConnection connection = new EConnection();
//		HttpSession session = request.getSession();
//		EUser u = (EUser) session.getAttribute("currentUser");
//		
//		String userEmail = request.getParameter("cartEmail");
//		ShoppingCart dao = new ShoppingCart();
//		List<cartItem> list = dao.getAllCart(userEmail);
//		for(cartItem cart : list) {
//		OrderHistory history = new OrderHistory();
//		HistoryDao dao1 = new HistoryDao();
//		
//		String images = request.getParameter("myImage");
//		String names = request.getParameter("myName");
//	    int quantites = Integer.parseInt(request.getParameter("quantity"));
//		int prices = Integer.parseInt(request.getParameter("price")); 
//		String status = request.getParameter("processing");
//		String myEmails = request.getParameter("myEmail");
//		
//		history.setOimage(images);
//		history.setOname(names);
//		history.setOquantity(quantites);
//		history.setOprice(prices);
//		history.setOstatus(status);
//		history.setOemail(myEmails); 
//		
//		String sql = "insert into orderhistory(oimage, oname, oquantity, oprice, ostatus, oemail) value(?,?,?,?,?,?)";
//		
//		try {
//			
//			PreparedStatement stmt=connection.getCon().prepareStatement(sql);
//			stmt.setString(1, history.getOimage());
//			stmt.setString(2, history.getOname());
//			stmt.setInt(3, history.getOquantity());
//			stmt.setInt(4, history.getOprice());
//			stmt.setString(5, history.getOstatus());
//			stmt.setString(6, history.getOemail());
//			stmt.executeUpdate();
//			connection.getCon().close();
//			
//		} catch (Exception e) {	
//			e.printStackTrace();
//		}
//
//		
//				}
//		out.println("Successful");
	}
		

}
