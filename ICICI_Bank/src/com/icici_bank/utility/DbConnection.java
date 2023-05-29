package com.icici_bank.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection 
{
	static Connection con;
	
	public static Connection ConnectionOpen()
	{
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver Found..!!");
			con = DriverManager.getConnection("jdbc:mysql://192.168.57.5:3306/NT006","ishwar.mohan",")#EhWuwI");
			System.out.println("Connection Estabilished..!!");
			return con;
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
			if(con != null)
			con.close();
		} 
		catch (SQLException e) 
		{
			System.out.println("Connction closing having prob..!!");
		}
	}
}
