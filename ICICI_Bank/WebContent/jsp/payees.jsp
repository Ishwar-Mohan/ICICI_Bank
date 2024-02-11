<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  	<link rel="icon" href="<%= request.getContextPath() %>/images/i_logo.png"></link>
  	<title>Transaction by Payees</title>
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
	<div>
		<form class="mobile-pay-container" id="mobilePay">
		
			<div class="money-container">
				<nav class="payee-nav-bar">
					<a href="<%= request.getContextPath() %>/jsp/payees.jsp" class="payee-nav" id="active">My Payess</a>
					<a href="<%= request.getContextPath() %>/jsp/sendMoneyByMob.jsp" class="payee-nav">Mobile</a>
				</nav>
				<div>
					<div class="mobile-pay-details">
						<h4>From Account</h4>
						<input type="text" class="text-box" name="from-account" maxlength="20">
					</div>
					</div>
					<div class="mobile-pay-details">
						<h4>Payee Account Name</h4>
						<input type="text" class="text-box" name="payee-mob-number" maxlength="40">
					</div>
					<div class="mobile-pay-details">
						<h4>Account Type</h4>
						<input type="text" class="text-box" name="pay-byMob-amount" maxlength="15">
					</div>
					<div class="mobile-pay-details">
						<h4>Account Number</h4>
						<input type="text" class="text-box" name="mob-pay-remark" maxlength="20">
					</div>
					<div class="mobile-pay-details">
						<h4>Confirm Account Number</h4>
						<input type="text" class="text-box" name="mob-pay-remark" maxlength="20">
					</div>
					<div class="mobile-pay-details">
						<h4>IFSC</h4>
						<input type="text" class="text-box" name="mob-pay-remark" maxlength="20">
					</div>
					<div class="mobile-pay-details">
						<h4>Remarks</h4>
						<input type="text" class="text-box" name="mob-pay-remark" maxlength="20">
					</div>
				</div>
				<input type="button" value="Proceed" class="proceed-btn">
				<div id="transfer-sucess"></div>
			</div>
		</form>
	</div>
</body>
</html>
