
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
  <% String g = (String)request.getAttribute("grade");
     if(g.equals("Good")) {
      out.println("<span class='image'><img src='images/Good.jpg' alt='Good' width='150' height='150' /></span>");
     } else if(g.equals("Mediocre")) {
        out.println("<span class='image'><img src='images/mediocre.jpg' alt='Mediocre' width='150' height='150' /></span>");
    } else {
        out.println("<span class='image'><img src='images/bad.jpg' alt='Bad' width='150' height='150' /></span>");
    } 
  %>

   <h3>Your Quality Index is: ${QIvalue} Status is ${grade}</h3>
  </section>
   
    </body>
</html>