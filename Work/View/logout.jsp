<%-- 
    Document   : logout.jsp
    Created on : Nov 19, 2014, 2:22:12 PM
    Author     : Jay Patel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% session.invalidate(); %>
<% response.sendRedirect("index.jsp"); %>