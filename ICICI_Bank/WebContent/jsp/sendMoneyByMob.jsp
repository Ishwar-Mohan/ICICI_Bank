<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
 		
 		if(map == null)
			response.sendRedirect("login.jsp");
 	%>
	<div>
		<form class="mobile-pay-container" id="mobilePay">
			<div class="money-container">
				<nav class="payee-nav-bar">
					<a href="<%= request.getContextPath() %>/jsp/payees.jsp" class="payee-nav">My Payess</a>
					<a href="<%= request.getContextPath() %>/jsp/sendMoneyByMob.jsp" class="payee-nav" id="active">Mobile</a>
				</nav>
					<div>
						<div class="mobile-pay-details">
							<h4>From Account</h4>
							<input type="text" class="text-box" name="from-account" id="from-account" value="<%= map.get("Acc_Num")%>" disabled="disabled" maxlength="20">
						</div>
					</div>
					<div class="mobile-pay-details">
						<h4>Payee Mobile number</h4>
						<input type="text" class="text-box" name="payee-mob-number" id="payee-mob-number" onblur="validateMobilePay.payeeMobNum()" oninput="validateMobilePay.accuntNumCheck()" maxlength="10">
						<div class="errSendByMob" id="errPayMob"></div>
					</div>
					<div class="mobile-pay-details">
						<h4>Amount</h4>
						<input type="text" class="text-box" name="pay-byMob-amount" id="pay-byMob-amount" onblur="validateMobilePay.payAmount()" oninput="validateMobilePay.amountCheck()" maxlength="5">
						<div class="errSendByMob" id="errPayAmount"></div>
					</div>
					<div class="mobile-pay-details">
						<h4>Remarks</h4>
						<input type="text" class="text-box" name="mob-pay-remark" id="mob-pay-remark" maxlength="20">
					</div>
				</div>
				<input type="button" value="Proceed" class="proceed-btn" id="proceed-btn" onclick="ajaxRequest.sendMoney()">
				<div id="transfer-sucess"></div>
			</form>
		</div>
 </body>
</html>
