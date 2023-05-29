package com.icici_bank.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;

import com.icici_bank.utility.DbConnection;

public class TransactionDao 
{
	public static String sendMoneyTransaction(Map<Integer, String> map)
	{
		Connection con = DbConnection.ConnectionOpen();
		
		try 
		{
			if (con != null) 
			{
				PreparedStatement stm = con.prepareStatement("Select balance from ICICI_Customer_Registration where Acc_Num = ?");
				stm.setString(1, map.get(1));
				ResultSet rs = stm.executeQuery();
				rs.next();
				
				String amountDebit = rs.getString("balance");
				
				int amountInt = Integer.parseInt(amountDebit);
				amountInt -= Integer.parseInt(map.get(2)); 
				
				if(amountInt> Integer.parseInt(map.get(2)))
				{	
					System.out.println("debit -"+Integer.parseInt(map.get(2)));
				
					PreparedStatement stm2 = con.prepareStatement("update ICICI_Customer_Registration set Balance = ? where Acc_Num = ?");
					stm2.setString(1,Integer.toString(amountInt));
					stm2.setString(2, map.get(1));
					stm2.executeUpdate();
				
					try
					{
						PreparedStatement stm3 = con.prepareStatement("Select balance, Acc_Num from ICICI_Customer_Registration where Mobile_Num = ?");
						stm3.setString(1, map.get(3));
						ResultSet j = stm3.executeQuery();
						j.next();
				
						String amountCredit = j.getString("balance");
						String recevierAccNum = j.getString("Acc_Num");
				
						int amountCreditInt = Integer.parseInt(amountCredit);
						amountCreditInt += Integer.parseInt(map.get(2)); 
						System.out.println("credit +"+Integer.parseInt(map.get(2)));
				
				
						PreparedStatement stm4 = con.prepareStatement("update ICICI_Customer_Registration set Balance = ? where Mobile_Num = ?");
						stm4.setString(1, Integer.toString(amountCreditInt));
						stm4.setString(2, map.get(3));
						stm4.executeUpdate();
				
						PreparedStatement stm5 = con.prepareStatement("insert into ICICI_Transactions(FromAcc, Remarks, Amount_Withdraw, Deposite_Amount, ToAcc) values (?,?,?,?,?)");
						stm5.setString(1, map.get(1));
						stm5.setString(2, map.get(4));
						stm5.setString(3, "");
						stm5.setString(4, map.get(2));
						stm5.setString(5, recevierAccNum);
						stm5.executeUpdate();
					}
					catch(Exception e)
					{
						PreparedStatement stm6 = con.prepareStatement("update ICICI_Customer_Registration set Balance = ? where Acc_Num = ?");
						stm6.setString(1, amountDebit);
						stm6.setString(2, map.get(1));
						stm6.executeUpdate();
						
						System.out.println("credit +"+Integer.parseInt(map.get(2)));
					}
				}
				else
				{
					System.out.println("Transaction failed..!!");
					return "Doesn't Have Sufficient Balance..!!";
				}
				System.out.println("Payment Sucessfull..!!");
				return "Transaction Sucessfull";
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
	
	public static void setDebitCardPin(String cvv, String pin)
	{
		Connection con = DbConnection.ConnectionOpen();
		
		Map<String, String> map = new LinkedHashMap<String, String>();
		
		try 
		{
			if(con != null) 
			{
				PreparedStatement stm = con.prepareStatement("update ICICI_Debit_Card set Pin = ? where CVV = ?");
				stm.setString(1, pin);
				stm.setString(2, cvv);
				int i = stm.executeUpdate();
				
				if(i>0)
				System.out.println("Pin Set Sucessfully..!!");
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
	}
}
