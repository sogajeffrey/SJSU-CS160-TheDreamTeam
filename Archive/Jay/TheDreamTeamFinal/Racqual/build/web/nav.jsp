<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 
    Organization : The Dream Team
    Version      : Dec 6, 2014
--%>

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
            <li ><a href="discuss.jsp">General Discussion</a></li>
                <% if (null == session.getAttribute("currentSessionUser")) { %>
            <li><a href="login.jsp?newlisting=0">Login</a></li>
            <li> <a href="signup.jsp?newlisting=0">Sign up</a> </li>
                <% } else { %>
            <li><a href="newlisting.jsp">New Listing</a></li>
            <li><a href="user.jsp">Your Account</a></li>
            <li> <a href="logout.jsp">Logout</a> </li>
                <% }%>
        </ul>
    </nav>
</div>


