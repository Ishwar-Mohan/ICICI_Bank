<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <link rel="icon" href="<%= request.getContextPath() %>/images/i_logo.png"></link>
  <title>Transaction by Mobile</title>
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/ICICI_Bank.css"></link>
  <script src="<%= request.getContextPath() %>/js/jQuery.js"></script>
  <script src="<%= request.getContextPath() %>/js/ICICI_Bank.js"></script>
</head>
<body>
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

		Map map = (Map) session.getAttribute("map");
		Map cardDetails = (Map) session.getAttribute("CardDetails");
		
		if(map == null && cardDetails == null)
			response.sendRedirect("login.jsp");
		
 	%>
 	
	<jsp:include page="header.jsp"></jsp:include>
	
	<div class="send-money-page" id="personal-details-container">
		<div class="generate-pin">
			<h2>Generate Debit Card PIN</h2>
		</div>
		<div class="money-container" id="personal-details">
			<div class="debit-card-pin-txt">
				<h3>Generate Debit Card PIN</h3>
			</div>
			<form action="../ServletController" method="post" id="pin-change">
			<input name="requestType" type="hidden" value="changePinRequest">
			<table>
				<tr>
					<th>Select Account Number</th>
					<td id="accountNum">
						<input type="text" class="text-box" name="debitcard-from-account" value="<%= map.get("Acc_Num") %>" id="from-account" disabled="disabled">
					</td>
				</tr>
				<tr>
					<th>Debit Card Number</th>
					<td id="tAddress">
						<input type="text" class="text-box" name="debit-card-number" value="<%= cardDetails.get("Debit_Card_Number") %>" id="debit-card-number" disabled="disabled">
					</td>
				</tr>
				<tr>
					<th>Mobile Number</th>
					<td id="tEmail">
						<input type="text" class="text-box" name="mobile-number" value="<%= map.get("Mobile_Num") %>" id="cvv-number" disabled="disabled">
					</td>
				</tr>
				<tr>
					<th>CVV Number</th>
					<td id="tMobile">
						<input type="text" class="text-box" name="cvv-number" id="cvv-number" maxlength="3">
					</td>
				</tr>
				<tr>
					<th>Add Pin</th>
					<td id="tMobile">
						<input type="text" class="text-box" name="add-pin" id="add-pin" maxlength="8">
					</td>
				</tr>
			</table>
			<input type="submit" value="Submit" class="proceed-btn" id="generate-pin-btn">
			</form>
		</div>
	</div>
</body>
</html>