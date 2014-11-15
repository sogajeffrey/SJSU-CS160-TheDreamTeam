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

<!-- Header -->
<div id="header"> 
  
  <!-- Logo -->
  <h1><a href="index.jsp" id="logo">RacQual <em>by The Dream Team</em></a></h1>
  
  <!-- Nav -->
  <nav id="nav">
    <ul>
      <li><a href="index.jsp">Home</a></li>
      <li><a href="qicalc.jsp">Quality Index Calculator</a></li>
      <li class="current"><a href="listings.jsp">Classified Listings</a></li>
      <li><a href="newlisting.jsp">New Listing</a></li>
      <li ><a href="login.jsp">Login</a></li>
      <li> <a href="signup.jsp">Sign up</a> </li>
    </ul>
  </nav>
</div>

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
        <th>Image</th>
        <th>Brand</a></th>
        <th>Model</a></th>
        <th>Price</a></th>
        <th>Description</a></th>
        <th>Quality Index</a></th>
        <th>Mass</a></th>
        <th>Length</a></th>
        <th>Swing Weight</a></th>
        <th>Balance Point</a></th>
      </tr>
    </thead>
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
