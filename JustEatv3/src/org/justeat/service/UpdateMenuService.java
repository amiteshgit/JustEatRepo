package org.justeat.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import org.justeat.util.Connectivity;

public class UpdateMenuService {
	private Connection connection;
	private ResultSet resultSet;
	private String queryString;
	// cprivate String query;
	Statement stmt = null;
	PreparedStatement pstmt1 = null;
	
	public void updateMenu(String itemName,int price, String availability, int vendorID){
		try{
		connection = Connectivity.getConnectionInstance();

		queryString = "Insert into justeat_menu (ITEM_ID,ITEM_NAME,VENDOR_ID,AVAILABILITY_ID,PRICE) "
				+ "values ("
				+ "justeat_menu_s.nextval,"
				+ "'"+itemName+"',"
				+ vendorID+","
				+ "1,"
				+ price+")";
		
				
		stmt = connection.createStatement();

		int i = stmt.executeUpdate(queryString);
		}
		catch (Exception sqle) {
			sqle.printStackTrace();
			System.out.println("Unable to authenticate" + sqle);
		}
		
	}

}
