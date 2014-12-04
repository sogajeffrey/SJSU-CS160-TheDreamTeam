<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
   <head>
	<title>RacQual Listing</title>
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

	<% Listing in = (Listing) session.getAttribute("listing");
	   Racquet rac = in.getRacquet();
	   Users seller = in.getUsers();
	%>

	<!-- Main -->
	<section class="wrapper style1">
	   <div class="container">
		<div id="content"> 

		   <!-- Content -->

		   <article> 
			<header>
			   <h2><%= rac.getBrand()%>  <%= rac.getModelName()%>: $<%= in.getPrice()%></h2>
			</header>
			<h3>Description</h3>
			<p> <%= in.getDescription()%></p>
			<h3>Racquet Specs</h3>
			<p><b>Mass:</b> <%= rac.getMass()%> oz </p>
			<p><b>Length:</b> <%= rac.getLength()%> in </p>
			<p><b>Swingweight:</b> <%= rac.getSwingWeight()%> </p>
			<p><b>Balance:</b> <%=rac.getBalancePoint() == 0 ? "Even-balanced"
				: Math.abs((int) rac.getBalancePoint()) + " pts head-"
				+ (rac.getBalancePoint() < 0 ? "light" : "heavy")%></p>
			<p><b>Quality Index:</b> <%= rac.getQualityIndex()%> </p>
		   </article>
		   <section id="cta" class="wrapper style1">
			<header>
			   <h2>Interested in buying?</h2>
			   <p></p>
			   <p> Seller's location: <%= seller.getCity()%>, <%= seller.getState()%> </p>
			   <p> Phone Number: <%= seller.getPhoneNumber()%></p>
			   <p> Email: <%= seller.getEmail()%></p>

			   <%--
				   <a href="mailto:<%= seller.getEmail()%>" class="button">Email</a>
			   --%>
			</header>
		   </section>
		   <div id="disqus_thread"></div>
		   <script type="text/javascript">
			var disqus_shortname = 'rqdt';
			(function () {
			   var dsq = document.createElement('script');
			   dsq.type = 'text/javascript';
			   dsq.async = true;
			   dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
			   (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
			})();
		   </script>
		   <noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
		</div>
	   </div>
	</section>

	<!-- Copyright -->
	<div class="copyright">
	   <ul class="menu">
		<li>&copy; The Dream Team. All rights reserved</li>
	   </ul>
	</div>
   </body>
</html>