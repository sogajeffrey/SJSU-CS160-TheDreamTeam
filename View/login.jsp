<?php
	session_start();
	$username = $_POST['username'];
	$password = $_POST['password'];
	$message = "";
	include("connect.php");
	$result = mysql_query("SELECT uID FROM customerinfo WHERE uID='" . $_POST["username"] . "' and password = '". $_POST["password"]."'");
	$row  = mysql_fetch_array($result);
	if(is_array($row)) {
	$_SESSION["uID"] = $row[uID];	
	//$_SESSION["aID"] = $row[accountID];
	header("Location:user.php");
	} 
	if(!is_array($row)) 
	{
		//$message = "Invalid Username or Password!";
	}
	if(isset($_SESSION["uID"])) 
	{
	header("Location:user.php");
	}

?>
<!DOCTYPE HTML>
<html>
<head>
<title>Login Monkey Bank of America</title>
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
<link rel="stylesheet" href="css/style-desktop.css" />
</noscript>
</head><body class="homepage">

<!-- Header -->
<header id="header">
  <div class="logo container">
    <div>
      <h1><a href="index.html" id="logo">The Monkey Bank of America</a></h1>
      <p>by The Monkey Coders</p>
    </div>
  </div>
</header>

<!-- Nav -->
<nav id="nav" class="skel-layers-fixed">
  <ul>
    <li class="current"><a href="index.php">Home</a></li>
    <li><a href="#">Checking Accounts</a></li>
    <li><a href="#">Savings Accounts</a></li>
    <li><a href="#">Monkey Loans</a></li>
    <?php
						if(isset($_SESSION['uID'])) {
							echo "<li><a href=\"user.php\">Profile</a></li>";
							echo "<li><a href=\"logout.php\">Log Out</a></li>";
						} else {
							echo "<li><a href=\"login.php\">Login</a></li>";
							echo "<li><a href=\"register.php\">Register</a></li>";
						}
					?>
  </ul>
</nav>

<!-- Main -->
<section id="main" class="container small">
  <header>
    <h2>Login to the Monkey Bank</h2>
  </header>
  <div class="box">
    <form method=post action="login.php">
      <div class="row uniform half collapse-at-2">
        <div class="6u">
          <input type="text" name="username" placeholder="Username" />
        </div>
        <div class="6u">
          <input type="password" name="password" placeholder="Password" />
        </div>
      </div>
      <div class="message">
        <?php if($message!="") { echo $message; } ?>
      </div>
      <div class="row uniform">
        <div class="12u">
          <ul class="actions align-center">
            <li>
              <input type="submit" value="Login" />
            </li>
          </ul>
        </div>
      </div>
    </form>
  </div>
</section>

<!-- Footer -->
<footer id="footer">
  <ul class="copyright">
    <li>&copy; Jeffrey Su. All rights reserved.</li>
  </ul>
</footer>
</body>
</html>
