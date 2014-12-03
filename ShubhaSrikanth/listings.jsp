<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

	<%@ page import="Model.Listing" %>
	<%@ page import="Model.Racquet" %>

	<%@ page import="java.util.ArrayList" %>
	<%@ include file="nav.jsp" %> 


	<table border="1" style="width:100%">
	   <tr>
		<th> </th> <% /* This column is for links to forsale.jsp */ %>
		<th>Price</th>
		<th>Description</th>
		<th>Brand</th>
		<th>Model</th>
		<th>Condition</th> <% /* new or used/old */ %>
		<th>Mass (oz)</th>
		<th>Length (in)</th>
		<th>Swingweight</th>
		<th>Balance point (pts)</th>
		<th>Quality index</th>
		<th>Date listed (mm-dd-yyyy)</th>
		<th>Seller</th> <% /* TODO: Link to contact.jsp */ %>
	   </tr>

	   <%

		final int MAX_LENGTH_FOR_DESCRIPTION = 20;

		ArrayList<Listing> listings
			= (ArrayList<Listing>) request.getSession().getAttribute("allListingBeans");

		Listing nextListing;
		Racquet nextRacquet;
		Date dateListed;

		for (int i = 0; i < listings.size(); i++)
		{
		   nextListing = listings.get(i);
		   nextRacquet = nextListing.getRacket();
		   dateListed = nextListing.getDateListed();

		   String date = String.format("%2d-%2d-%4d",
			   dateListed.getMonth(), dateListed.getDate(),
			   dateListed.getYear());

		   String descr = nextListing.getDescription();

		   if (descr.length() > MAX_LENGTH_FOR_DESCRIPTION)
		   {
			descr = descr.substring(0, MAX_LENGTH_FOR_DESCRIPTION)
				+ "...";
		   }
	   %>

	   <td> <% /* TODO: Implement link to forsale.jsp */ %> </td> 
	   <td> <%= String.format("%.2f", nextListing.getPrice())%> </td>
	   <td> <%= descr%> </td>
	   <td> <%= nextRacquet.getBrand()%> </td>
	   <td> <%= nextRacquet.getModelName()%> </td>
	   <td> <%= nextListing.getNewOrOld()%> </td>
	   <td> <%= String.format("%.1f", nextRacquet.getMass())%> </td>
	   <td> <%= String.format("%.1f", nextRacquet.getLength())%> </td>
	   <td> <%= String.format("%.1f", nextRacquet.getSwingWeight())%> </td>
	   <td> <%= String.format("%.1f", nextRacquet.getBalancePoint())%> </td>
	   <td> <%= String.format("%.1f", nextRacquet.getQualityIndex())%> </td>
	   <td> <%= date%> </td>
	   <td> <% /* TODO: link to contact.jsp for seller */ %> </td>

	   <% }%>
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