package org.justeat.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.justeat.util.Connectivity;

public class OrderConfirmedService {
	private int orderID;
	private int userID;
	private String userName;
	ResultSet resultSet = null;
	ResultSet resultSet1 = null;
	ResultSet resultSet2 = null;
	ResultSet resultSet3 = null;
	private String queryString = null;
	private String queryString1 = null;
	private String queryString2 = null;
	private String queryString3 = null;
	private Connection connection;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt1 = null;
	PreparedStatement pstmt2 = null;
	PreparedStatement pstmt3 = null;

	public int getOrderID() {
		return orderID;
	}

	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setDetails(int userID) {
		this.userID = userID;
		try {

			connection = Connectivity.getConnectionInstance();

			/*
			 * get latest order ID of user
			 */
			queryString = "select max(jo.order_id) from justeat_orders jo where jo.user_id=" + userID;
			pstmt = connection.prepareStatement(queryString);
			resultSet = pstmt.executeQuery();
			resultSet.next();
			this.orderID = resultSet.getInt(1);
			/*
			 * get full name of the user
			 */
			queryString1 = "select full_name from justeat_users where user_id=" + userID;
			pstmt1 = connection.prepareStatement(queryString1);
			resultSet1 = pstmt1.executeQuery();
			resultSet1.next();
			this.userName = resultSet1.getString(1);

		} catch (Exception sqle) {
			sqle.printStackTrace();
			System.out.println("Unable to set details" + sqle);

		}
	}

	public ResultSet getVendorList() {

		try {

			connection = Connectivity.getConnectionInstance();

			/*
			 * get list of all vendor for this order
			 */
			queryString2 = "select jv.vendor_name,js.status_meaning,jv.vendor_id from JUSTEAT_VENDOR_ORDERS jvo, JUSTEAT_VENDORS jv, JUSTEAT_STATUS js where  js.status_id=jvo.status_id and jvo.vendor_id=jv.VENDOR_ID and  jvo.order_id="
					+ orderID;

			pstmt2 = connection.prepareStatement(queryString2);
			resultSet2 = pstmt2.executeQuery();
			return resultSet2;

		} catch (Exception sqle) {
			sqle.printStackTrace();
			System.out.println("Unable to get vendor details" + sqle);
			return resultSet2;

		}
	}

	public ResultSet getItemDetails(int vendorID) {

		try {

			connection = Connectivity.getConnectionInstance();

			/*
			 * get list of items with the passed vendor ID
			 */
			queryString3 = "select jm.item_name, jod.quantity,jod.amount "
					+ " from justeat_menu jm, JUSTEAT_ORDER_DESC jod,JUSTEAT_VENDOR_ORDERS jvo,JUSTEAT_USERS ju,JUSTEAT_ORDERS jo "
					+ " where jo.order_id=jvo.order_id " + " and jvo.vendor_order_id=jod.VENDOR_ORDER_ID "
					+ " and jod.ITEM_ID=jm.ITEM_ID " + " and ju.USER_ID=jo.USER_ID" + " and ju.user_id=" + this.userID
					+ " and jvo.vendor_id=" + vendorID + " and jo.order_id=" + this.orderID;
			pstmt3 = connection.prepareStatement(queryString3);
			resultSet3 = pstmt3.executeQuery();
			return resultSet3;

		} catch (Exception sqle) {
			sqle.printStackTrace();
			System.out.println("Unable to get item details" + sqle);
			return resultSet3;

		}
	}

}
