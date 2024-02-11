<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  	<link rel="icon" href="<%= request.getContextPath() %>/images/i_logo.png"></link>
  	<title>Register to the Internet Banking</title>
  	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/ICICI_Bank.css"></link>
  	<script src="<%= request.getContextPath() %>/js/jQuery.js"></script>
  	<script src="<%= request.getContextPath() %>/js/ICICI_Bank.js"></script>
</head>
<body>
	<div class="header-container">
		<!-- header -->
		<header>
			<div id="register-header-container">
				<div id="logoR">
					<img src="<%= request.getContextPath() %>/images/iw_logo.jpeg" alt="image not found!" class="logo-img" id="r-logo">
				</div>

				<!-- nav bar -->
				<nav class="rg-nav">
					<a href="#" class="register-nav">About</a>
					<a href="#" class="register-nav">Document</a>
					<a href="#" class="register-nav">FAQs</a>
					<a href="<%= request.getContextPath() %>/jsp/login.jsp" class="register-nav">Login</a>
					<div class="clr"></div>
				</nav>
			</div>
		</header>
	</div>

	<div class="register-container">
		<div id="register-bg">
			<img src="<%= request.getContextPath() %>/images/r_bg1.jpg" alt="image not found!" id="register-bg1">
			<p id="banner-text">Welcome to <br> <b>ICICI Bank Internet Banking </b><br><br> Open a <b>power-packed <br>Current Account</b> to Efficiently manage all<br> your business needs</p>
			<img src="<%= request.getContextPath() %>/images/r_bg2.jpg" alt="image not found!" id="register-bg2">
			<div id="registration-form">
				<form id="register-form" action="ServletController" method="post">
					<input name="requestType" type="hidden" value="registerRequest">
					<label id="r-label">Start your Journey</label>
					<div class="r-fields">
						<input type="text" class="r-text-box" placeholder="Full Name*" id="full-name" name="full-name" onblur="validateRegistration.fullName();" oninput="validateRegistration.fullNameRegEx();" maxlength="30">
						<div class="error" id="errFullName"></div>
					</div>
					<div class="r-fields">
						<input type="text" class="r-text-box" placeholder="Account Number*" id="acc-number" name="acc-number" onblur="validateRegistration.accNumber();" oninput="validateRegistration.accNumberRegEx();" maxlength="20">
						<div class="error" id="errAccNumber"></div>
					</div>
					<div class="r-fields">
						<input type="text" class="r-text-box" placeholder="Pan Card*" id="pan-card" name="pan-card" onblur="validateRegistration.panCard();" maxlength="10" oninput="validateRegistration.panCardRegEx();">
						<div class="error" id="errPanCard"></div>
					</div>
					<div class="r-fields">
						<input type="text" class="r-text-box" placeholder="EmailId*" id="emailId" name="emailId" onblur="validateRegistration.emailId();" oninput="validateRegistration.emailIdRegEx();" maxlength="20">
						<div class="error" id="errEmailId"></div>
					</div>
					<div class="r-fields">
						<input type="text" class="r-text-box" placeholder="Mobile Number*" id="mobile-number" name="mobile-number" onblur="validateRegistration.mobileNumber();" oninput="validateRegistration.mobileNumberRegEx();" maxlength="10">
						<div class="error" id="errMobNumber"></div>
					</div>
					<div class="r-fields">
						<input type="text" class="r-text-box" placeholder="Address*" id="address" name="address" onblur="validateRegistration.address();" maxlength="150">
						<div class="error" id="errAddress"></div>
					</div>
					<div class="r-fields">
						<input type="password" class="r-text-box" placeholder="Password*" id="password" name="password" onblur="validateRegistration.password();" oninput="validateRegistration.passwordRegEx();">
						<div class="error" id="errPassword" maxlength="20"></div>
					</div>
					<div class="r-fields">
						<input type="password" class="r-text-box" placeholder="Confirm Password*" id="confirm-password" onblur="validateRegistration.confirmPasswordAfter();" oninput="validateRegistration.confirmPasswordRegEx();" maxlength="20">
						<div class="error" id="errConfirmPassword"></div>
					</div>
					<div class="chk-container">
						<div id="chk-r-box"><input type="checkbox" class="chk-box" id="chk-box" onblur="validateRegistration.checkBox();"></div>
						<span id="r-chk-txt">I authorise ICICI Bank and its representatives to contact me through phone, email and SMS. I also agree to ICICI Bank’s <a href="#">Terms & Conditions</a>.</span>
						<div class="error" id="errCheckBox"></div>
					</div>
					<input type="button" value="Register" class="btn" id="r-btn" onclick="validateRegistration.onSubmitValidate();">
					<hr>
					<a href="<%= request.getContextPath() %>/jsp/login.jsp" class="text-end">Login</a>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
