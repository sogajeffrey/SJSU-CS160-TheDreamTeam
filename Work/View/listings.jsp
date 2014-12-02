<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Model.Listing" %>
<%@ page import="Model.Racquet" %>
<!DOCTYPE HTML>
<html>
<head>
<title>RacQual Classified Listings</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<script src="js/jquery.min.js"></script>
<script src="js/jquery.dropotron.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/skel-layers.min.js"></script>
<script src="js/init.js"></script>
<script src="js/jquery.dataTables.js"></script>
<noscript>
<link rel="stylesheet" href="css/skel.css" />
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/style-wide.css" />
</noscript>
<script>			
$(document).ready(function() {
    $('#listings').dataTable(
	{"sDom": '<"top"p>'});
} );
	</script>
</head><body>

<%@ include file="nav.jsp" %> 
<% ArrayList racquets = (ArrayList)request.getAttribute("allRacquets");

<!-- Main -->
<section id="main" class="container small">
  <header>
    <h2>All Classified Listings</h2>
    <p> Find a racquet you like? Click on the picture to learn more about it and express your interest</p>
  </header>
</section>
<section id="main" class="container large">
  <table id="listings" class="display" cellspacing="3" width="100%">
    <thead>
      <tr>
        <th>View Listing </th>
        <th>Brand</a></th>
        <th>Model</a></th>
        <th>Price</a></th>
        <th>Quality Index</a></th>
        <th>Mass</a></th>
        <th>Length</a></th>
        <th>Swing Weight</a></th>
        <th>Balance Point</a></th>
      </tr>
       </thead>
       <% Listing li = new Listing();
		Racquet rac = new Racquet();
	   for(int i=0; i < racquets.size(); i++)
    {
        
        li = (Listing) racquets.get(i);
		rac = (Racquet) li.getRacquet();
        
           echo " <tr><td><a href='individuallistingservlet?listing=li.getListingID()' class='button'>View The Listing!</a></td>";
           echo " <td> rac.getBrand() </td>";
           echo " <td> rac.getModel() </td>";
           echo " <td> li.getPrice() </td>";
           echo " <td> rac.getQualityIndex() </td>";
		   echo " <td> rac.getMass() </td>";
		   echo " <td> rac.getLength() </td>";
		   echo " <td> rac.getSwingWeight() </td>";
		   echo " <td> rac.getBalancePoint() </td>";
		   echo  " </tr>";
	}
	%>
</section>

<!-- Footer -->
<footer id="footer">
  <ul class="copyright">
    <li>&copy; Dream Team. All rights reserved.</li>
  </ul>
</footer>
</body>
</html>

