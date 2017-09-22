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
	ResultSet resultSet2 = null;
	PreparedStatement pstmt1 = null;
	PreparedStatement pstmt2 = null;
	private String queryString1 = null;
	private String queryString4 = null;
	private String queryString2 = null;
	Statement stmt1 = null;
	private String queryString3 = null;
	Statement stmt2 = null;

	public ResultSet getOrderList(int userID, int statusID) {

		try {

			connection = Connectivity.getConnectionInstance();

			/*
			 * get list of all orders for this vendor
			 */
			queryString = "select jo.order_id,ju.full_name, jvo.VENDOR_ORDER_ID "
					+ " from JUSTEAT_ORDERS jo, JUSTEAT_USERS ju,JUSTEAT_VENDOR_ORDERS jvo, justeat_vendors jv, justeat_users ju1 "
					+ " where jo.user_id=ju.user_id " + " and jo.order_id=jvo.order_id " + " and jvo.STATUS_ID="
					+ statusID + " and jvo.vendor_id=jv.vendor_id and jv.user_id=ju1.user_id and ju1.user_id=" + userID;
			

			pstmt = connection.prepareStatement(queryString);
			resultSet = pstmt.executeQuery();

			return resultSet;

		} catch (Exception sqle) {
			sqle.printStackTrace();
			System.out.println("Unable to get vendor details" + sqle);
			return resultSet;

		}

	}

	public ResultSet getItemList(int vendorOrderDescID) {

		try {

			connection = Connectivity.getConnectionInstance();

			/*
			 * get list of all vendor for this order
			 */
			queryString1 = "select jm.item_name, jod.quantity,jod.amount "
					+ " from JUSTEAT_MENU jm, JUSTEAT_ORDER_DESC jod " + " where jod.item_id=jm.item_id "
					+ " and jod.VENDOR_ORDER_ID=" + vendorOrderDescID;

			pstmt1 = connection.prepareStatement(queryString1);
			resultSet1 = pstmt1.executeQuery();

			return resultSet1;

		} catch (Exception sqle) {
			sqle.printStackTrace();
			System.out.println("Unable to get vendor details" + sqle);
			return resultSet1;

		}

	}

	public void updateMenu(int vendororderID, int statusID, int time) {
		try {
			connection = Connectivity.getConnectionInstance();

			queryString2 = "update justeat_vendor_orders set status_id=" + statusID + "  where vendor_order_id="
					+ vendororderID;

			stmt1 = connection.createStatement();

			int i = stmt1.executeUpdate(queryString2);
			queryString3 = "update justeat_order_desc set status_id=" + statusID + " where vendor_order_id="
					+ vendororderID;

			stmt2 = connection.createStatement();

			i = stmt2.executeUpdate(queryString3);

		} catch (Exception sqle) {
			sqle.printStackTrace();
			System.out.println("Unable to authenticate" + sqle);
		}

	}

	public ResultSet getListForCook(int userID) {

		try {

			connection = Connectivity.getConnectionInstance();

			/*
			 * g
			 */
			queryString4 = "select jm.item_name, sum(jod.quantity) from justeat_menu jm,justeat_vendor_orders jvo,justeat_order_desc jod, justeat_vendors jv, justeat_users ju"
					+ " where jvo.VENDOR_ORDER_ID=jod.VENDOR_ORDER_ID" + " and jm.ITEM_ID=jod.ITEM_ID"
					+ " and jod.STATUS_ID=1" + " and jvo.VENDOR_ID=jv.vendor_id and jv.user_id=ju.user_id and ju.user_id=" + userID + " group by jm.item_name";
			System.out.println(queryString4);
			pstmt2 = connection.prepareStatement(queryString4);
			resultSet2 = pstmt2.executeQuery();
			return resultSet2;

		} catch (Exception sqle) {
			sqle.printStackTrace();
			System.out.println("Unable to authenticate" + sqle);
			return resultSet2;
		}

	}
}
