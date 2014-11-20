<<<<<<< Updated upstream
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Model.Users" %>
  <jsp:useBean id="link" scope="application" class = "Model.Users" />   
  <% Model.Users currentUser = ((Model.Users) (session.getAttribute("currentSessionUser")));%>
  
<div id="header"> 
    <h1><a href="index.jsp" id="logo">RacQual <em>by The Dream Team</em></a></h1>
    <nav id="nav">
    <ul>
      <li><a href="index.jsp">Home</a></li>
      <li><a href="qicalc.jsp">Quality Index Calculator</a></li>
      <li ><a href="listings.jsp">Classified Listings</a></li>
      <li><a href="newlisting.jsp">New Listing</a></li>
     <% if(null == session.getAttribute("currentSessionUser")) { %>
      <li><a href="login.jsp">Login</a></li>
      <li> <a href="signup.jsp">Sign up</a> </li>
      <% } else { %>
      <li><a href="user.jsp">Your Account</a></li>
      <li> <a href="logout.jsp">Logout</a> </li>
      <% } %>
    </ul>
  </nav>
</div>
     
  
 
=======
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Model.Users" %>
  <jsp:useBean id="link" scope="application" class = "Model.Users" />
  <% Model.Users currentUser = ((Model.Users) (session.getAttribute("currentSessionUser")));%>

<div id="header">
    <h1><a href="index.jsp" id="logo">RacQual <em>by The Dream Team</em></a></h1>
    <nav id="nav">
    <ul>
      <li><a href="index.jsp">Home</a></li>
      <li><a href="qicalc.jsp">Quality Index Calculator</a></li>
      <li ><a href="listings.jsp">Classified Listings</a></li>
      <li><a href="newlisting.jsp">New Listing</a></li>
     <% if(null == session.getAttribute("currentSessionUser")) { %>
      <li><a href="login.jsp">Login</a></li>
      <li> <a href="signup.jsp">Sign up</a> </li>
      <% } else { %>
      <li><a href="user.jsp">Your Account</a></li>
      <li> <a href="logoutservlet">Logout</a> </li>
      <% } %>
    </ul>
  </nav>
</div>
>>>>>>> Stashed changes
