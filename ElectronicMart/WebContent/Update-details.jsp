<%@page import="com.ElectronicMart.Bean.EUser" %>
<%@page errorPage="Login.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard Update</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/welcome.css">
<link rel="stylesheet" href="css/all.css">
</head>
<body style="background-color: rgb(48, 164, 156)">
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
                  <%
                  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
                  response.setHeader("Pragma", "no-cache");
                  response.setHeader("Expires", "0");
                  
                  EUser u=(EUser)session.getAttribute("currentUser");
                  if(u==null){
                	  response.sendRedirect("Login.jsp");
                	  
                  }
                  int cartValue=(int)session.getAttribute("cartValue");
                  
                  %>
                  
                  <div class="menu-bar">
                      <ul id="Menu1">
                          <li><a href="Welcome.jsp?category=all">Home</a></li>
                          <li><a href="Welcome.jsp?category=all">Catogeries<i class="fa fa-caret-down"></i></a>
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
                          <li><a href="#"><i class='fa fa-user'>&nbsp;&nbsp;<%=u.getUserName() %></i></a>
                          <div class="dropdown-content">
                                <ul id="menu2">
                                    <li><a href="Dashboard.jsp">Dashboard</a></li>
                                    <li><a href="Orders.jsp">Order History</a></li>
                                    <li><a href="Logout">Logout</a></li>
                                    
                                </ul>
                              </div>
                          </li>
                          <li><a href="ShoppingCart.jsp?cartEmail=<%=u.getEmail()%>"><i class='fa fa-shopping-cart'></i>
                          <sup style="font-size:20px;"><b>(<%=cartValue %>)</b></sup></a></li>

                      </ul>
                  </div>
                  <span class="menu-icon" onclick="menutoggle()"><i class="fas fa-bars"></i></span>
                </div>
            </div>
        </div>
        </div>

    <!-- ===================================================================================Update-Details-Page===================================== -->
    <div class="dashboard p-5">
            <div class="row">
                <div class="col-12 d-flex justify-content-center">
                    <div class="profile-details">
                        <div class="profile-image text-center p-1">
                            <img src="images/avatar-2.jpg" alt="" style="width:100px; height:100px;">
                        </div> 
                        <%
                String updateMsg=(String)session.getAttribute("update-failed");
                if(updateMsg!=null)
                {%>
                	<div id="alert" class="alert alert-danger text-center" role="alert">
                  <b><%=updateMsg%></b>
                  </div>
                  
                <%
                session.removeAttribute("update-failed");
                }
                
                
                %>
                        <form action="UpdateDetail" method="post">                       
                        <table class="table table-borderless mt-3 text-center">
                            
                            <tbody>
                              <tr>
                                <td>ID</td>
                                <td><%=u.getEid() %></td>
                              </tr>
                              
                              <tr>
                                <td>UserName</td>
                                <td><input type="text" class="form-control" value="<%=u.getUserName() %>" name="edit-name" required></td>
                              </tr>

                              <tr>
                                <td>Email</td>
                                <td><input type="email" class="form-control" value="<%=u.getEmail() %>" name="edit-email" required></td>
                              </tr>

                              
                            </tbody>
                          </table>
                          <div class="btn6 text-center">
                          <button type="submit" class="btn btn-primary">Update</button>&nbsp;
                          <button type="button" class="btn btn-primary"><a href="Dashboard.jsp" style="text-decoration: none; color: white;">Cancel</a></button>
                          </div>
                          </form>
                          <!-- <div class="btn7 text-center mt-1 mr-1">
                          <button class="btn btn-primary"><a href="Dashboard.jsp" style="text-decoration: none; color: white;">Cancel</a></button>
                          </div> -->
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


   
 
<!-- ===================================================================Bootstrap js========================================================================================= -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
 
</body>
</html>