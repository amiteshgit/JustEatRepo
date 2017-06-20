package org.justeat.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import org.justeat.util.Connectivity;

public class ViewPendingVendorOrders {

	private Connection connection = null;
	ResultSet resultSet = null;
	PreparedStatement pstmt = null;
	private String queryString = null;
	ResultSet resultSet1 = null;
	PreparedStatement pstmt1 = null;
	private String queryString1 = null;
	private String queryString2 = null;
	Statement stmt1 = null;

	public ResultSet getOrderList(int vendorID , int statusID){

		try {

			connection = Connectivity.getConnectionInstance();

			/*
			 * get list of all orders for this vendor
			 */
			queryString = "select jo.order_id,ju.full_name, jvo.VENDOR_ORDER_ID "
                         +" from JUSTEAT_ORDERS jo, JUSTEAT_USERS ju,JUSTEAT_VENDOR_ORDERS jvo "
                         +" where jo.user_id=ju.user_id "
                         +" and jo.order_id=jvo.order_id "
                         +" and jvo.STATUS_ID="+statusID
                         +" and jvo.vendor_id="+ vendorID;

			pstmt = connection.prepareStatement(queryString);
			resultSet = pstmt.executeQuery();
			return resultSet;

		} catch (Exception sqle) {
			sqle.printStackTrace();
			System.out.println("Unable to get vendor details" + sqle);
			return resultSet;

		}
		
		
	}
	
	public ResultSet getItemList(int vendorOrderDescID){

		try {

			connection = Connectivity.getConnectionInstance();

			/*
			 * get list of all vendor for this order
			 */
			queryString1 = "select jm.item_name, jod.quantity,jod.amount "
                          +" from JUSTEAT_MENU jm, JUSTEAT_ORDER_DESC jod "
                          +" where jod.item_id=jm.item_id "
                          +" and jod.VENDOR_ORDER_ID="+vendorOrderDescID;

			pstmt1 = connection.prepareStatement(queryString1);
			resultSet1 = pstmt1.executeQuery();
			return resultSet1;

		} catch (Exception sqle) {
			sqle.printStackTrace();
			System.out.println("Unable to get vendor details" + sqle);
			return resultSet1;

		}
		
		
	}

	public void updateMenu(int vendororderID){
		try{
		connection = Connectivity.getConnectionInstance();

		queryString2 = "update justeat_vendor_orders set status_id=2 where vendor_order_id="+vendororderID;
				
		stmt1 = connection.createStatement();

		int i = stmt1.executeUpdate(queryString2);
		}
		catch (Exception sqle) {
			sqle.printStackTrace();
			System.out.println("Unable to authenticate" + sqle);
		}
		
	
	
	
	
	}
}
