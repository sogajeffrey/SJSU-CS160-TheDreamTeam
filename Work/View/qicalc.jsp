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
  <header>
    <h2>Tennis Racquet Quality Index Calculator</h2>
    <p>Wondering about what your racquet's quality index is? Use the form below to find out!</p>
  </header>
  <div class="box">
    <form method="post" action="">
        <div class="12u">
          <input name="mass" placeholder="Mass (oz)" required="" tabindex="1" type="text">
        </div>
        <br>
        <div class="12u">
          <input name="length" placeholder="Length (Inches)" required="" tabindex="2" type="text">
        </div>
         <br>
        <div class="12u">
          <input name="swing" placeholder="Swing Weight" required="" tabindex="2" type="text">
        </div>
         <br>
        <div class="12u">
          <input name="balance" placeholder="Balance Point (pts from midpoint, -ve for HL)" required="" tabindex="2" type="text">
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