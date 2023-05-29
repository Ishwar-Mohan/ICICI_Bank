<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <link rel="icon" href="<%= request.getContextPath() %>/images/i_logo.png"></link>
  <title>Login in to Internet Banking</title>
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/ICICI_Bank.css"></link>
  <script src="<%= request.getContextPath() %>/js/jQuery.js"></script>
  <script src="<%= request.getContextPath() %>/js/ICICI_Bank.js"></script>
</head>
<body>
	<!-- header -->
	<header class="header">
		<div id="upper-header-container">
			<div class="logo">
				<img src="<%= request.getContextPath() %>/images/logo.png" alt="image not found!" class="logo-img">
			</div>

			<!-- upper-nav bar -->
			<nav class="upper-nav">
				<a href="#" class="nav">ICICI Bank Home |</a>
				<a href="#" class="nav">About Us |</a>
				<a href="#" class="nav">Customer Care |</a>
				<a href="#" class="nav">Find ATM/Branch</a>
				<div id="mobile-icon-container">
					<img src="<%= request.getContextPath() %>/images/mobile-icon.png" alt="image not found!" id="mobile-icon"> 
				</div>
				<a href="" class="nav">Mobile Banking</a>
				<div class="clr"></div>
			</nav>
		</div>

		<!-- lower-nav bar -->
		<nav class="lower-nav-container">
			<a href="#" class="lower-nav">PERSONAL</a>
			<a href="#" class="lower-nav">NRI</a>
			<a href="#" class="lower-nav">BUSINESS</a>
			<a href="#" class="lower-nav">CORPORATE</a>
			<a href="#" class="lower-nav">GIFT CITY</a>
			<div class="clr"></div>
		</nav>
	</header>

	<!-- container -->
	<div class="container">
		<div id="login-bg-container">
			<img src="<%= request.getContextPath() %>/images/login_bg.jpg" alt="image not found!" id="login-bg">
			<div id="login-container">
				<form id="login-form" action="../ServletController" method="post">
					<input name="requestType" type="hidden" value="loginRequest">
					<div>
						<div id="lock-container">
							<img src="<%= request.getContextPath() %>/images/lock.png" alt="image not found!" id="lock">
						</div>
						<label class="label-heading">Login to Internet Banking</label>
					</div>	
					<label class="label">Login As</label><br>
					<select class="text-box" id="whoesLogin" name="whoesLogin">
						<option value="customer">Customer</option>
						<option value="admin">Admin</option>
					</select>	
					<label class="label">User ID</label><br>
					<input type="text" placeholder="" class="text-box" id="userId" name="userId" onblur="validateLogin.userIdCheck();" maxlength="20"><br>
					<div class="lower-text-container">
						<p class="lower-text" id="errUserIdLogin"></p>
					</div>
					<label class="label">Password</label><br>
					<input type="password" placeholder="" class="text-box" id="login-password" name="login-password" onblur="validateLogin.passwordCheck();" maxlength="20"><br>
					<div class="lower-text-container">
						<p class="lower-text" id="errPassLogin"></p>
					</div>
					<input type="button" value="Login" class="btn" onclick="validateLogin.loginCredential();">
					<div class="chk-container">
						<input type="checkbox" class="chk-box">
						<span id="chk-txt">Remember Me</span>
					</div>
					<hr>
					<a href="<%= request.getContextPath() %>/jsp/register.jsp" class="text-end">Register</a>
				</form>
			</div>
		</div>
	</div>
</body>
</html>