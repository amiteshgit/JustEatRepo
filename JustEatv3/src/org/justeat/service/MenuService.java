package org.justeat.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import org.justeat.util.Connectivity;

public class MenuService {

	private Connection connection;
	PreparedStatement pstmt = null;
	ResultSet resultSet = null;
	private String queryString = null;

	public ResultSet getMenuList(String vendorName) {
		
		try {

			connection = Connectivity.getConnectionInstance();

			queryString = "select jm.item_name,jm.price from JUSTEAT_vendors jv,justeat_menu jm where jv.vendor_id=jm.vendor_id and jv.vendor_name='Chai point'";
			pstmt = connection.prepareStatement(queryString);

			resultSet = pstmt.executeQuery();
			return resultSet;

			
		} catch (Exception sqle) {
			sqle.printStackTrace();
			System.out.println("Unable to fetch menu list" + sqle);
			return resultSet;
		}
	}

}
