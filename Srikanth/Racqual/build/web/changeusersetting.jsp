<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Change User Setting</title>
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
        <%@ page import="Model.Users" %>
        <% Model.Users currentUsers = ((Model.Users) (session.getAttribute("currentSessionUser")));%>

        <!-- Main -->
        <section id="main" class="container small">
            <header>
                <h2>Change your User Account Settings</h2>
                <p>Below is your current profile settings. To change any value simply edit the field. Your Password is not displayed for obvious reasons, if you wish to change your password enter a new one and verify it.</p>
            </header>
            <div class="box">
                <form method="post" action="UserUpdateServlet">
                    <div class="row uniform half collapse-at-2">
                        <div class="6u">
                            <input id="name" name="firstname" placeholder="First Name" tabindex="1" type="text" value="<%= currentUsers.getFirstName() %>" >
                        </div>
                        <div class="6u">
                            <input id="name" name="lastname" placeholder="Last Name"  tabindex="1" type="text" value="<%= currentUsers.getLastName() %>" >
                        </div>
                    </div>
                    <div class="row uniform">
                        <div class="12u">
                            <input type="email" name="email" id="email" placeholder="Email Address" value="<%= currentUsers.getEmail() %>">
                        </div>

                    </div>
                    <div class="row uniform half collapse-at-2">
                        <div class="6u">
                            <input type="password" id="password" name="password" placeholder="Password" value="<%= currentUsers.getPassWord() %>">
                        </div>
				<%--
                        <div class="6u">
                            <input type="password" id="repassword" name="repassword" placeholder="Verify Your Password" value="<%= currentUsers.getPassWord() %>">
                        </div>
				--%>
                    </div>
                    <div class="row uniform half collapse-at-3">


                        <div class="row uniform half collapse-at-3">
                            <div class="4u">
                                <input id="phone" name="phone" placeholder="Phone Number" type="text" value="<%= currentUsers.getPhoneNumber() %>">
                            </div>
                            <div class ="4u">
                                <input type="text" name="city" placeholder="City" value="<%= currentUsers.getCity() %>">
                            </div>
                            <div class ="4u">
                                <input type="text" name="state" placeholder="State" value="<%= currentUsers.getState() %>">
                            </div>
                        </div>
                        <div class="row uniform">
                            <div class="12u">
                                <input class="buttom" name="submit" id="submit" tabindex="5" value="Submit" type="submit">
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
