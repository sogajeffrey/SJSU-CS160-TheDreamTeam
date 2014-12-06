<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- 
    Organization : The Dream Team
    Version      : Dec 5, 2014
--%>

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
	   $(document).ready(function () {
		$('#listings').dataTable(
			  {"sDom": '<"top"p>'});
	   });
	</script>
   </head><body>

	<%@ page import="Controller.GetUsersListingsBeansServlet" %>

	<%@ page import="Model.Listing" %>
	<%@ page import="Model.Racquet" %>

	<%@ page import="java.util.ArrayList" %>
	<%@ include file="nav.jsp" %> 
	<!-- Main-->
	<%
	   // Draw the user's listings into the session data by invoking the
	   // servlet that has been made for this purpose.
	   GetUsersListingsBeansServlet servlet = new GetUsersListingsBeansServlet();
	   servlet.updateListingBeansInSessions(request, response, session);
//            new GetUsersListingsBeansServlet().updateListingBeansInSessions(request, response, session);

	   ArrayList<Listing> listings
		   = (ArrayList<Listing>) session.getAttribute("allListingBeans");
	%>
	<section 
	   id = "main" class  

	   ="container small">
	   <header>
		<h2>All Classified Listings</h2>
		<p> Find a racquet you like? Navigate to the seller's contact info and take action! </p>
	   </header>
	</section>
	<section id="main" class  

		   ="container large">
	   <table id="listings" class  

		    ="display" cellspacing="3" width="100%">
		<thead>
		   <tr>
			<th></th>
			<th><b>Brand</b></a></th>
			<th><b>Model</b></a></th>
			<th><b>Price</b></a></th>
			<th><b>Quality Index (Lower is Better)</b></a></th>
			<th><b>Mass</b></a></th>
			<th><b>Length</b></a></th>
			<th><b>Swing Weight</b></a></th>
			<th><b>Balance Point</b></a></th>
		   </tr>
		</thead>
		<%
		   Racquet rac = new Racquet();

		   int i;
		   for (i = 0; i < listings.size(); i++)
		   {
			rac = listings.get(i).getRacquet();
		%>
		<tr align="center">
		   <%--  %>' --%>
		   <td> <a href='individuallistingservlet?listingID=<%= listings.get(i).getListingID()%>' class='button' onclick='button'>View</a> </td>
		   <td> <%= rac.getBrand()%> </td>
		   <td> <%= rac.getModelName()%> </td>
		   <td> <%= listings.get(i).getPrice()%> </td>
		   <td> <%= rac.getQualityIndex()%> </td>
		   <td> <%= rac.getMass()%> </td>
		   <td> <%= rac.getLength()%> </td>
		   <td> <%= rac.getSwingWeight()%> </td>
		   <td> <%= rac.getBalancePoint()%> </td>
		</tr>

		<%
		   }
		%>
	   </table>
	</section>

	<!-- Footer -->
	<footer id="footer">
	   <ul class="copyright">
		<li>&copy; Dream Team. All rights reserved.</li>
	   </ul>
	</footer>
   </body>
</html>

