<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
    <head>
        <title>RacQual Classified Listings</title>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery.dropotron.min.js"></script>
        <script src="js/skel.min.js"></script>
        <script src="js/skel-layers.min.js"></script>
        <script src="js/init.js"></script>
        <script src="js/jquery.dataTables.js"></script>
        <noscript>
        <link rel="stylesheet" href="css/skel.css" />
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="css/style-wide.css" />
        </noscript>
        <script>
            $(document).ready(function () {
                $('#listings').dataTable(
                        {"sDom": '<"top"p>'});
            });
        </script>
    </head><body>

        <%@ page import="Controller.GetUsersListingsBeansServlet" %>

        <%@ page import="Model.Listing" %>
        <%@ page import="Model.Racquet" %>

        <%@ page import="java.util.ArrayList" %>
        <%@ include file="nav.jsp" %> 
        <!-- Main-->
        <%
            // Draw the user's listings into the session data by invoking the
            // servlet that has been made for this purpose.
            GetUsersListingsBeansServlet servlet = new GetUsersListingsBeansServlet();
            servlet.updateListingBeansInSessions(request, response, session);
//            new GetUsersListingsBeansServlet().updateListingBeansInSessions(request, response, session);

            ArrayList<Listing> listings
                    = (ArrayList<Listing>) session.getAttribute("allListingBeans");
        %>
        <section 
            id = "main" class  

            ="container small">
            <header>
                <h2>All Classified Listings</h2>
                <p> Find a racquet you like? Navigate to the seller's contact info and take action! </p>
            </header>
        </section>
        <section id="main" class  

                 ="container large">
            <table id="listings" class  

                   ="display" cellspacing="3" width="100%">
                <thead>
                    <tr>
                        <th>View Listing </th>
                        <th>Brand</a></th>
                        <th>Model</a></th>
                        <th>Price</a></th>
                        <th>Quality Index</a></th>
                        <th>Mass</a></th>
                        <th>Length</a></th>
                        <th>Swing Weight</a></th>
                        <th>Balance Point</a></th>
                    </tr>
                </thead>
                <%
                    Listing li = new Listing();
                    Racquet rac = new Racquet();
                    for (int i = 0;
                            i < listings.size();
                            i++) {

                        li = listings.get(i);
                        rac = li.getRacket();
                %>
                <tr><td><a href='individuallistingservlet?listing=li.getListingID()' class='button' onclick="button">View The Listing!</a></td>;
                <%--
                <tr>
                    <td>
                        <input
                            type = 'button'
                            value = "View The Listing!"
                            onclick = 
                            <%
                                // Tried writing some javascript, but gave up. Reason: worked from 9:30 AM to 1 AM. :(
                            %>>
                    </td>;
                --%>

                    <td> <%= rac.getBrand()%> </td>;
                    <td> <%= rac.getModelName()%> </td>;
                    <td> <%= li.getPrice()%> </td>;
                    <td> <%= rac.getQualityIndex()%> </td>;
                    <td> <%= rac.getMass()%> </td>;
                    <td> <%= rac.getLength()%> </td>;
                    <td> <%= rac.getSwingWeight()%> </td>;
                    <td> <%= rac.getBalancePoint()%> </td>;
                </tr>;

                <%
                    }
                %>
        </section>

        <!-- Footer -->
        <footer id="footer">
            <ul class="copyright">
                <li>&copy; Dream Team. All rights reserved.</li>
            </ul>
        </footer>

    </body>
</html>

