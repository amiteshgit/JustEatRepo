package org.justeat.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import org.justeat.util.Connectivity;

public class UpdateVendorService {
	
	private Connection connection;
	private ResultSet resultSet;
	private String queryString;
	Statement stmt = null;
	private ResultSet resultSet0;
	private String queryString0;
	Statement stmt0 = null;
	private String queryString1;
	Statement stmt1 = null;
	
	
	public void updateVendor(String fullname,String email, String password ){
		try{
		connection = Connectivity.getConnectionInstance();
		queryString0 = "select justeat_users_s.nextval from dual";
		stmt0 = connection.createStatement();
		resultSet0 = stmt0.executeQuery(queryString0);

		resultSet0.next();
		int users_seq = resultSet0.getInt(1);
		queryString = "Insert into justeat_users (user_id,full_name,email_id,password,user_type) "
				+ "values ("
				+ users_seq+","
				+ "'"+fullname+"',"
				+ "'"+email+"',"
				+ "'"+password+"',"
				+ "'VENDOR')";
						
		
				
		stmt = connection.createStatement();
		
		System.out.println(queryString);

		int i= stmt.executeUpdate(queryString);
		
		queryString1="Insert into justeat_vendors (VENDOR_ID,VENDOR_NAME,USER_ID) "
				+ "values ("
				+ "justeat_vendors_s.nextval,"
				+ "'"+fullname+"',"
						+ users_seq+")";
		System.out.println(queryString1);
		
		stmt1 = connection.createStatement();
		
		

		int j= stmt1.executeUpdate(queryString1);
		
		}
		catch (Exception sqle) {
			sqle.printStackTrace();
			System.out.println("Unable to authenticate" + sqle);
		}
		
	}

	
	


}
