<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 
    Organization : The Dream Team
    Version      : Dec 6, 2014
--%>

<!DOCTYPE HTML>
<html>
   <head>
	<title>RacQual Edit Listing</title>
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

	<%@ page import="Model.*" %>
	<%@ page import="java.util.ArrayList" %>
	<%@ page import="java.util.Iterator" %>

	<!-- Main -->
	<section id="main" class="container small">
	   <%
		final int LISTING_ID = Integer.parseInt(request.getParameter("listingID"));

		Listing li;
		Iterator<Listing> listingIter
			= ((ArrayList<Listing>) session.getAttribute(
				"currentSessionUsersListingBeans")).iterator();
		do
		{
		   li = listingIter.next();
		} while (listingIter.hasNext() && li.getListingID() != LISTING_ID);

		Racquet rac = li.getRacquet();

	   %>
	   <header>
		<h2>Edit your Classified Listing</h2>
		<p>Use this form to edit your classified listing.</p>
	   </header>
	   <div class="box">
		<form method="post" action="EditListingServlet">
		   <input name="listingID" type="hidden" value="<%= LISTING_ID %>" >
		   <header>
			<h3>Racquet Information</h3>
		   </header>
		   <div class="row uniform half collapse-at-2">
			<div class="6u">
			   <input name="brand" placeholder="Racquet Brand" tabindex="1" type="text" value="<%= rac.getBrand()%>" >
			</div>
			<div class="6u">
			   <input name="model" placeholder="Racquet Model" tabindex="2" type="text" value="<%= rac.getModelName()%>">
			</div>
		   </div>
		   <div class="row uniform half collapse-at-4">
			<div class="3u">
			   <input name="mass" placeholder="Mass" tabindex="1" type="text" value="<%= rac.getMass()%>">
			</div>
			<div class="3u">
			   <input name="length" placeholder="Length" tabindex="2" type="text" value="<%= rac.getLength()%>">
			</div>
			<div class="3u">
			   <input name="swing" placeholder="Swing Weight" tabindex="2" type="text" value="<%= rac.getSwingWeight()%>">
			</div>
			<div class="3u">
			   <input name="balance" placeholder="Balance Point" tabindex="2" type="text" value="<%= rac.getBalancePoint()%>">
			</div>
		   </div>
		   <header>
			<h3>Selling Information</h3>
		   </header>
		   <div class="row uniform half collapse-at-2">
			<div class="6u">
			   <input type="text" name="price" placeholder="Price" value="<%= li.getPrice()%>">
			</div>
			<div class="6u">
			   <select name="newused" >
				<option><%= li.getNewOrUsed()%></option>
				<option >New</option>
				<option >Used</option>
			   </select>
			</div>
		   </div>
		   <div class="row uniform half">
			<div class="12u">
			   <textarea name="desc" placeholder="Description" rows="4"> <%= li.getDescription()%></textarea>
			</div>
		   </div>
		   <div class="row uniform half collapse-at-2">
			<div class="row uniform">
			   <div class="12u">
				<ul class="actions align-center">
				   <input class="buttom" name="submit" id="submit" tabindex="5" value="Submit" type="submit">
				</ul>
			   </div>
			</div>
		</form>
	   </div>
	</section>

	<!-- Footer -->
	<footer id="footer">
	   <ul class="copyright">
		<li>&copy; The Dream Team. All rights reserved.</li>
	   </ul>
	</footer>
   </body>
</html>