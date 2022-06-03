package com.DB;

import java.sql.*;

public class DBconnect {
	private static Connection con;
	public static Connection getCon()
	{
		try {
			if(con==null)
			{
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
				con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=Ebook","sa","123");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return con;
	}

}
