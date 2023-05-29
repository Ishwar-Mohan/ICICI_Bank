package com.icici_bank.utility;

import com.google.gson.Gson;

public class JsonParser {
	
	public static String getJsonString(Object o)
	{
		return new Gson().toJson(o);
	}	
}
