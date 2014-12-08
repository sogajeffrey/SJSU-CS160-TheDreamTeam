<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 
    Organization : The Dream Team
    Version      : Dec 6, 2014
--%>

<!DOCTYPE HTML>
<html>
<head>
<title>RacQual New Listing</title>
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
    <h2>New Classified Listing</h2>
    <p>Use this form to sell your Racquet!</p>
  </header>
  <div class="box">
    <form method="post" action="ListingCreatorServlet">
      <header>
        <h3>Racquet Information</h3>
      </header>
      <div class="row uniform half collapse-at-2">
        <div class="6u">
          <input name="brand" placeholder="Racquet Brand" required="" tabindex="1" type="text">
        </div>
        <div class="6u">
          <input name="model" placeholder="Racquet Model" required="" tabindex="2" type="text">
        </div>
      </div>
      <div class="row uniform half collapse-at-4">
        <div class="3u">
          <input name="mass" placeholder="Mass (oz)" required="" tabindex="1" type="text">
        </div>
        <div class="3u">
          <input name="length" placeholder="length (in)" required="" tabindex="2" type="text">
        </div>
        <div class="3u">
          <input name="swing" placeholder="Swing Weight" required="" tabindex="2" type="text">
        </div>
        <div class="3u">
          <input name="balance" placeholder="Balance (Pts from midpoint, -ve for HL)" required="" tabindex="2" type="text">
        </div>
      </div>
      <header>
        <h3>Selling Information</h3>
      </header>
      <div class="row uniform half collapse-at-3">
        <div class="4u">
          <input type="text" name="price" required="" placeholder="Price">
        </div>
        <div class="4u">
          <select name="newused" required>
            <option value="">New or Used</option>
            <option >New</option>
            <option >Used</option>
          </select>
        </div>
	   <%--
        <div class="4u">
        	Upload an Image
          <input class="buttom" name="upload" tabindex="5" value="image" type="file">
        </div>
	   --%>
      </div>
        <div class="row uniform half">
        <div class="12u">
          <textarea name="desc" placeholder="Description" rows="4"></textarea>
        </div>
      </div>
      <div class="row uniform half collapse-at-2">
      <div class="row uniform">
        <div class="12u">
            <input type="submit" class="actions align-center,button" name="submit" id="submit" tabindex="5" value="Submit"  />
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