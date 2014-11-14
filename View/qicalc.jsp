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
      <li><a href="newlisting.html">New Listing</a></li>
      <li ><a href="login.jsp">Login</a></li>
      <li> <a href="signup.jsp">Sign up</a> </li>
    </ul>
  </nav>
</div>
<!-- Main -->
<section id="main" class="container small">
  <header>
    <h2>Tennis Racquet Quality Index Calculator</h2>
    <p>Wondering about what your quality index is? Use the form below to find out!</p>
  </header>
  <div class="box">
    <form method="post" action="#">
        <div class="12u">
          <input name="mass" placeholder="Mass" required="" tabindex="1" type="text">
        </div>
        <br>
        <div class="12u">
          <input name="length" placeholder="Weight" required="" tabindex="2" type="text">
        </div>
         <br>
        <div class="12u">
          <input name="swing" placeholder="Swing Weight" required="" tabindex="2" type="text">
        </div>
         <br>
        <div class="12u">
          <input name="balance" placeholder="Balance Point" required="" tabindex="2" type="text">
        </div>
         <br>
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