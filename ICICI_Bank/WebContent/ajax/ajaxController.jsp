<%@page import="java.util.Map"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="com.icici_bank.helper.Helper"%>

<%!
	private String execute(HttpServletRequest req,HttpServletResponse res)
	{
	  String requestIdentifier = req.getParameter("requestIdentifier");
	  
	  if("sendMoneyRequest".equals(requestIdentifier))
	  {		
		return Helper.sendMoney(req, res);
	  }
	  else if("showBalanceRequest".equals(requestIdentifier))
	  {
		  return Helper.showBalance(req, res);
	  }
	  else if("mobileNoCheckRequest".equals(requestIdentifier))
	  {
	  	  return Helper.getMobileCheck(req, res);
	  }
	  else if("emailIdCheckRequest".equals(requestIdentifier))
	  {
		  return Helper.getEmailCheck(req, res);
	  }
	  else if("accNumberCheckRequest".equals(requestIdentifier))
	  {
		  return Helper.getAccNumberCheck(req, res);
	  }
	  else if("showTransactionsRequest".equals(requestIdentifier))
	  {
		  return Helper.showTransactions(req, res); 
	  }
	  
	  return "";
	}
%>
<%= execute(request,response) %>
	
