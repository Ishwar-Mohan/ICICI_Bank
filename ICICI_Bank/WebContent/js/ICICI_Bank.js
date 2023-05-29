// Registration
var validateRegistration = new validateRegistration();

function validateRegistration()
{
	this.fullName = fullName;
	this.accNumber = accNumber;
	//this.ajaxAccountNumCheck = ajaxAccountNumCheck;
	this.panCard = panCard;
	this.emailId = emailId;
	//this.ajaxCheckEmail = ajaxCheckEmail;
	this.mobileNumber = mobileNumber;
	//this.ajaxCheckMobile = ajaxCheckMobile;
	this.password = password;
	this.address = address;
	this.confirmPasswordAfter = confirmPasswordAfter;
	this.checkBox = checkBox;
	this.onReset = onReset;
	this.onSubmitValidate = onSubmitValidate;

	this.fullNameRegEx = fullNameRegEx;
	this.accNumberRegEx = accNumberRegEx;
	this.panCardRegEx = panCardRegEx;
	this.emailIdRegEx = emailIdRegEx;
	this.mobileNumberRegEx = mobileNumberRegEx;
	this.passwordRegEx = passwordRegEx;
	this.confirmPasswordRegEx = confirmPasswordRegEx;

	var fullNameBool = false;
	var accNumberBool = false;
	var panCardBool = false;
	var emailIdBool = false;
	var mobileNumberBool = false;
	var passwordBool = false;
	var confirmPasswordBool = false;
	var checkBoxBool = false;
	var addressBool = false;

	function fullName()
	{
		var fullName = $('#full-name');

		if(fullName.val() == "")
		{
			$('#errFullName').text("Please enter the full name.");
		}
	};

	function fullNameRegEx()
	{
		var fullName = $('#full-name');
		var regExN = /^[a-zA-Z\s]+[^\d]$/gm;
		var regExD = /[0-9!$%^&*\()_+|@#~=`{$}\-[\]:\";\'<>?,.\/\\[\]]/gm;
		
		fullName.val(fullName.val().replace(regExD,""));

		if(fullName.val() == "")
		{
			$('#errFullName').text("Please enter the full name.");
			fullNameBool = false;
		}
		else if(regExN.test(fullName.val()))
		{
			$('#errFullName').text("");
			fullNameBool = true;
		}
		else
		{
			$('#errFullName').text("Please Enter proper full name");
			fullNameBool = false;
		}
	};

	function accNumber()
	{
		var accNumber = $('#acc-number');

		if(accNumber.val() == "")
		{
			$('#errAccNumber').text("Please enter your Account Number.");
		}
	};

	function accNumberRegEx()
	{
		var accNumber = $('#acc-number');
		var regExM = /[a-zA-Z!$%^&*\()_+|@#~=`{}\-[\]:\";\'<>?,.\/\\[\s\]]/;

		accNumber.val(accNumber.val().replace(regExM, ""));

		if(accNumber.val() == "")
		{
			$('#errAccNumber').text("Please enter your Account Number.");
			accNumberBool = false;
		}
		else
		{
			$('#errAccNumber').text("");
			accNumberBool = true;
		}
	};
	
	/*function ajaxAccountNumCheck() 
	{
		if ($('#acc-number').val().length == 10) 
		{
			$.post(
				"/ajax/ajaxController.jsp",
				{
					accountNumber : $('#acc-number').val(),
					requestIdentifier : "accNumberCheckRequest",
				},
				function(msg) 
				{
					if("Alredy Present" == msg)
					{
						$('#errAccNumber').text(msg);
						accNumberBool = false;
					}
					else
					{
						$('#errAccNumber').text("");
						accNumberBool = true;
					}
				});
		}
	};*/

	function panCard()
	{
		var panCard = $('#pan-card');

		if(panCard.val() == "")
		{
			$('#errPanCard').text("Please enter your Pan Card Number.");
		}
	};
	
	function panCardRegEx()
	{
		var panCard = $('#pan-card');
		var regExMob = /^[a-zA-Z0-9]{10}$/g;
		var regExM = /[!$%^&*\()_+|@#~=`{}\-[\]:\";\'<>?,.\/\\[\s\]]/;

		panCard.val(panCard.val().replace(regExM, ""));

		if(panCard.val() == "")
		{
			$('#errPanCard').text("Please enter your Pan Card Number.");
			panCardBool = false;
		}
		else
		{
			$('#errPanCard').text("");
			panCardBool = true;
		}
	};

	function emailId()
	{
		var emailId = $('#emailId');

		if(emailId.val() == "")
		{
			$('#errEmailId').text("Please enter your EmailId");
		}
	};
	
	function emailIdRegEx()
	{
		var emailId = $('#emailId');
		var regExEmail = /^[a-z].+[\d]*@[a-z]+\.[a-z.]{2,6}$/g;
		var regExE = /[!%^()+|#~=`{}\[\]:\";\'<>?,\/\\[\s\]]/g;

		emailId.val(emailId.val().replace(regExE, ""));

		if(emailId.val() == "")
		{
			$('#errEmailId').text("Please enter your EmailId");
			emailIdBool = false;
		}
		else if(regExEmail.test(emailId.val()))
		{
			$('#errEmailId').text("");
			emailIdBool = true;
		}
		else
		{
			$('#errEmailId').text("Please Enter proper EmailId");
			emailIdBool = false;
		}
	};

	/*function ajaxCheckEmail() 
	{
		var regExEmail = /^[a-z].+[\d]*@[a-z]+\.[a-z.]{2,6}$/g;
		if (regExEmail.test($('#emailId').val())) 
		{
			$.post(
				"../ajax/ajaxController.jsp",
				{
					email : $('#emailId').val(),
					requestIdentifier : "emailIdCheckRequest",
				},
				function(msg) 
				{
					if("Alredy Present" == msg)
					{
						$('#errEmailId').text(msg);
						emailIdBool = false;
					}
					else
					{
						$('#errEmailId').text("");
						emailIdBool = true;
					}
				});
		}
	};*/

	function mobileNumber()
	{
		var mobileNumber = $('#mobile-number');

		if(mobileNumber.val() == "")
		{
			$('#errMobNumber').text("Please Enter Mobile no.");
		}
	};
	
	function mobileNumberRegEx()
	{
		var mobileNumber = $('#mobile-number');
		var regExMob = /^[7-9]{1}[\d]{9}$/g;
		var regExM = /[a-zA-Z!$%^&*\()_+|@#~=`{}\-[\]:\";\'<>?,.\/\\[\s\]]/;

		mobileNumber.val(mobileNumber.val().replace(regExM, ""));

		if(mobileNumber.val() == "")
		{
			$('#errMobNumber').text("Please Enter Mobile no.");
			mobileNumberBool = false;
		}
		else if(regExMob.test(mobileNumber.val()))
		{
			$('#errMobNumber').text("");
			mobileNumberBool = true;
		}
		else
		{
			$('#errMobNumber').text("Please Enter proper Mobile no.");
			mobileNumberBool = false;
		}
	};
	
/*	function ajaxCheckMobile() 
	{
		if ($('#mobile-number').val().length == 10) 
		{
			$.post(
				"../ajax/ajaxController.jsp",
				{
					mobNumber : $('#mobile-number').val(),
					requestIdentifier : "mobileNoCheckRequest",
				},
				function(msg) {
					if("Alredy Present" == msg){
						$('#errMobNumber').text(msg);
						mobileNumberBool = false;
					}else{
						$('#errMobNumber').text("");
						mobileNumberBool = true;
					}
				});
		}
	};*/

	function address()
	{
		var address = $('#address');

		if(address.val() == ""){
			$('#errAddress').text("Please enter address.");
			addressBool = false;
		}
		else
		{
			$('#errAddress').text("");
			addressBool = true;
		}
	};

	function password()
	{
		var password = $('#password');

		if(password.val() == ""){
			$('#errPassword').text("Please..Enter Password");
		}
	};

	function passwordRegEx()
	{
		var password = $('#password');
		var regExPass = /(^(?=.*[0-9])(?=.*[A-Z])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%&*]{6,12})$/g;

		if(password.val() == ""){
			$('#errPassword').text("Please..Enter Password");
			passwordBool = false;
		}
		else if(regExPass.test(password.val()))
		{
			$('#errPassword').text("");
			passwordBool = true;
		}
		else
		{
			$('#errPassword').text("Please..Enter proper Password");
			passwordBool = false;
		}
	};
		
	function confirmPasswordRegEx()
	{
		var confirmPassword = $('#confirm-password');
		var password = $('#password');
		var regExRpass = /(^(?=.*[0-9])(?=.*[A-Z])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%&*]{6,15})$/g;

		if(confirmPassword.val() == "")
		{
			$('#errConfirmPassword').text("Please..Enter confirm password");
			confirmPasswordBool = false;
		}
		else if(password.val() == "")
		{
			$('#errConfirmPassword').text("Please..Enter password Firstly");
			confirmPasswordBool = false;
		}
		else if(confirmPassword.val() == password.val())
		{
			$('#errConfirmPassword').text("");
			confirmPasswordBool = true;
		}
		else if(confirmPassword.val() != password.val())
		{
			$('#errConfirmPassword').text("");
			confirmPasswordBool = false;
		}
		else if(regExRpass.test(confirmPassword.val()))
		{
			$('#errConfirmPassword').text("");
			confirmPasswordBool = false;
		}
		else
		{
			$('#errConfirmPassword').text("");
			confirmPasswordBool = false;
		}
	};

	function confirmPasswordAfter()
	{
		var confirmPassword = $('#confirm-password');
		var password = $('#password');

		if(confirmPassword.val() == "")
		{
			$('#errConfirmPassword').text("Please..Enter confirm password");
			confirmPasswordBool = false;
		}
		else if(confirmPassword.val() != password.val())
		{
			$('#errConfirmPassword').text("Password Missmatched");
			confirmPasswordBool = false;
		}
	};

	function checkBox()
	{
		var checkBox = $('#chk-box');
		
		if(checkBox.checked == false)
		{
			$('#errCheckBox').text("Please accept the terms and conditions.");
			checkBoxBool = false;
		}
		else
		{
			$('#errCheckBox').text("");
			checkBoxBool = true;
		}
	};

	function onReset()
	{
		$('#full-name');
		$('#acc-number');
		$('#pan-card');
		$('#emailId');
		$('#mobile-number');
		$('#address');
		$('#password');
		$('#confirm-password');
		$('#chk-box');
		
		$('#errFullName').text("");
		$('#errAccNumber').text("");
		$('#errPanCard').text("");
		$('#errEmailId').text("");
		$('#errMobNumber').text("");
		$('#errAddress').text("");
		$('#errPassword').text("");
		$('#errConfirmPassword').text("");
		$('#errCheckBox').text("");
	};


	function onSubmitValidate()
	{
		if(fullNameBool == false)
			this.fullNameRegEx();
		else if(accNumberBool == false)
		{
			/*this.ajaxAccountNumCheck();*/
			this.accNumberRegEx();
		}
		else if(panCardBool == false)
			this.panCardRegEx();
		else if(emailIdBool == false)
		{
			/*this.ajaxCheckEmail();*/
			this.emailIdRegEx();
		}
		else if(mobileNumberBool == false)
		{
			this.mobileNumberRegEx();
			/*this.ajaxCheckMobile();*/
		}	
		else if(addressBool == false)
			this.address();
		else if(passwordBool == false)
			this.passwordRegEx();
		else if(confirmPasswordBool == false)
		{
			this.confirmPasswordRegEx();
			this.confirmPasswordAfter();
		}
		else if(checkBoxBool == false)
			this.checkBox();
		else if(fullNameBool && accNumberBool && panCardBool && emailIdBool && mobileNumberBool && addressBool && passwordBool && confirmPasswordBool && checkBoxBool == true)
		{
			$('#register-form').submit();
			this.onReset();
		}
	};
}


//Login
var validateLogin = new validateLogin();

function validateLogin() 
{
	this.userIdCheck = userIdCheck;
	this.passwordCheck = passwordCheck;
	this.onReset = onReset;
	this.loginCredential = loginCredential;

	var userIdBool = false;
	var passlogBool = false;

	function loginCredential() 
	{
		if (userIdBool == false)
			this.userIdCheck();
		else if (passlogBool == false)
			this.passwordCheck();
		else if (userIdBool == true && passlogBool == true) 
		{
			$('#login-form').submit();
			this.onReset();
		}
	};

	function userIdCheck()
	{
		var userId = $('#userId');
		var regExM = /[a-zA-Z!$%^&*\()_+|@#~=`{}\-[\]:\";\'<>?,.\/\\[\s\]]/;

		if(userId.val() == "")
		{
			$('#errUserIdLogin').text("Please enter userId");
			userIdBool = false;
		}
		else
		{
			$('#errUserIdLogin').text("");
			userIdBool = true;
		}
	};

	function passwordCheck() 
	{
		var password = $('#login-password');

		if (password.val() == "") 
		{
			$('#errPassLogin').text("Please enter Password");
			passlogBool = false;
		} 
		else
		{
			$('#errPassLogin').text("");
			passlogBool = true;
		}
	};

	function onReset() 
	{
		$('#userId').val("");
		$('#login-password').val("");
		
		$('#errPassLogin').text("");
		$('errUserIdLogin').text("");
	};
}

//Ajax Requests
var ajaxRequest = new ajaxRequest();

function ajaxRequest()
{
	this.sendMoney = sendMoney;
	this.showBalance = showBalance;
	this.showTransactions = showTransactions;
	
	function sendMoney()
	{
		validateMobilePay.MobilePayCheck();
		
		$.post(
				"../ajax/ajaxController.jsp",
				{
					accNumber : $('#from-account').val(),
					mob_no : $('#payee-mob-number').val(),
					amount : $('#pay-byMob-amount').val(),
					remark : $('#mob-pay-remark').val(),
					requestIdentifier : "sendMoneyRequest",
				},
				function(msg) 
				{
					alert(msg);
					$('#from-account').val("");
					$('#payee-mob-number').val("");
					$('#pay-byMob-amount').val("");
					$('#mob-pay-remark').val("");
					location.reload();
				});
	};
	
	function showBalance()
	{
		var cktbtn = $('#toogle-chk-btn').val();
		
		if(cktbtn == "true")
			$('#toogle-chk-btn').val("false");
		else
			$('#toogle-chk-btn').val("true");
		
		$.post(
				"../ajax/ajaxController.jsp",
				{
					value : cktbtn,
					requestIdentifier : "showBalanceRequest",
				},
				function(msg) 
				{
					if("*********" == msg || null == msg)
					{
						$('.bal-show').text("*********");
						$('#show-saving').text("*********");
						$('#show-deposite').text("*********");
					}
					else
					{
						$('.bal-show').text("Rs. "+msg+".00");
						$('#show-saving').text("Rs. "+msg+".00");
						$('#show-deposite').text("Rs.0.00");
					}
				});
	};
	
	function showTransactions()
	{
		$.post(
				"../ajax/ajaxController.jsp",
				{
					accNumber : $('#account-num-stm').val(),
					peroid : $('#period').val(),
					requestIdentifier : "showTransactionsRequest",
				},
				function(msg) 
				{
					var data = JSON.parse(msg);
					//console.log(data);
					//$('#printStmFromAcc').text(inner.FromAcc);
						
					var str = '<table class="t-table"><tr class="t-row"><th class="t-th">Sr. No.</th><th class="t-th">From Account</th><th class="t-th">To Account</th><th class="t-th">Transaction Date</th><th class="t-th">Remark</th><th class="t-th">Amount Withdraw</th><th class="t-th">Deposit Amount</th></tr >';
								
					for (var itr in data) 
					{
						var inner = data[itr];
						//console.log("Acc Num : "+inner.FromAcc);
						str += '<tr class="t-col"><td class="t-col">'+itr+'</td><td class="t-col">'+inner.FromAcc+'</td><td class="t-col">'+inner.ToAcc+'</td><td class="t-col">'+inner.Transcation_Date+'</td><td class="t-col">'+inner.Remarks+'</td><td class="t-col">'+inner.Amount_Withdraw+'</td><td class="t-col">'+inner.Deposite_Amount+'</td></tr>';
					}	
					str += '</table>';	
						
					$('#transaction-show').html(str);
					//window.location.href = "/jsp/stm.jsp";
					window.location.reload;
				}
			);
	};
}

//Transactions By Mobile Number
var validateMobilePay = new validateMobilePay();

function validateMobilePay() 
{
	this.payeeMobNum = payeeMobNum;
	this.accuntNumCheck = accuntNumCheck;
	this.payAmount = payAmount;
	this.amountCheck = amountCheck;
	this.MobilePayCheck = MobilePayCheck;
	
	var payeeMobNumBool = false;
	var payAmountBool = false;

	function MobilePayCheck() 
	{
		if (payeeMobNumBool == false)
			this.accuntNumCheck();
		else if (payAmountBool == false)
			this.amountCheck();
		else if (payeeMobNumBool == true && payAmountBool == true) 
		{
			$('#proceed-btn').removeAttr("disabled");
		}
	};
	
	function payeeMobNum()
	{
		var payeeMobNum = $('#payee-mob-number');

		if(payeeMobNum.val() == "")
		{
			$('#errPayMob').text("Please Enter Mobile no.");
		}
	};

	function accuntNumCheck()
	{
		var payeeMobNum = $('#payee-mob-number');
		var regExMob = /^[7-9]{1}[\d]{9}$/g;
		var regExM = /[a-zA-Z!$%^&*\()_+|@#~=`{}\-[\]:\";\'<>?,.\/\\[\s\]]/;

		payeeMobNum.val(payeeMobNum.val().replace(regExM, ""));

		if(payeeMobNum.val() == "")
		{
			$('#errPayMob').text("Please Enter Mobile no.");
			payeeMobNumBool = false;
		}
		else if(regExMob.test(payeeMobNum.val()))
		{
			$('#errPayMob').text("");
			payeeMobNumBool = true;
		}
		else
		{
			$('#errPayMob').text("Please Enter proper Mobile no.");
			payeeMobNumBool = false;
		}
	};

	function payAmount() 
	{
		var payAmount = $('#pay-byMob-amount');

		if (payAmount.val() == "") 
		{
			$('#errPayAmount').text("Please enter amount");
		} 
		else
		{
			$('#errPayAmount').text("");
		}
	};
	
	function amountCheck()
	{
		var amount = $('#pay-byMob-amount');
		var regExM = /[a-zA-Z!$%^&*\()_+|@#~=`{}\-[\]:\";\'<>?,.\/\\[\s\]]/;

		amount.val(amount.val().replace(regExM, ""));

		if(amount.val() == "")
		{
			$('#errPayAmount').text("Please Enter amount.");
			payAmountBool = false;
		}
		else
		{
			$('#errPayAmount').text("");
			payAmountBool = true;
		}
	};
}