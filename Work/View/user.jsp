<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
<title>RacQual</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<script src="js/jquery.min.js"></script>
<script src="js/jquery.dropotron.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/skel-layers.min.js"></script>
<script src="js/init.js"></script>
<noscript>
<link rel="stylesheet" href="css/skel.css" />
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/style-wide.css" />
</noscript>
</head><body>

<%@ include file="nav.jsp" %> 


<!-- Main -->
<section id="main" class="container small">
  <header> 
      
<!-- JAY's code  -->
      
  <%@ page import="Model.Users" %>
  <jsp:useBean id="link" scope="application" class = "Model.Users" />   
  <% Model.Users currentUser = ((Model.Users) (session.getAttribute("currentSessionUser")));%>
 <h2>Welcome to RacQual! <%= currentUser.getFirstName() + " " + currentUser.getLastName() %> </h2>
 
  </header>
  <div class="box">
	 <header>
    <h2>Here are some things you can do:</h2>
    <a href="newlisting.jsp" class="button">New Listing</a> 	
    <a href="listings.jsp" class="button">All Listings</a> </header>	
  </div>
</section>

<!-- Footer -->
<footer id="footer">
  <ul class="copyright">
    <li>&copy; Dream Team. All rights reserved.</li>
  </ul>
</footer>
</body>
</html>
