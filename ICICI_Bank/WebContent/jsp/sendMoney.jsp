<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <link rel="icon" href="<%= request.getContextPath() %>/images/i_logo.png"></link>
  <title>Infinity</title>
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/ICICI_Bank.css"></link>
  <script src="<%= request.getContextPath() %>/js/jQuery.js"></script>
  <script src="<%= request.getContextPath() %>/js/ICICI_Bank.js"></script>
 </head>
 <body>
 	<%
 		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

		if(session.getAttribute("map") == null)
			response.sendRedirect("login.jsp");

 	%>
	<jsp:include page="header.jsp"></jsp:include>
	
	<div class="send-money-page">
		<iframe src="<%= request.getContextPath() %>/jsp/sendMoneyByMob.jsp" class="iframe-transfer"></iframe>
	</div>
 </body>
</html>