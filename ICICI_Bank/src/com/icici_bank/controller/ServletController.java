package com.icici_bank.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.icici_bank.helper.Helper;

public class ServletController extends HttpServlet 
{
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		String reqestType = req.getParameter("requestType");
				
		if("loginRequest".equals(reqestType))
		{
			Helper.LoginCredentials(req, res);
		}
		else if("registerRequest".equals(reqestType))
		{		
			boolean flag = Helper.registerCredentials(req);
			if(flag == true)
				res.sendRedirect(req.getContextPath()+"/jsp/login.jsp");
		}
		else if("changePinRequest".equals(reqestType))
		{
			Helper.getDebitCardPinG(req, res);
			res.sendRedirect("jsp/card.jsp");
		}
		else if("cardDetailsShowRequest".equals(reqestType))
		{
			Helper.getDebitCardDetails(req, res);
			res.sendRedirect("jsp/card.jsp");
		}
		else if("showAllCustomerRequest".equals(reqestType))
		{
			
		}
		else if("showAllTranscationsRequest".equals(reqestType))
		{
			Helper.showAllTransactions(req, res);
			RequestDispatcher rd = req.getRequestDispatcher("/jsp/stm.jsp");
			rd.forward(req, res);
		}
	}
}
