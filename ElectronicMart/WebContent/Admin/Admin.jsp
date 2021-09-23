<%@page import="com.ElectronicMart.Bean.EUser" %>
<%@page import="com.ElectronicMart.Bean.EProduct" %>
<%@page import="com.ElectronicMart.dao.ProductDao" %>
<%@page import="java.util.List" %>
<%@page errorPage="Login.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Home</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/welcome.css">
<link rel="stylesheet" href="css/all.css">
</head>
<body>
                  <%
                  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
                  response.setHeader("Pragma", "no-cache");
                  response.setHeader("Expires", "0");
                  
                  EUser a=(EUser)session.getAttribute("Admin");
                  if(a==null){
                	  response.sendRedirect("Login.jsp");
                	  
                  }
                  
                  %>
<div class="container-fluid">
<%
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
                  
                  
                  <div class="menu-bar">
                      <ul id="Menu1">
                          <li><a href="Admin.jsp">Home</a></li>
                          <li><a href="AdminAddProduct.jsp">Add Product</a></li>
                          <li><a href="#">About us</a></li>
                          <li><a href="#">Contact</a></li>
                          <li><a href="#"><i class='fa fa-user'>&nbsp;&nbsp;<%=a.getUserName() %></i></a>
                          <div class="dropdown-content">
                                <ul id="menu2">
                                    <li><a href="AdminDashboard.jsp">Dashboard</a></li>
                                    <li><a href="Logout">Logout</a></li>
                                    
                                </ul>
                              </div>
                          </li>

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
	<img class="card-img-top" src="images/<%=p.getImage() %>" alt="Card image cap" style="width:100%; height: auto;">
	
	<div class="card-body">
	
	<h4 class="card-title"><%=p.getName() %></h4>
	<h5><%=p.getPrice() %></h5>
	
	<p class="card-text"><%=p.getDescription() %></p>
	
	
	</div>
	
	<div class="card-footer text-center">
	<button class="btn btn-primary"><a href="UpdateProduct.jsp?pid=<%=p.getId() %>" class="text-white" style="text-decoration:none;">edit</a></button>
	<button class="btn btn-primary"><a href="" class="text-white" style="text-decoration:none;">delete</a></button>
	
	</div>
	
	
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