<!DOCTYPE HTML>
<html>
<head>
<title>RacQual by The Dream Team</title>
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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script>
$(document).ready(function(){
				$('#login-trigger').click(function(){
					$(this).next('#login-content').slideToggle();
					$(this).toggleClass('active');					
					
					if ($(this).hasClass('active')) $(this).find('span').html('&#x25B2;')
						else $(this).find('span').html('&#x25BC;')
					})
		  });
</script>
</head><body>

<!-- Header -->
<div id="header"> 
  
  <!-- Logo -->
  <h1><a href="index.jsp" id="logo">RacQual <em>by The Dream Team</em></a></h1>
  
  <!-- Nav -->
  <nav id="nav">
    <ul>
      <li class="current"><a href="index.jsp">Home</a></li>
      <li> <a href="">temp</a>
        <ul>
          <li><a href="#">Lorem dolor</a></li>
          <li><a href="#">Magna phasellus</a></li>
          <li><a href="#">Etiam sed tempus</a></li>
          <li> <a href="">Submenu</a>
            <ul>
              <li><a href="#">Lorem dolor</a></li>
              <li><a href="#">Phasellus magna</a></li>
              <li><a href="#">Magna phasellus</a></li>
              <li><a href="#">Etiam nisl</a></li>
              <li><a href="#">Veroeros feugiat</a></li>
            </ul>
          </li>
          <li><a href="#">Veroeros feugiat</a></li>
        </ul>
      </li>
      <li><a href="left-sidebar.html">Quality Index Calculator</a></li>
      <li><a href="right-sidebar.html">Classified Listings</a></li>
      <li><a href="newlisting.html">New Listing</a></li>
      <li><a href="no-sidebar.html">No Sidebar</a></li>    
      <li id="login"> <a id="login-trigger" href="#"> Log in <span>▼</span> </a>
        <div id="login-content">
          <form>
            <fieldset id="inputs">
              <input id="username" type="email" name="Email" placeholder="Your email address" required>
              <input id="password" type="password" name="Password" placeholder="Password" required>
            </fieldset>
            <fieldset id="actions">
              <input type="submit" id="submit" value="Log in">
              <label>
                <input type="checkbox" checked="checked">
                Keep me signed in</label>
            </fieldset>
          </form>
        </div>
      </li>
      <li id="signup"> <a href="signup.jsp">Sign up</a> </li>
    </ul>
  </nav>
</div>

<!-- Banner -->
<section id="banner">
  <header>
    <h2>Try out our <em>Quality Index Calculator</em></h2>
    <a href="#" class="button">Check it out</a> </header>
</section>

<!-- Highlights -->
<section class="wrapper style1">
  <div class="container">
    <div class="row double">
      <section class="4u">
        <div class="box highlight"> <i class="icon major fa-paper-plane"></i>
          <h3></h3>
          <p></p>
        </div>
      </section>
      <section class="4u">
        <div class="box highlight"> <i class="icon major fa-pencil"></i>
          <h3></h3>
          <p></p>
        </div>
      </section>
      <section class="4u">
        <div class="box highlight"> <i class="icon major fa-wrench"></i>
          <h3></h3>
          <p></p>
        </div>
      </section>
    </div>
  </div>
</section>

<!-- Gigantic Heading -->
<section class="wrapper style2">
  <div class="container">
    <header class="major">
      <h2>A tennis racquet's Quality Index is very important</h2>
      <p>Thats why we provide a very easy to use Quality Index calculator</p>
    </header>
  </div>
</section>

<!-- Posts -->
<section class="wrapper style1">
  <div class="container">
    <div class="row">
      <section class="6u">
        <div class="box post"> <a href="#" class="image left"><img src="images/pic01.jpg" alt="" /></a>
          <div class="inner">
            <h3></h3>
            <p></p>
          </div>
        </div>
      </section>
      <section class="6u">
        <div class="box post"> <a href="#" class="image left"><img src="images/pic02.jpg" alt="" /></a>
          <div class="inner">
            <h3></h3>
            <p></p>
          </div>
        </div>
      </section>
    </div>
    <div class="row">
      <section class="6u">
        <div class="box post"> <a href="#" class="image left"><img src="images/pic03.jpg" alt="" /></a>
          <div class="inner">
            <h3></h3>
            <p></p>
          </div>
        </div>
      </section>
      <section class="6u">
        <div class="box post"> <a href="#" class="image left"><img src="images/pic04.jpg" alt="" /></a>
          <div class="inner">
            <h3></h3>
            <p></p>
          </div>
        </div>
      </section>
    </div>
  </div>
</section>

<!-- CTA -->
<section id="cta" class="wrapper style3">
  <div class="container">
    <header>
      <h2>Want to sell a tennis racquet?</h2>
      <a href="#" class="button">Click Here</a> </header>
  </div>
</section>

<!-- Footer -->
<div id="footer">
  <div class="container">
    <div class="row ">
      <div class="6u">
        <div class="row collapse-at-2">
          <section class="6u">
            <h3></h3>
            <ul class="links">

            </ul>
          </section>
          <section class="6u">
            <h3></h3>
            <ul class="links">

            </ul>
          </section>
        </div>
      </div>
     
    </div>
  </div>
    
  <!-- Copyright -->
  <div class="copyright">
    <ul class="menu">
      <li>&copy; The Dream Team. All rights reserved</li>
    </ul>
  </div>
</div>
</body>
</html>