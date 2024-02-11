<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  	<link rel="icon" href="<%= request.getContextPath() %>/images/i_logo.png"></link>
  	<title>LoginOut</title>
  	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/ICICI_Bank.css"></link>
  	<script src="<%= request.getContextPath() %>/js/jQuery.js"></script>
  	<script src="<%= request.getContextPath() %>/js/ICICI_Bank.js"></script>
</head>
<body>
<% 
	if(session.getAttribute("map") != null && session.getAttribute("CardDetails") != null)
	{
		session.invalidate();
	}

	response.sendRedirect("register.jsp");
%>
</body>
</html>
