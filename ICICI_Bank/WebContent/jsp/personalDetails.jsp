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

		Map map = (Map) session.getAttribute("map");
		
		if(map == null)
			response.sendRedirect("login.jsp");

 	%>
	<jsp:include page="header.jsp"></jsp:include>
	
	<div class="send-money-page" id="personal-details-container">
		<div class="money-container" id="personal-details">
			<h3><%= map.get("Full_Name") %></h3>
			<table id="personal-details-table">
				<tr>
					<th>Primary Account</th>
					<td id="accountNum"><%= map.get("Acc_Num") %></td>
				</tr>
				<tr>
					<th>Communication Address</th>
					<td id="tAddress"><%= map.get("Address") %></td>
				</tr>
				<tr>
					<th>Mobile Number</th>
					<td id="tMobile"><%= map.get("Mobile_Num") %></td>
				</tr>
				<tr>
					<th>Email-ID</th>
					<td id="tEmail"><%= map.get("Email_id") %></td>
				</tr>
				<tr>
					<th>PAN number</th>
					<td id="tPan"><%= map.get("Pan_Card") %></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>