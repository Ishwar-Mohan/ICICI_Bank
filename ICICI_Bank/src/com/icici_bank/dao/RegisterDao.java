package com.icici_bank.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import com.icici_bank.utility.DbConnection;

public class RegisterDao 
{
	public static boolean RegisterQuery(Map<Integer, String> map)
	{
		String registerQuery = "insert into ICICI_Customer_Registration(Full_Name, Acc_Num, Pan_Card, Email_id, Mobile_Num, Address,Password_) values(?,?,?,?,?,?,?)";
		Connection con = DbConnection.ConnectionOpen();
		
		try 
		{
			if (con != null) 
			{
				PreparedStatement stm = con.prepareStatement(registerQuery);
				
				for(Map.Entry<Integer,String> entry : map.entrySet())
				{
					stm.setString(entry.getKey(),entry.getValue());
				}
				
				int rs = stm.executeUpdate();
				System.out.println("Row Affected : "+rs);
				System.out.println("Registration Sucessfull..!!");
				if(rs>0)
					return true;
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
		return false;
	}
	
	public static String getAccNumber(String accNumber)
	{
		Connection con = DbConnection.ConnectionOpen();
		
		try 
		{
			PreparedStatement ps = con.prepareStatement("Select Acc_Num from ICICI_Customer_Registration where Acc_Num = ?");
				ps.setString(1, accNumber);
				ResultSet rs = ps.executeQuery();
			
			if (rs.next())
			{
				return "Alredy Present";
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
	
	public static String getMobileNo(String mobno)
	{
		Connection con = DbConnection.ConnectionOpen();
		
		try 
		{
			PreparedStatement ps = con.prepareStatement("Select Mobile_Num from ICICI_Customer_Registration where Mobile_Num = ?");
				ps.setString(1, mobno);
				ResultSet rs = ps.executeQuery();
			
			if (rs.next())
			{
				return "Alredy Present";
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
	
	public static String getEmail(String email)
	{
		Connection con = DbConnection.ConnectionOpen();
		
		try 
		{
			PreparedStatement ps = con.prepareStatement("Select Email_id from ICICI_Customer_Registration where Email_id = ?");
				ps.setString(1, email);
				ResultSet rs = ps.executeQuery();
			
			if (rs.next()) 
			{
				return "Alredy Present";
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
}
