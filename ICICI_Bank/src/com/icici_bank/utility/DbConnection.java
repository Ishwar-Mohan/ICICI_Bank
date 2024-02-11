package com.icici_bank.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection 
{
	private static Connection conn;
	
	public static Connection ConnectionOpen()
	{
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver Found..!!");
			conn = DriverManager.getConnection("jdbc:mysql://192.168.57.5:3306/NT006","ishwar.mohan",")#EhWuwI");
			System.out.println("Connection Estabilished..!!");
			
			return conn;
		}
		catch (Exception e) 
		{
			System.out.println("Connection not Estabilished..!!");
		}
		
		return null;
	}

	public static void ConnectionClose()
	{
		try 
		{
			if(conn != null)
			conn.close();
		} 
		catch (SQLException e) 
		{
			System.out.println("Connction closing having prob..!!");
		}
	}
}
