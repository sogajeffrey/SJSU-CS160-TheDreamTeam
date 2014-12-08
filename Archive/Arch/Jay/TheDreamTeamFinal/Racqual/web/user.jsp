<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 
    Organization : The Dream Team
    Version      : Dec 6, 2014
--%>

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
			<th><b>Date listed</b></th>
			<th><b>Price</b></th>
			<th><b>Description</b></th>
			<th><b>Brand</b></th>
			<th><b>Model</b></th>
			<th><b>Condition</b></th> <% /* new or used/old */ %>
			<th><b>Mass (oz)</b></th>
			<th><b>Length (in)</b></th>
			<th><b>Swingweight</b></th>
			<th><b>Balance point (pts)</b></th>
			<th><b>Quality index</b></th>
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

			   String month;
			   switch (dateListed.getMonth())
			   {
				case 0:
				   month = "JAN";
				   break;
				case 1:
				   month = "FEB";
				   break;
				case 2:
				   month = "MAR";
				   break;
				case 3:
				   month = "APR";
				   break;
				case 4:
				   month = "MAY";
				   break;
				case 5:
				   month = "JUN";
				   break;
				case 6:
				   month = "JUL";
				   break;
				case 7:
				   month = "AUG";
				   break;
				case 8:
				   month = "SEP";
				   break;
				case 9:
				   month = "OCT";
				   break;
				case 10:
				   month = "NOV";
				   break;
				default:
				   month = "DEC";
			   }

			   final int YEAR_OFFSET = 1900;
			   String date = String.format("%s %2d, %4d",
				   month, dateListed.getDate(),
				   dateListed.getYear() + YEAR_OFFSET);

			   String descr = nextListing.getDescription();

			   if (descr.length() > MAX_LENGTH_FOR_DESCRIPTION)
			   {
				descr = descr.substring(0, MAX_LENGTH_FOR_DESCRIPTION)
					+ "...";
			   }
		   %>

		   <tr align="center">
			<td> <a href='editlisting.jsp?listingID=<%= nextListing.getListingID()%>' class='text' onclick='button' style="width: 50px; height: 50px"> Edit </a> </td>
			<td> <a href='DeleteListingServlet?listingID=<%= nextListing.getListingID()%>' class='text' onclick='button'> Delete </a> </td>
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