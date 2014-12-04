<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
   <head>
	<title>RacQual User Dashboard</title>
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

	<%@ page import="Model.*" %>
	<%@ page import="java.util.Date" %>
	<%@ page import="java.util.ArrayList" %>
	<% Model.Users currentUsers = ((Model.Users) (session.getAttribute("currentSessionUser")));%>
	<h2>Welcome to RacQual <%= currentUsers.getFirstName() + " " + currentUsers.getLastName()%>!

	</h2>


	<div class="box">
	   <header>
		<h2>Here are some things you can do:</h2>
		<a href="changeusersetting.jsp" class="button">Edit Your User Info</a>
		<a href="newlisting.jsp" class="button">New Listing</a> 	
		<a href="listings.jsp" class="button">All Listings</a> 

		<br/>
		<br/>

		<h3>Your current listings:</h3>

		<table border="1" style="width:100%">
		   <tr>
			<th> </th>  <% /* This column is for edit buttons */ %>
			<th> </th>  <% /* This column is for delete buttons */ %>
			<th>Date listed (mm-dd-yyyy)</th>
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
		   </tr>

		   <%



			final int MAX_LENGTH_FOR_DESCRIPTION = 20;

			ArrayList<Listing> usersListings
				= (ArrayList<Listing>) request.getSession().getAttribute("currentSessionUsersListingBeans");

			Listing nextListing;
			Racquet nextRacquet;
			Date dateListed;

			for (int i = 0; i < usersListings.size(); i++)
			{
			   nextListing = usersListings.get(i);
			   nextRacquet = nextListing.getRacquet();
			   dateListed = new Date(((java.sql.Date) nextListing.getDateListed()).getTime());

			   final int MONTH_OFFSET = 1;
			   final int YEAR_OFFSET = 1900;

			   String date = String.format("%2d-%2d-%4d",
				   dateListed.getMonth() + MONTH_OFFSET, dateListed.getDate(),
				   dateListed.getYear() + YEAR_OFFSET);

			   String descr = nextListing.getDescription();

			   if (descr.length() > MAX_LENGTH_FOR_DESCRIPTION)
			   {
				descr = descr.substring(0, MAX_LENGTH_FOR_DESCRIPTION)
					+ "...";
			   }
		   %>

		   <tr>
			<td> <a href='editlisting.jsp?listingID=<%= nextListing.getListingID() %>' class='button' onclick='button'> Edit The Listing </a> </td>
			<td> <a href='DeleteListingServlet?listingID=<%= nextListing.getListingID()%>' class='button' onclick='button'> Delete The Listing </a> </td>
			<td> <%= date%> </td>
			<td> <%= String.format("%.2f", nextListing.getPrice())%> </td>
			<td> <%= descr%> </td>
			<td> <%= nextRacquet.getBrand()%> </td>
			<td> <%= nextRacquet.getModelName()%> </td>
			<td> <%= nextListing.getNewOrUsed()%> </td>
			<td> <%= String.format("%.1f", nextRacquet.getMass())%> </td>
			<td> <%= String.format("%.1f", nextRacquet.getLength())%> </td>
			<td> <%= nextRacquet.getSwingWeight()%> </td>
			<td> <%= String.format("%.0f", nextRacquet.getBalancePoint())%> </td>
			<td> <%= String.format("%.3f", nextRacquet.getQualityIndex())%> </td>
		   </tr>
		   <% }%>
		</table>

		<br/>
		<br/>



		<form action="DeleteUserAccountServlet" method="post">
		   <input type="submit" name="submit" value="DELETE YOUR ACCOUNT" class="button" id="submit" 

			    ></input> 
		</form>



	   </header>	
	</div>




	<!-- Footer -->
	<footer id="footer">
	   <ul class="copyright">
		<li>&copy; Dream Team. All rights reserved.</li>
	   </ul>
	</footer>
   </body>
</html>