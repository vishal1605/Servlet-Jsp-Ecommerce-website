<%@page import="com.ElectronicMart.Bean.EProduct" %>
<%@ page import="com.ElectronicMart.Bean.cartItem"%>
<%@ page import="com.ElectronicMart.dao.ShoppingCart"%>
<%@page import="com.ElectronicMart.dao.ProductDao" %>
<%@page import="java.util.List" %>
<%@page import="com.ElectronicMart.Bean.EUser" %>
<%@page errorPage="Login.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/welcome.css">
<link rel="stylesheet" href="css/all.css">
</head>
<body>
<div class="container-fluid"> 
        <%
        String cartMsg=(String)session.getAttribute("Cart-msg");
        if(cartMsg!=null){
        	%>
        	<div id="alert" class="alert alert-danger text-center" role="alert">
                  <b><%=cartMsg%></b>
                  </div>
                <%
                session.removeAttribute("Cart-msg");
        	}
        
        String productMsg=(String)session.getAttribute("product-msg");
        if(productMsg!=null){
        	%>
        	<div id="alert" class="alert alert-success text-center" role="alert">
                  <b><%=productMsg%></b>
                  </div>
                <%
                session.removeAttribute("product-msg");
        	}
        
        
        
        String loggedinMsg=(String)session.getAttribute("already-login");
        if(loggedinMsg!=null){
        	%>
        	<div id="alert" class="alert alert-danger text-center" role="alert">
                  <b><%=loggedinMsg%></b>
                  </div>
                <%
                session.removeAttribute("already-login");
        	}
        %>
        <div class="nav-bar">
        <div class="row">
            <div class="col-12">
                <div class="header-bar">
                  <div class="logo">
                      <img src="images/Capture-1.png" alt="">
    
                  </div>
                  <div class="search-bar">
                      <div class="search">
                        <input type="text" placeholder="Search for smartphone, laptop..." id="search">

                      </div>
                      <div class="btn1">
                        <button type="submit"><i class="fa fa-search"></i></button>

                      </div>
                      
                  </div>
                  <%
                  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
                  response.setHeader("Pragma", "no-cache");
                  response.setHeader("Expires", "0");
                  
                  EUser u=(EUser)session.getAttribute("currentUser");
                  if(u==null){
                	  response.sendRedirect("Login.jsp");
                	  
                  }
                  String email = u.getEmail();

					ShoppingCart dao = new ShoppingCart();
					List<cartItem> list = dao.getAllCart(email);
					int cartValue=list.size();
					session.setAttribute("cartValue", cartValue);
					System.out.println(cartValue);
                  
                  %>
                  
                  <div class="menu-bar">
                      <ul id="Menu1">
                          <li><a href="Welcome.jsp?category=all">Home</a></li>
                          <li><a href="Welcome.jsp?category=all">Catogeries<i class="fa fa-caret-down"></i></a>
                            <div class="dropdown-content">
                                <ul id="menu2">
                                    <li><a href="Welcome.jsp?category=Smart Phones">Smart Phones</a></li>
                                    <li><a href="Welcome.jsp?category=Laptops">Laptops</a></li>
                                    <li><a href="Welcome.jsp?category=Clothes">Clothes</a></li>
                                    <li><a href="Welcome.jsp?category=Smart Watches">Smart Watches</a></li>
                                </ul>
                              </div>
                        </li>
                          <li><a href="#">About us</a></li>
                          <li><a href="#">Contact</a></li>
                          <li><a href="#"><i class='fa fa-user'>&nbsp;&nbsp;<%=u.getUserName() %></i></a>
                          <div class="dropdown-content">
                                <ul id="menu2">
                                    <li><a href="Dashboard.jsp">Dashboard</a></li>
                                    <li><a href="Orders.jsp">Order History</a></li>
                                    <li><a href="Logout">Logout</a></li>
                                    
                                </ul>
                              </div>
                          </li>
                          <li><a href="ShoppingCart.jsp"><i class='fa fa-shopping-cart'></i><sup style="font-size:20px;"><b>(<%=cartValue %>)</b></sup></a></li>

                      </ul>
                  </div>
                  <span class="menu-icon" onclick="menutoggle()"><i class="fas fa-bars"></i></span>
                </div>
            </div>
        </div>
        </div>
        
        <!-- =======================================================AllProduct===================================================== -->
<div class="all-product">
<div class="row mt-3 mb-3">
<div class="col-md-12">
<div class="card-columns" style="column-count:4;">
<%
ProductDao dao1 = new ProductDao();
String category=request.getParameter("category");
if(category.equals("all")) {
List<EProduct> lists=dao1.getAllProduct();
for(EProduct p:lists)
{%>
    
	<div class="card column-count-4">
	<form action="RegisterCart" method="post">
	<img class="card-img-top" src="images/<%=p.getImage() %>" alt="Card image cap" style="width:100%; height: auto;">
	<input type="hidden" class="form-control" id="exampleInputPassword1" value="<%=p.getImage()%>" placeholder="Category" name="cImage">
	
	<div class="card-body">
	
	<h4 class="card-title"><input type="hidden" class="form-control" id="exampleInputPassword1" value="<%=p.getName()%>" placeholder="Category" name="cName"><%=p.getName() %></h4>
	<h5><input type="hidden" class="form-control" id="exampleInputPassword1" value="<%=p.getPrice()%>" placeholder="Category" name="cPrice"></h5>
	
	<input type="hidden" class="form-control" id="" value="1" placeholder="Category" name="cQuantity">
	<p class="card-text"><%=p.getDescription() %></p>
	<input type="hidden" class="form-control" id="exampleInputPassword1" value="<%=p.getPrice()%>" placeholder="Category" name="cTotal">
	<input type="hidden" class="form-control" id="exampleInputPassword1" value="<%=u.getEmail()%>" placeholder="Category" name="cEmail">
	</div>
	
	<div class="card-footer d-flex justify-content-center">
	<button type="submit" class="btn btn-primary">Add to cart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<h4><i class="fas fa-rupee-sign"></i><%=p.getPrice() %>/-</h4>
	</div>
	
	</form>
	</div>
	
	
<%}}else{
	List<EProduct> catLists=dao1.getProductByCat(category);
	for(EProduct product:catLists)
{%>
<div class="card column-count-4">
	<form action="RegisterCart" method="post">
	<img class="card-img-top" src="images/<%=product.getImage() %>" alt="Card image cap" style="width:100%; height: auto;">
	<input type="hidden" class="form-control" id="exampleInputPassword1" value="<%=product.getImage()%>" placeholder="Category" name="cImage">
	
	<div class="card-body">
	
	<h4 class="card-title"><input type="hidden" class="form-control" id="exampleInputPassword1" value="<%=product.getName()%>" placeholder="Category" name="cName"><%=product.getName() %></h4>
	<h5><input type="hidden" class="form-control" id="exampleInputPassword1" value="<%=product.getPrice()%>" placeholder="Category" name="cPrice"></h5>
	
	<input type="hidden" class="form-control" id="" value="1" placeholder="Category" name="cQuantity">
	<p class="card-text"><%=product.getDescription() %></p>
	<input type="hidden" class="form-control" id="exampleInputPassword1" value="<%=product.getPrice()%>" placeholder="Category" name="cTotal">
	<input type="hidden" class="form-control" id="exampleInputPassword1" value="<%=u.getEmail()%>" placeholder="Category" name="cEmail">
	</div>
	
	<div class="card-footer d-flex justify-content-center">
	<button type="submit" class="btn btn-primary">Add to cart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<h4><i class="fas fa-rupee-sign"></i><%=product.getPrice() %>/-</h4>
	</div>
	
	</form>
	</div>

<%}}
%>




</div>
</div>
</div>
</div>
        

    
    <!-- ==================================================Footer-bar============================================================================= -->


    <div class="footer-bar">
      <div class="row">
         <div class="col-3 p-3 text-center">
             <h3 style="color: white;">Download Our App</h3>
             <p style="color: rgb(27, 20, 20);">Download App for Android and ios mobile phone.</p>
             <div class="app-logo">
                 <img src="images/play-store.png" alt="">
                 <img src="images/app-store.png" alt="">
             </div>
         </div>
         <div class="col-3 p-3 text-center">
             <img id="img-logo" src="images/Capture-1.png" alt="">
             <p id="logo-para">Our purpose is to sustainably make the pleasure <br> and
                 benifits of Sports accessible to the many.</p>
         </div>
         <div class="col-3 p-3 text-center">
             <h3 style="color: white;">Useful Links</h3>
             <ul>
                 <li>Coupons</li>
                 <li>Blog Post</li>
                 <li>Return Policy</li>
                 <li>Join Affiliate</li>
             </ul>
         </div>
         <div class="col-3 p-3 text-center">
             <h3 style="color: white;">Follow us</h3>
             <ul class="icons">
                 <li><a href=""><i class="fab fa-facebook-f"></i></a></li>
                 <li><a href=""><i class="fab fa-instagram"></i></a></li>
                 <li><a href=""><i class="fab fa-twitter"></i></a></li>
                 <li><a href=""><i class="fab fa-linkedin-in"></i></a></li>
             </ul>
         </div>
      </div>
  </div>

    </div>

<!-- =========================================================For Alert message After register=================================================================== -->    
    <script type="text/javascript">
        setTimeout(function () {
  
            // Closing the alert
            $('#alert').alert('close');
        }, 8000);
    </script>
   
 
<!-- ===================================================================Bootstrap js========================================================================================= -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
 
</body>
</html>