<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 
    Document   : logout.jsp
    Created on : Nov 19, 2014, 2:22:12 PM
    Author     : Jay Patel
--%>

<% session.invalidate(); %>
<% response.sendRedirect("index.jsp"); %>