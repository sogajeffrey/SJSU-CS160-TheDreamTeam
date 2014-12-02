<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>RacQual User Dashboard</title>
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

        <%@ page import="Model.Users" %>
        <% Model.Users currentUsers = ((Model.Users) (session.getAttribute("currentSessionUser")));%>
        <h2>Welcome to RacQual! <%= currentUsers.getFirstName() + " " + currentUsers.getLastName()%> 

        </h2>


        <div class="box">
            <header>
                <h2>Here are some things you can do:</h2>
                <a href="changeusersetting.jsp" class="button">Edit Your User Info</a>
                <a href="newlisting.jsp" class="button">New Listing</a> 	
                <a href="listings.jsp" class="button">All Listings</a> 

                <br/>
                <br/>


                <h3>Your current listings:</h3>

                <table border="1" style="width:100%">
                    <tr>
                        <th>EDIT</th>
                        <th>DELETE</th> 
                        <th>racquetID</th>
                        <th>price</th>
                        <th>neworUsed</th>
                        <th>dateListed</th>
                        <th>description</th>
                    </tr>
                    <tr>
                        <td> test1     </td>
                        <td>  test2    </td> 
                        <td>   test3   </td>
                        <td>      </td>
                        <td>      </td>
                        <td>      </td>
                        <td>      </td>
                    </tr>
                </table>

                <br/>
                <br/>



                <form action="DeleteUserAccountServlet" method="post">
                    <input type="submit" name="submit" value="DELETE YOUR ACCOUNT" class="button" id="submit" 

                           ></input> 
                </form>



            </header>	
        </div>




        <!-- Footer -->
        <footer id="footer">
            <ul class="copyright">
                <li>&copy; Dream Team. All rights reserved.</li>
            </ul>
        </footer>
    </body>
</html>