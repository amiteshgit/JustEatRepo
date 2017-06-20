	package org.justeat.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.justeat.beans.VendorBeans;
import org.justeat.util.Connectivity;

public class VendorService {
	private Connection connection;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt1 = null;
	ResultSet resultSet = null;
	ResultSet resultSet1 = null;
	private String queryString = null;

	public ResultSet getVendorList() {
		
		
		try {

			connection = Connectivity.getConnectionInstance();

			queryString = "select vendor_name,vendor_id from JUSTEAT_vendors";
			pstmt = connection.prepareStatement(queryString);

			resultSet = pstmt.executeQuery();
			
			return resultSet;

			
		} catch (Exception sqle) {
			sqle.printStackTrace();
			System.out.println("Unable to fetch vendor list" + sqle);
			return resultSet;
		}
		
	}
	
public ResultSet getMenuList(int vendorID) {
		
		
		try {

			connection = Connectivity.getConnectionInstance();

			queryString = "select jm.item_name item,jm.item_id , jm.price from JUSTEAT_vendors jv, justeat_menu jm "
					+ " where jv.vendor_id=jm.vendor_id "
					+ "and jv.vendor_id="+vendorID;
			System.out.println(queryString);
			
			pstmt1 = connection.prepareStatement(queryString);

			resultSet1 = pstmt1.executeQuery();
			
			
			
		
			
			return resultSet1;

			
		} catch (Exception sqle) {
			sqle.printStackTrace();
			System.out.println("Unable to fetch menu list" + sqle);
			return resultSet1;
		}
	}
	
	

}
