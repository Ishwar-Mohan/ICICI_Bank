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
	<%! Map map; %> 	
 	<%
 		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
 
		if(session.getAttribute("map") == null)
			response.sendRedirect("login.jsp");
		
		map = (Map) request.getAttribute("allTranscMap");
		
	%>
	<header>
		<div id="myView-container">
			<div class="logo">
				<img src="<%= request.getContextPath() %>/images/logo.png" alt="image not found!" class="logo-img">
			</div>

			<!-- upper-nav bar -->
			<nav class="upper-nav">
				<a href="#" class="c-nav">Hii Admin</a>
				<div class="cust-care">
					<div id="phone-icon-container">
						<a href="<%= request.getContextPath() %>/jsp/customerDashboard.jsp">
							<img src="<%= request.getContextPath() %>/images/phone_icon.png" alt="image not found!" id="phone-icon">
						</a>
					</div>
					<p class="c-label">Customer Care</p><br>
					<a href="#" id="number">1800 1080</a>
				</div>
				<a href="#" class="c-nav"><img src="<%= request.getContextPath() %>/images/Icon_Bell.png" alt="image not found!" id="bell-icon"></a>
				<a href="<%= request.getContextPath() %>/jsp/logout.jsp" class="c-nav" id="logout">Log Out</a>
				<div class="clr"></div>
			</nav>
		</div>

		<!-- lower-nav bar -->
		<div class="c-lower-navbar">
			<nav class="c-lower-nav-container">
				<div class="overview-dropdown">
				<a href="#" class="c-lower-nav" id="overview-menu">OVERVIEW</a>
				<div class="dropdown">
					<a href="<%= request.getContextPath() %>/jsp/adminDashboard.jsp">
					<div class="overview">
						<div class="my-icon-container">
							<img src="<%= request.getContextPath() %>/images/myView.png" alt="image not found!" class="my-view-icon">
						</div>
						<p>My View</p>
						<div class="clr"></div>
					</div>
					</a>
					<div class="overview">
						<div class="my-icon-container">
							<img src="<%= request.getContextPath() %>/images/accountSummery.png" alt="image not found!" class="my-view-icon">
						</div>
						<p>Account Summery</p>
						<div class="clr"></div>
					</div>
					<a href="<%= request.getContextPath() %>/jsp/personalDetails.jsp">
					<div class="overview">
						<div class="my-icon-container">
							<img src="<%= request.getContextPath() %>/images/personalDetails.png" alt="image not found!" class="my-view-icon">
						</div>
						<p>Personal Details</p>
						<div class="clr"></div>
					</div>
					</a>
					<div class="overview">
						<div class="my-icon-container">
							<img src="<%= request.getContextPath() %>/images/fj.png" alt="image not found!" class="my-view-icon">
						</div>
						<p>Financial Journey</p>
						<div class="clr"></div>
					</div>
				</div>
				</div>
				<a href="#" class="c-lower-nav">BANK ACCOUNT</a>
				<a href="#" class="c-lower-nav">PAYMENT & TRANSFER</a>
				<a href="#" class="c-lower-nav">CARDS & LOANS</a>
				<a href="#" class="c-lower-nav">INVESTMENTS & INSURENCE</a>
				<a href="#" class="c-lower-nav">CUSTOMER SERVICE</a>
				<div class="clr"></div>
			</nav>
		</div>
	</header>
	
	<div class="transaction-show" id="transaction-show">

			<table class="t-table">
				
				<tr class="t-row">
					<th class="t-th">Sr. No.</th>
					<th class="t-th">From Account</th>
					<th class="t-th">To Account</th>
					<th class="t-th">Transaction Date</th>
					<th class="t-th">Remark</th>
					<th class="t-th">Amount Withdraw</th>
					<th class="t-th">Deposit Amount</th>
				</tr >
				<% 
					int t = 1;
					for(int i= map.size(); i>= 1 ; i--){ 
						Map innerMap = (Map) map.get(Integer.toString(i));
				%>
				<tr class="t-col">
					<td class="t-col"><%= t++ %></td>
					<td class="t-col"><%= innerMap.get("FromAcc") %></td>
					<td class="t-col"><%= innerMap.get("ToAcc") %></td>
					<td class="t-col"><%= innerMap.get("Transcation_Date") %></td>
					<td class="t-col"><%= innerMap.get("Remarks") %></td>
					<td class="t-col"><%= innerMap.get("Amount_Withdraw") %></td>
					<td class="t-col"><%= innerMap.get("Deposite_Amount") %></td>
				</tr>
				<%
					} 
				%>
			</table> 
	</div>
 </body>
</html>