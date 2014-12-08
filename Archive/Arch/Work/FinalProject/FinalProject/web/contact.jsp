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
  <h1><a href="index.html" id="logo">RacQual <em>by The Dream Team</em></a></h1>
  
  <!-- Nav -->
  <nav id="nav">
    <ul>
      <li><a href="index.html">Home</a></li>
      <li> <a href="">Dropdown</a>
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
      <li><a href="left-sidebar.html">Left Sidebar</a></li>
      <li><a href="right-sidebar.html">Right Sidebar</a></li>
      <li><a href="two-sidebar.html">Two Sidebar</a></li>
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
      <li id="signup"> <a href="">Sign up</a> </li>
    </ul>
  </nav>
</div>
<!-- Main -->
<section id="main" class="container small">
  <header>
    <h2>Contact Us</h2>
    <p>Tell us what you think about our little operation.</p>
  </header>
  <div class="box">
    <form method="post" action="#">
      <div class="row uniform half collapse-at-2">
        <div class="6u">
          <input type="text" name="name" id="name" value="" placeholder="Name" />
        </div>
        <div class="6u">
          <input type="email" name="email" id="email" value="" placeholder="Email" />
        </div>
      </div>
      <div class="row uniform half">
        <div class="12u">
          <input type="text" name="subject" id="subject" value="" placeholder="Subject" />
        </div>
      </div>
      <div class="row uniform half">
        <div class="12u">
          <textarea name="message" id="message" placeholder="Enter your message" rows="6"></textarea>
        </div>
      </div>
      <div class="row uniform">
        <div class="12u">
          <ul class="actions align-center">
            <li>
              <input type="submit" value="Send Message" />
            </li>
          </ul>
        </div>
      </div>
    </form>
  </div>
</section>

<!-- Footer -->
<footer id="footer">
  <ul class="icons">
    <li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
    <li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
    <li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
    <li><a href="#" class="icon fa-github"><span class="label">Github</span></a></li>
    <li><a href="#" class="icon fa-dribbble"><span class="label">Dribbble</span></a></li>
    <li><a href="#" class="icon fa-google-plus"><span class="label">Google+</span></a></li>
  </ul>
  <ul class="copyright">
    <li>&copy; Untitled. All rights reserved.</li>
    <li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
  </ul>
</footer>
</body>
</html>