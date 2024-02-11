<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  	<link rel="icon" href="<%= request.getContextPath() %>/images/i_logo.png"></link>
  	<title>Admin View</title>
  	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/ICICI_Bank.css"></link>
  	<script src="<%= request.getContextPath() %>/js/jQuery.js"></script>
  	<script src="<%= request.getContextPath() %>/js/ICICI_Bank.js"></script>
</head>
 <body>
	<!-- Admin header -->
	<header>
		<div id="myView-container">
			<div class="logo">
				<img src="<%= request.getContextPath() %>/images/logo.png" alt="image not found!" class="logo-img">
			</div>

			<!-- upper-nav bar -->
			<nav class="upper-nav">
				<a href="#" class="c-nav">Hi Admin</a>
				<div class="cust-care">
					<div id="phone-icon-container">
						<img src="<%= request.getContextPath() %>/images/phone_icon.png" alt="image not found!" id="phone-icon">
					</div>
					<p class="c-label">Customer Care</p><br>
					<a href="#" id="number">1800 1080</a>
				</div>
				<a href="#" class="c-nav"><img src="<%= request.getContextPath() %>/images/Icon_Bell.png" alt="image not found!" id="bell-icon"></a>
				<a href="<%= request.getContextPath() %>/jsp/register.jsp" class="c-nav" id="logout">Log Out</a>
				<div class="clr"></div>
			</nav>
		</div>

		<!-- lower-nav bar -->
		<div class="c-lower-navbar">
			<nav class="c-lower-nav-container">
				<a href="#" class="c-lower-nav">OVERVIEW</a>
				<a href="#" class="c-lower-nav">CARDS & LOANS</a>
				<a href="#" class="c-lower-nav">PAYEES REQUESTS</a>
				<a href="#" class="c-lower-nav">BANK ACCOUNT</a>
				<a href="#" class="c-lower-nav">TRANSACTIONS</a>
				<a href="#" class="c-lower-nav">INVESTMENTS & INSURENCE</a>
				<div class="clr"></div>
			</nav>
		</div>
	</header>
	<div class="main-container">
		<div class="customer-container">

			<div id="left-container" class="customer-containers">
				<div class="assist">
					<h5>For any Assistance</h5>
					<p>Please call our customer care number</p>
					<div id="phone-icon-container">
						<img src="<%= request.getContextPath() %>/images/phone_icon.png" alt="image not found!" id="phone-icon-assit">
					</div>
					<a href="#" id="numberAssit">1800 1080</a>
					<div class="clr"></div>
				</div>
	
				<div class="assist" id="explore-container">
					<h5>Financial Journey</h5>
					<p>Here are your next steps avail benefits up to and more here.</p>
					<a href="#" id="explore">Explore now ></a>
					<div class="clr"></div>
				</div>
	
			</div>

			<div id="middle-container" class="customer-containers">
				<div class="account">
					<div class="cibil">
						<form id="cust-all-form" action="../ServletController" method="post">
							<input name="requestType" type="hidden" value="showAllTranscationsRequest">
							<input type="submit" value="Total Transactions" class="admin-btn" id="showAllTranscations" name="showAllTranscations">
						</form>
					</div>
					<div class="cibil">
						<form id="cust-all-form" action="../ServletController" method="post">
							<input name="requestType" type="hidden" value="showAllCustomerRequest">
							<input type="submit" value="Total Customers" class="admin-btn" id="showAllCustomer" name="showAllCustomer">
						</form>
					</div>
				</div>
			</div>

			<div id="right-container" class="customer-containers">
				<div class="cibil">
					<h5>Check your CIBIL score</h5>
					<a href="#" class="ancher-btn">Get Report</a>
				</div>
			</div>

			<div class="clr"></div>
		</div>
	</div>
</body>
</html>
