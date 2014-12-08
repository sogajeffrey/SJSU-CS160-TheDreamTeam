<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 
    Organization : The Dream Team
    Version      : Dec 6, 2014
--%>

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
    </head><body>

        <%@ include file="nav.jsp" %> 

        <!-- Banner -->
        <section id="banner">
            <header>
                <h2>Try out our <em>Quality Index Calculator</em></h2>
                <a href="qicalc.jsp" class="button">Check it out</a> </header>
        </section>
        <!-- Gigantic Heading -->
        <section class="wrapper style2">
            <div class="container">
                <header class="major">
                    <h2>Tennis mortals often don't know how to pick a good racquet.</h2>
                    <p>That's why we provide a one stop shop for all of your tennis needs. Below is what we offer!</p>
                </header>
            </div>
        </section>
        <!-- Highlights -->
        <section class="wrapper style1">
            <div class="container">
                <div class="row double">
                    <section class="4u">
                        <div class="box highlight"><a href="qicalc.jsp"> <i class="icon major fa-calculator"></a></i>
                            <h3>Racquet Quality Index Calculator</h3>
                            <p>All you do is enter the mass, weight, swingweight, and balance point and we will tell you how good the racquet is!</p>
                        </div>
                    </section>
                    <section class="4u">
                        <div class="box highlight"><a href="<%= session.getAttribute("currentSessionUser") != null ? "newlisting.jsp" : "login.jsp?newlisting=1"%>"> <i class="icon major fa-edit"></a></i>
                            <h3>Sell Your Used or New Racquets</h3>
                            <p>We provide a place where you can sell your racquet to other new tennis players.</p>
                        </div>
                    </section>
                    <section class="4u">
                        <div class="box highlight"><a href="listings.jsp"> <i class="icon major fa-list-ul"></a></i>
                            <h3>View Racquet Listings</h3>
                            <p>Looking for a racquet? Buy your next racquet from RacQual!</p>
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
                    <a href=<%= session.getAttribute("currentSessionUser") != null ? "newlisting.jsp" : "login.jsp?newlisting=1"%> class="button">Click Here</a>
                </header>
            </div>
        </section>

        <!-- Copyright -->
        <div class="copyright">
            <ul class="menu">
                <li>&copy; The Dream Team. All rights reserved</li>
            </ul>
        </div>
    </div>
</body>
</html>