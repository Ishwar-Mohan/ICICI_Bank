package com.icici_bank.helper;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.icici_bank.dao.LoginDao;
import com.icici_bank.dao.RegisterDao;
import com.icici_bank.dao.TransactionDao;
import com.icici_bank.dao.displayDao;
import com.icici_bank.utility.JsonParser;

public class Helper 
{	
	public static void LoginCredentials(HttpServletRequest req, HttpServletResponse res) 
	{
		try
		{
			String loginAs = req.getParameter("whoesLogin");
			String userId = req.getParameter("userId");
			String password = req.getParameter("login-password");
			
			if("admin".equals(loginAs))
			{
				Map<String, String> map = LoginDao.LoginAsAdmin(userId);
				
				if(map != null)
				{
					String DbUname = map.get("admin_userId");
					String DbPassL = map.get("admin_password");
				
					HttpSession session= req.getSession();
				
					if (userId.equals(DbUname) && password.equals(DbPassL)) 
					{
						session.setAttribute("map",map);
						res.sendRedirect("jsp/adminDashboard.jsp");
						System.out.println("Login Sucessful..!!");
					}
					else
					{
						res.sendRedirect("jsp/login.jsp");
					}
				}
			}
			else if("customer".equals(loginAs))
			{
				Map<String, String> map = LoginDao.LoginQuery(userId);
		
				if(map != null)
				{
					String DbUname = map.get("Acc_Num");
					String DbPassL = map.get("Password_");
				
					HttpSession session= req.getSession();
				
					if (userId.equals(DbUname) && password.equals(DbPassL)) 
					{
						session.setAttribute("map",map);
						res.sendRedirect("jsp/customerDashboard.jsp");
						System.out.println("Login Sucessful..!!");
					}
					else
					{
						res.sendRedirect("jsp/login.jsp");
					}
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static boolean registerCredentials(HttpServletRequest req) 
	{
		Map<Integer, String> map = new LinkedHashMap<Integer, String>();
		
		map.put(1, req.getParameter("full-name"));
		map.put(2, req.getParameter("acc-number"));
		map.put(3, req.getParameter("pan-card"));
		map.put(4, req.getParameter("emailId"));
		map.put(5, req.getParameter("mobile-number"));
		map.put(6, req.getParameter("address"));
		map.put(7, req.getParameter("password"));
		
		return RegisterDao.RegisterQuery(map);
	}
	
	public static String sendMoney(HttpServletRequest req, HttpServletResponse res)
	{
		String accNumber = (String) req.getParameter("accNumber");
		String amount = (String) req.getParameter("amount");
		String mob_no = (String) req.getParameter("mob_no");
		String remark = (String) req.getParameter("remark");
		
		Map<Integer, String> map = new LinkedHashMap<Integer, String>();
		
		map.put(1, accNumber);
		map.put(2, amount);
		map.put(3, mob_no);
		map.put(4, remark);
		
		return TransactionDao.sendMoneyTransaction(map);
	}
	
	public static String showBalance(HttpServletRequest req, HttpServletResponse res)
	{
		Map map  = (Map) req.getSession().getAttribute("map");
	  	String flag = req.getParameter("value");
		
	  	if("true".equals(flag))
	  	{
	  		return displayDao.showBalanceReturn((String) map.get("Acc_Num"));
	  	}
	  	
	  	return "*********";
	}
	
	public static String showTransactions(HttpServletRequest req, HttpServletResponse res)
	{
		String accNumber = (String) req.getParameter("accNumber");
		String period = (String) req.getParameter("period");
		Map map = (Map) displayDao.showTransactionsData(accNumber, period);
		return JsonParser.getJsonString(map);
	}
	
	public static void showAllTransactions(HttpServletRequest req, HttpServletResponse res)
	{
		Map map = (Map) displayDao.showAllTransactionsData();
		req.setAttribute("allTranscMap", map);
	}
	
	public static String getAccNumberCheck(HttpServletRequest req, HttpServletResponse res)
	{
		String accNumber = (String) req.getAttribute("accountNumber");
		return RegisterDao.getAccNumber(accNumber);
	}
	
	public static String getEmailCheck(HttpServletRequest req, HttpServletResponse res)
	{
		String emailId = (String) req.getAttribute("email");
		return RegisterDao.getEmail(emailId);
	}
	
	public static String getMobileCheck(HttpServletRequest req, HttpServletResponse res)
	{
		String MobNumber = (String) req.getAttribute("mobNumber");
		return RegisterDao.getMobileNo(MobNumber);
	}
	
	public static void getDebitCardPinG(HttpServletRequest req, HttpServletResponse res)
	{
		String cvv = req.getParameter("cvv-number");
		String pin = req.getParameter("add-pin");
		
		TransactionDao.setDebitCardPin(cvv, pin);
	}
	
	public static void getDebitCardDetails(HttpServletRequest req, HttpServletResponse res){
		String userId = req.getParameter("userIdAcc");
		Map map = (Map) displayDao.showCardDetails(userId);
		req.getSession().setAttribute("CardDetails", map);
	}
}
