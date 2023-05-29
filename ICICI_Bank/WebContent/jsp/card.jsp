<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <link rel="icon" href="<%= request.getContextPath() %>/images/i_logo.png"></link>
  <title>Infinity.icicibank.com</title>
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/ICICI_Bank.css"></link>
  <script src="<%= request.getContextPath() %>/js/jQuery.js"></script>
  <script src="<%= request.getContextPath() %>/js/ICICI_Bank.js"></script>
 </head>
 </head>
 <body>
 	<%
 		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
 	
 		if(session.getAttribute("map") == null)
			response.sendRedirect("login.jsp");
 	
 		Map map = (Map) session.getAttribute("CardDetails");
 	%>
 	<jsp:include page="header.jsp"></jsp:include>
 	
	<div class="atm-debit-card">
		<div class="virtual-db">
			<h3>Virtual Debit Card</h3>
		</div>
		<div class="debit-card-container">
			<div class="acc-type-num">
				<p>Saving Account</p>
				<h5>6484296521632</h5>
			</div>
			<div class="service-container">
				<div class="debit-card-img">
					<div class="dcard-img-container">
						<img src="<%= request.getContextPath() %>/images/debit-card.jpg" alt="image not found" id="debit-card">
					<div class="debit-card-details">
							<p><%= map.get("Debit_Card_Number") %></p>
						<div>
						<div class="valid">
							<p class="valid-txt">Valid From</p>
							<p class="valid-date"><%= map.get("Valid_From") %></p>
						</div>
						<div class="valid">
							<p class="valid-txt">Valid Thru</p>
							<p class="valid-date"><%= map.get("Valid_Thru") %></p>
						</div>
						<div class="valid">
							<p class="valid-cvv">CVV</p>
							<p class="valid-date"><%= map.get("CVV") %></p>
						</div>
					<div class="clr"></div>
					<p class="name"><%= map.get("Full_Name") %></p>
				</div>
			</div>
					</div>
				</div>
				<div class="card-options">
					<h4>Service Request</h4>
					<a href="<%= request.getContextPath() %>/jsp/generatePin.jsp">
						<div class="service-options">
							<p>Generate<br>Pin</p>
						</div>
					</a>
					<div class="service-options">
						<p>Block<br>Card</p>
					</div>
					<div class="service-options">
						<p>Reissue<br>Card</p>
					</div>
					<div class="service-options">
						<p>Manage<br>Card Limit</p>
					</div>
				</div>
				<div class="clr"></div>
			</div>
		</div>
	</div>
 </body>
</html>
