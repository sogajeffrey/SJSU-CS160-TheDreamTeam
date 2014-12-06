<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 
    Organization : The Dream Team
    Version      : Dec 5, 2014
--%>

<% session.invalidate(); %>
<% response.sendRedirect("login.jsp?newlisting=0"); %>