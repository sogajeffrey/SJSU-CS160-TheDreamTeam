<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 
    Document   : QIRESULT
    Created on : Nov 10, 2014, 10:25:17 PM
    Author     : DT
--%>

<!DOCTYPE HTML>
<html>
<head>
<title>RacQual by The Dream Team</title>
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

	<section id="main" class="container small">
  <header>
    <h2>QI Calculator Results!</h2>
  </header>
  <% if(${grade}=="Good") {%>
  <span class="image"><img src="images/good.jpg" alt="Good" /></span>
  <% } else if(${grade}=="Mediocre") { %>
   <span class="image"><img src="images/mediocre.jpg" alt="Mediocre" /></span>
   <% } else { %>
   <span class="image"><img src="images/bad.jpg" alt="Bad" /></span>
   <% } %>
   <header>
    <h3>Your Quality Index is: <% ${grade} ${QIvalue}%> </h3>
  </header>
  </section>
   
    </body>
</html>
