<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
   <head>
	<title>RacQual QI Calc</title>
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
	<section id="main" class="container small">
	   <div class="row uniform collapse-at-2">
		<div>
		   <h2>Quality Index Calculator</h2>
		   <p>Want's your racquet's quality index? Use the form below to find out!</p>
		   <div class="box">
			<form method="post" action="QIServelet">
			   <div class="row uniform collapse-at-4">
				<div>
				   <label for="mass" style="font-weight:normal">Mass (oz)</label>
				</div>
				<div>
				   <input name="mass" type="number" value='11.0' opacity='1'
					    class="4u" tabindex="2" step='0.1' required>
				</div>
				<div>
				   <label for="length" style="font-weight:normal">Length (in)</label>
				</div>
				<div>
				   <input name="length" type="number" value='27.0'
					    class="4u" tabindex="2" step='0.1' required>
				</div>
			   </div>
			   <div class="row uniform collapse-at-2">
				<div>
				   <label for="swing" style="font-weight:normal">Swingweight</label>
				</div>
				<div>
				   <input name="swing" value='325' class="3u" min='1'
					    required="" tabindex="2" type="number">
				</div>
			   </div>
			   <div class="row uniform collapse-at-2">
				<div>
				   <label for="balance" style="font-weight:normal">Balance Point (pts from midpoint, -ve for HL)</label>
				</div>
				<div>
				   <input name="balance" value='-2' class="3u"
					    required="" tabindex="2" type="number">
				</div>
			   </div>
			   <br>
			   <div>
				<ul class="actions align-center">
				   <input class="buttom" name="submit" id="submit" tabindex="5" value="Submit" type="submit">
				</ul>
			   </div>
			</form>
		   </div>
		</div>
		<div>
		   <br>
		   <%
			final int QICALC_ICON_WIDTH = 220;
			final int QICALC_ICON_HEIGHT = 282;
		   %>
		   <span class='image'>
			<img src='images/qicalc.jpg' alt='qicalc'
			     width='<%= QICALC_ICON_WIDTH%>'
			     height='<%= QICALC_ICON_HEIGHT%>' />
		   </span>
		</div>
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