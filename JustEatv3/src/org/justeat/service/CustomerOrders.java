package org.justeat.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.justeat.util.Connectivity;

public class CustomerOrders {
	
	private Connection connection = null;
	ResultSet resultSet = null;
	PreparedStatement pstmt = null;
	private String queryString = null;
	ResultSet resultSet1 = null;
	PreparedStatement pstmt1 = null;
	private String queryString1 = null;
	ResultSet resultSet2 = null;
	PreparedStatement pstmt2 = null;
	private String queryString2 = null;

	public ResultSet getOrderList(int userID){

		try {

			connection = Connectivity.getConnectionInstance();

			/*
			 * get list of all orders for this customer having
			 */
			queryString = "select order_id from justeat_orders where user_id="+ userID;

			pstmt = connection.prepareStatement(queryString);
			resultSet = pstmt.executeQuery();
			return resultSet;

		} catch (Exception sqle) {
			sqle.printStackTrace();
			System.out.println("Unable to get vendor details" + sqle);
			return resultSet;

		}
		
		
	}
	
	public ResultSet getVendorList(int orderID){

		try {

			connection = Connectivity.getConnectionInstance();

			/*
			 * get list of all vendor for this order
			 */
			queryString1 = "select jv.VENDOR_NAME,js.status_meaning,jvo.VENDOR_ORDER_ID "
                          +" from JUSTEAT_VENDOR_ORDERS jvo,JUSTEAT_VENDORS jv, justeat_status js "
                          +" where jv.vendor_id=jvo.vendor_id " 
                          +" and jvo.status_id=js.STATUS_ID "
                          +" and jvo.order_id="+orderID;

			pstmt1 = connection.prepareStatement(queryString1);
			resultSet1 = pstmt1.executeQuery();
			return resultSet1;

		} catch (Exception sqle) {
			sqle.printStackTrace();
			System.out.println("Unable to get vendor details" + sqle);
			return resultSet1;

		}
		
		
	}
	public ResultSet getItemDetails(int vendorOrderID){

		try {

			connection = Connectivity.getConnectionInstance();

			/*
			 * get list of all items corresponding to vendor order ID
			 */
			queryString2 = "select jm.item_name, jod.quantity, jod.amount"
                          +" from JUSTEAT_ORDER_DESC jod, JUSTEAT_VENDOR_ORDERS jvo,JUSTEAT_MENU jm "
                          +" where jvo.VENDOR_ORDER_ID=jod.VENDOR_ORDER_ID"
                          +" and jod.item_id=jm.ITEM_ID "
                          +" and jvo.VENDOR_ORDER_ID="+vendorOrderID;

			pstmt2 = connection.prepareStatement(queryString2);
			resultSet2 = pstmt2.executeQuery();
			return resultSet2;

		} catch (Exception sqle) {
			sqle.printStackTrace();
			System.out.println("Unable to get vendor details" + sqle);
			return resultSet2;

		}
		
		
	}



}
