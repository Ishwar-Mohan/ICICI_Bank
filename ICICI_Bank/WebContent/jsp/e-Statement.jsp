<%@page import="java.util.Map"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="com.icici_bank.helper.Helper"%>
<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
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
	
	<div class="send-money-page" id="statements">
		<div class="money-container">
				<table>
					<tr>
						<th>Account Number</th>
						<td><input type="text" class="text-box" name="account-num-stm" id="account-num-stm" value="<%= map.get("Acc_Num")%>" maxlength="20"></td>
					</tr>
					<tr>
						<th>Period</th>
						<td><input type="text" class="text-box" name="period" id="period" maxlength="20"></td>
					</tr>
				</table>
				<input type="button" value="View Transactions" class="proceed-btn" id="view-tans-btn" onclick="ajaxRequest.showTransactions()">
		</div>
	</div>
	<div class="transaction-show" id="transaction-show">
	</div>
 </body>
</html>