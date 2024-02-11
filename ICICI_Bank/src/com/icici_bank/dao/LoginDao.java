package com.icici_bank.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;

import com.icici_bank.utility.DbConnection;

public class LoginDao 
{	
	public static Map<String, String> LoginQuery(String userId)
	{
		Connection con = DbConnection.ConnectionOpen();
		
		Map<String, String> map = new LinkedHashMap<String, String>();
		
		try 
		{
			if(con != null) 
			{
				PreparedStatement stm = con.prepareStatement("select * from ICICI_Customer_Registration where Acc_Num = ?");
				stm.setString(1, userId);
				ResultSet rs = stm.executeQuery();
				
				while(rs.next())
				{
					map.put("Full_Name", (String) rs.getString("Full_Name"));
					map.put("Acc_Num", (String) rs.getString("Acc_Num"));
					map.put("Pan_Card", (String) rs.getString("Pan_Card"));
					map.put("Email_id", (String) rs.getString("Email_id"));
					map.put("Mobile_Num", (String) rs.getString("Mobile_Num"));
					map.put("Balance", (String) rs.getString("Balance"));
					map.put("Address", (String) rs.getString("Address"));
					map.put("Password_", (String) rs.getString("Password_"));
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
	
	public static Map<String, String> LoginAsAdmin(String userId)
	{
		String loginQuery = "Select * from ICICI_Admin where admin_userId = ? ";
		Connection con = DbConnection.ConnectionOpen();
		
		Map<String, String> map = new LinkedHashMap<String, String>();
		
		try 
		{
			if(con != null) 
			{
				PreparedStatement stm = con.prepareStatement(loginQuery);
				stm.setString(1, userId);
				ResultSet rs = stm.executeQuery();
				
				while(rs.next())
				{
					map.put("admin_userId", (String) rs.getString("admin_userId"));
					map.put("admin_password", (String) rs.getString("admin_password"));
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
}
