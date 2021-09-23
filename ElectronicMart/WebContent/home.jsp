<%@page import="com.ElectronicMart.Bean.EProduct" %>
<%@page import="com.ElectronicMart.dao.ProductDao" %>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/home.css">
<link rel="stylesheet" href="css/all.css">
</head>
<body>
<div class="container-fluid"> 
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
                  
                  <div class="menu-bar">
                      <ul id="Menu1">
                          <li><a href="home.jsp">Home</a></li>
                          <li><a href="#">Catogeries<i class="fa fa-caret-down"></i></a>
                            <div class="dropdown-content">
                                <ul id="menu2">
                                    <li><a href="#">smartphones</a></li>
                                    <li><a href="#">Smartwatchs</a></li>
                                    <li><a href="#">Headphones</a></li>
                                    <li><a href="#">Laptops</a></li>
                                </ul>
                              </div>
                        </li>
                          <li><a href="#">About us</a></li>
                          <li><a href="#">Contact</a></li>
                          <li><a href="Login.jsp"><i class='fa fa-user'></i></a></li>
                          <li><a href="CheckUser"><i class='fa fa-shopping-cart'></i></a></li>

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
List<EProduct> list=dao1.getAllProduct();
for(EProduct p:list)
{%>

	<div class="card column-count-4">
	<form action="CheckUser">
	<img class="card-img-top" src="images/<%=p.getImage() %>" alt="Card image cap" style="width:100%; height: auto;">
	
	<div class="card-body">
	
	<h4 class="card-title"><%=p.getName() %></h4>
	
	<p class="card-text"><%=p.getDescription() %></p>
	
	
	</div>
	
	<div class="card-footer d-flex justify-content-center">
	<button type="submit" class="btn btn-primary">Add to cart</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<h4><i class="fas fa-rupee-sign"></i><%=p.getPrice() %>/-</h4>
	</div>
	</form>
	
	</div>
	
	
<%}
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


</body>
</html>