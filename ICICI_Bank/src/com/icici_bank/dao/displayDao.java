package com.icici_bank.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;

import com.icici_bank.utility.DbConnection;

public class displayDao 
{
	public static String showBalanceReturn(String accNum){
		
		Connection con = DbConnection.ConnectionOpen();
		
		try 
		{
			if (con != null) 
			{
				PreparedStatement stm = con.prepareStatement("Select balance from ICICI_Customer_Registration where Acc_Num = ?");
				stm.setString(1, accNum);
				ResultSet rs = stm.executeQuery();
				rs.next();
				
				return rs.getString("balance");
			}
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		finally
		{
			DbConnection.ConnectionClose();
			System.out.println("Connection Close..!!");
		}
		return "";
	}
	
	public static Map showTransactionsData(String accNum, String period){
		
		Connection con = DbConnection.ConnectionOpen();
		Map map = new LinkedHashMap();
		
		try 
		{
			if (con != null) 
			{
				PreparedStatement stm = con.prepareStatement("Select * from ICICI_Transactions where FromAcc = ? or ToAcc = ? order by Transcation_Date desc");
				stm.setString(1, accNum);
				stm.setString(2, accNum);
				ResultSet rs = stm.executeQuery();
				int i=1;
				while(rs.next())
				{
					Map<String, String> innerMap = new LinkedHashMap<String, String>();
					
					innerMap.put("FromAcc", (String) rs.getString("FromAcc"));
					innerMap.put("ToAcc", (String) rs.getString("ToAcc"));
					innerMap.put("Transcation_Date", (String) rs.getString("Transcation_Date"));
					innerMap.put("Remarks", (String) rs.getString("Remarks"));
					innerMap.put("Amount_Withdraw", (String) rs.getString("Amount_Withdraw"));
					innerMap.put("Deposite_Amount", (String) rs.getString("Deposite_Amount"));
					
					map.put(Integer.toString(i++), innerMap);
				}
				return map;
			}
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		finally
		{
			DbConnection.ConnectionClose();
			System.out.println("Connection Close..!!");
		}
		return map;
	}
	
public static Map showAllTransactionsData(){
		
		Connection con = DbConnection.ConnectionOpen();
		Map map = new LinkedHashMap();
		
		try 
		{
			if (con != null) 
			{
				PreparedStatement stm = con.prepareStatement("Select * from ICICI_Transactions");
				ResultSet rs = stm.executeQuery();
				int i=1;
				
				while(rs.next())
				{
					Map<String, String> innerMap = new LinkedHashMap<String, String>();
					
					innerMap.put("FromAcc", (String) rs.getString("FromAcc"));
					innerMap.put("ToAcc", (String) rs.getString("ToAcc"));
					innerMap.put("Transcation_Date", (String) rs.getString("Transcation_Date"));
					innerMap.put("Remarks", (String) rs.getString("Remarks"));
					innerMap.put("Amount_Withdraw", (String) rs.getString("Amount_Withdraw"));
					innerMap.put("Deposite_Amount", (String) rs.getString("Deposite_Amount"));
					
					map.put(Integer.toString(i++), innerMap);
				}
				return map;
			}
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		finally
		{
			DbConnection.ConnectionClose();
			System.out.println("Connection Close..!!");
		}
		return map;
	}
	
	public static Map showCardDetails(String accNum){
		
		Connection con = DbConnection.ConnectionOpen();
		
		Map<String, String> map = new LinkedHashMap<String, String>();
		
		try 
		{
			if (con != null) 
			{
				PreparedStatement stm = con.prepareStatement("Select * from ICICI_Debit_Card where Account_Number = ?");
				stm.setString(1, accNum);
				ResultSet rs = stm.executeQuery();
				while(rs.next())
				{
					map.put("Full_Name", (String) rs.getString("Full_Name"));
					map.put("Acc_Num", (String) rs.getString("Account_Number"));
					map.put("Debit_Card_Number", (String) rs.getString("Debit_Card_Number"));
					map.put("Valid_From", (String) rs.getString("Valid_From"));
					map.put("Valid_Thru", (String) rs.getString("Valid_Thru"));
					map.put("CVV", (String) rs.getString("CVV"));
				}
				return map;
			}
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		finally
		{
			DbConnection.ConnectionClose();
			System.out.println("Connection Close..!!");
		}
		return null;
	}
}
