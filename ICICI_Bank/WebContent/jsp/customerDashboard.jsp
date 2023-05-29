<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <link rel="icon" href="<%= request.getContextPath() %>/images/i_logo.png"></link>
  <title>My View</title>
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/ICICI_Bank.css"></link>
  <script src="<%= request.getContextPath() %>/js/jQuery.js"></script>
  <script src="<%= request.getContextPath() %>/js/ICICI_Bank.js"></script>
</head>
<body>
	<% 
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		
		Map map = (Map) session.getAttribute("map");
		
		if(session.getAttribute("map") == null)
			response.sendRedirect("login.jsp");
	%>
	<!-- header -->
	<jsp:include page="header.jsp"></jsp:include>
	
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
				<h5>Your Financial Journey</h5>
				<p>Here are your next steps avail benefits up to and more here.</p>
				<a href="#" id="explore">Explore now ></a>
				<div class="clr"></div>
			</div>

		</div>
		<div id="middle-container" class="customer-containers">
			<div class="account">
				<div>
					<h3 id="accHeading">Accounts</h3>
					<div class="toggle-btn-container">
						<p>Show Balance</p>
						<input type="checkbox" class="toogle-chk-btn" id="toogle-chk-btn" onchange="ajaxRequest.showBalance()" value="true">
					</div>
				</div>
				<div>
					<div class="balance">
						<h4>Total Balance</h4>
						<p class="bal-show">*********</p>
						<div id="circle">
							<div>
								<p class="text-in">100%</p>
							</div>
						</div>
						<div>
							<h6 class="orange-color">Savings</h6>
							<p class="orange-color" id="show-saving">*********</p>
							<br>
							<h6 class="blue-color">Deposits</h6>
							<p class="blue-color" id="show-deposite">*********</p>
						</div>
						<div class="clr"></div>
					</div>

					<div class="balance" id="saving">
						<h4>Savings</h4>
						<p class="bal-show">*********</p>
						
						<p>**1019</p>
						<a href="e-Statement.jsp" id="view-stm">View Statements ></a>
						<div id="upgrader-sv">Upgrade your Savings Account</div>
					</div>
					<div class="clr"></div>
				</div>
					
				<div class="account-lower-container">
					<div class="mrsod">
						<a href="" id="manage-limit">Manage Limits</a>
					</div>
					<div class="mrsod">
						<a href="">Recharge now</a>
					</div>
					<div class="mrsod">
						<a href="<%= request.getContextPath() %>/jsp/sendMoney.jsp">Send Money</a>
					</div>
					<div class="mrsod">
						<a href="">Open iWish</a>
					</div>
					<div class="mrsod">
						<form id="register-form" action="../ServletController" method="post">
							<input name="requestType" type="hidden" value="cardDetailsShowRequest">
							<input name="userIdAcc" type="hidden" value="<%= map.get("Acc_Num") %>">
							<input type="submit" value="Debit/ATM card" id="dcard-btn">
						</form>
					</div>
				</div>
			</div>

			<div class="bill-recent-transc"> 
			</div>

			<div class="account">
				<div>
					<h3>Credit card</h3>
				</div>
				<div class="credit-card-container">
					<div class="credit-card">
						<img src="<%= request.getContextPath() %>/images/CreditCard.png" alt="image not found!" id="credit-card-img">
					</div>
					<div class="card-info">
						<h4>MasterCardPlatinumchipCreditCard</h4>
						<p>5241 9367 4546 2005</p>
						<a href="#" id="card">Modify limit ></a>
					</div>
					<div class="card-info">
						<div class="c-details">
							<h5>Available limit</h5>
							<p>Rs. *******</p>
							<a href="" class="ancher-btn">Pay bills</a>
						</div>
						<div class="c-details">
							<h5>Outstanding</h5>
							<p>Rs. *******</p>
							<a href="" class="ancher-btn">Details</a>
						</div>
						<div class="c-details">
							<h5>Previous bal</h5>
							<p>Rs. *******</p>
							<a href="" class="ancher-btn">Statement</a>
						</div>
						<div class="clr"></div>
					</div>
					<div class="clr"></div>
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