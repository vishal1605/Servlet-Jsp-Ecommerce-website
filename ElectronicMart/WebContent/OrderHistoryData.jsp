<%@ page import="com.ElectronicMart.Bean.cartItem"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.ElectronicMart.dao.ShoppingCart"%>
<%@page import="com.ElectronicMart.Bean.EProduct"%>
<%@page import="com.ElectronicMart.dao.ProductDao"%>
<%@page import="com.ElectronicMart.Bean.EUser"%>
<%-- <%@page errorPage="Login.jsp"%> --%>
<%@page import="com.ElectronicMart.Bean.OrderHistory"%>
<%@page import="com.ElectronicMart.Connection.EConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
EUser u = (EUser) session.getAttribute("currentUser");
String userEmail = request.getParameter("cartEmail");
					ShoppingCart dao = new ShoppingCart();
					List<cartItem> list = dao.getAllCart(userEmail);
					String msg = "Cart is empty! Please add product";
					
					%>
					<table class="table table-borderless mt-3 mb-3">
						<thead>
							<tr class="text-center">
								<th>Product</th>
								<th>Name</th>
								<th>Price</th>
								<th>Quantity</th>
								<th>Subtotal</th>
							</tr>
						</thead>
						<tbody>
							<%
							for (cartItem cart : list) {
							%>

							<tr class="text-center">
								<td><img alt="" src="images/<%=cart.getCimage()%>"
									style="Width: 150px; height: auto;"></td>
								<td><%=cart.getCname()%></td>
								<td><%=cart.getCprice()%></td>
								<td><input type="number" value="<%=cart.getCquantity()%>"
									style="width: 40px; border: 1px solid red; overflow: hidden; outline: none;"></td>
								<td><%=cart.getCsubtotal()%></td>
								<td><a href="DeleteCart?did=<%=cart.getCid()%>"><i
										class="fas fa-trash-alt" style="font-size: 25px;"></i></a></td>

							</tr>
							<form action="HistoryServlet?cartEmail=<%=u.getEmail()%>" method="post">
							
							
							<%
							
							
							} 
							%>
							<button type="submit">Submit</button>
							
							</form>
							


</body>
</html>