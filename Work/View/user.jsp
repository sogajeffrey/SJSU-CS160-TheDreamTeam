   <%@ page language="java" 
         contentType="text/html; charset=windows-1256"
         pageEncoding="windows-1256"
         import="defaultpackage.User"
   %>
<!DOCTYPE HTML>
<html>
<head>
<title>RacQual Login</title>
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

<!-- Header -->
<div id="header"> 
  
  <!-- Logo -->
  <h1><a href="index.jsp" id="logo">RacQual <em>by The Dream Team</em></a></h1>
  
  <!-- Nav -->
  <nav id="nav">
    <ul>
      <li><a href="index.jsp">Home</a></li>
      <li><a href="qicalc.jsp">Quality Index Calculator</a></li>
      <li ><a href="listings.jsp">Classified Listings</a></li>
      <li><a href="newlisting.jsp">New Listing</a></li>
      <li><a href="login.jsp">Login</a></li>
      <li> <a href="signup.jsp">Sign up</a> </li>
    </ul>
  </nav>
</div>

<!-- Main -->
<section id="main" class="container small">
  <header>
  <% user currentUser = (user (session.getAttribute("currentSessionUser"));%>
    <h2>Welcome to RacQual! <%= currentUser.getFirstName() + " " + currentUser.getLastName() %> </h2>
  </header>
  <div class="box">
		
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
