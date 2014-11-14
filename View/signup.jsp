<!DOCTYPE HTML>
<html>
<head>
<title>RacQual Signup</title>
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
                <h2>Register for a RacQual Account</h2>
                <p>Upon registration you will be able to enjoy the many features RacQual has to offer :) </p>
            </header>
            <div class="box">
                <form method="post" action="UserRegistrationServlet">
                    <div class="row uniform half collapse-at-2">
                        <div class="6u">
                            <input id="name" name="firstname" placeholder="First Name" required="" tabindex="1" type="text" required>
                        </div>
                        <div class="6u">
                            <input id="name" name="lastname" placeholder="Last Name" required="" tabindex="1" type="text" required>
                        </div>
                    </div>
                    <div class="row uniform half collapse-at-2">
                        <div class="6u">
                            <input id="username" name="username" placeholder="Username" required="" tabindex="2" type="text" required>
                        </div>
                        <div class="6u">
                            <input type="email" name="email" id="email" value="" placeholder="Email Address" required>
                        </div>

                    </div>
                    <div class="row uniform half collapse-at-2">
                        <div class="6u">
                            <input type="password" id="password" name="password" required="" placeholder="Password" required>
                        </div>
                        <div class="6u">
                            <input type="password" id="repassword" name="repassword" required="" placeholder="Verify Your Password" required>
                        </div>
                    </div>
                    <div class="row uniform half collapse-at-3">
                        <div class = "1u">
                            <label> Birthday: </label>
                        </div>

                        <div class="4u">
                            <select name="BirthMonth" required>
                                <option value="">Month</option>
                                <option  value="01">January</option>
                                <option value="02">February</option>
                                <option value="03" >March</option>
                                <option value="04">April</option>
                                <option value="05">May</option>
                                <option value="06">June</option>
                                <option value="07">July</option>
                                <option value="08">August</option>
                                <option value="09">September</option>
                                <option value="10">October</option>
                                <option value="11">November</option>
                                <option value="12" >December</option>
                            </select>
                        </div>
                        <div class="3u">
                            <input type="" maxlength="2" name="BirthDay"  placeholder="Day" required="">
                        </div>
                        <div class ="4u">
                            <input type="" maxlength="4" name="BirthYear" placeholder="Year" required="">
                        </div>
                    </div>
                    <div class="row uniform half collapse-at-3">
                        <div class="4u">
                            <input id="phone" name="phone" placeholder="Phone Number" required type="text">
                        </div>
                        <div class ="4u">
                            <input type="" name="city" placeholder="City" required>
                        </div>
                        <div class ="4u">
                            <input type="" name="state" placeholder="State" required>
                        </div>
                    </div>
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