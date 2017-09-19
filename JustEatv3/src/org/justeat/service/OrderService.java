package org.justeat.service;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Scanner;
import java.util.Set;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.justeat.util.Connectivity;

public class OrderService {
	private Connection connection;
	Statement stmt0 = null;
	Statement stmt = null;
	Statement stmt1 = null;
	Statement stmt2 = null;
	Statement stmt3 = null;
	ResultSet resultSet = null;
	ResultSet resultSet1 = null;
	ResultSet resultSet2 = null;
	private String queryString0 = null;
	private String queryString = null;
	private String queryString1 = null;
	private String queryString2 = null;
	private String queryString3 = null;

	public void updateOrder(String vendorID[], String itemID[], String quantity[], String amount[], int userID) {

		int totalAmount = 0;
		int vID = 0;
		int iID = 0;
		int amt = 0;
		int quant = 0;
		int ret = 0;
		int vendor_seq = 0;
		int vendor_id = 0;
		Integer vendorArray[] = new Integer[vendorID.length];
		HashSet<Integer> vendorSet = new HashSet<Integer>();
		for (int i = 0; i < vendorID.length; i++) {
			vendorArray[i] = Integer.parseInt(vendorID[i]);

		}
		Collections.addAll(vendorSet, vendorArray);
		for (int i = 0; i < amount.length; i++) {
			totalAmount += Integer.parseInt(amount[i]);
		}
		try {

			connection = Connectivity.getConnectionInstance();
			queryString0 = "select justeat_orders_s.nextval from dual";
			stmt0 = connection.createStatement();
			resultSet = stmt0.executeQuery(queryString0);

			resultSet.next();
			int orders_seq = resultSet.getInt(1);
			queryString = "insert into JUSTEAT_ORDERS (order_id, amount,user_id,order_time) " + "values( " + orders_seq
					+ ", " + totalAmount + ", " + userID + ",sysdate)";
			stmt = connection.createStatement();
			ret = stmt.executeUpdate(queryString);

			Iterator itr = vendorSet.iterator();
			while (itr.hasNext()) {

				queryString2 = "select justeat_vendor_order_s.nextval from dual";
				stmt2 = connection.createStatement();
				resultSet2 = stmt2.executeQuery(queryString2);

				resultSet2.next();
				vendor_seq = resultSet2.getInt(1);

				vendor_id = (int) itr.next();
				queryString3 = "insert into JUSTEAT_VENDOR_ORDERS (VENDOR_ORDER_ID,VENDOR_ID, ORDER_ID,STATUS_ID) "
						+ "values( " + vendor_seq + ", " + vendor_id + ", " + orders_seq + ", " + "1)";
				stmt3 = connection.createStatement();
				ret = stmt3.executeUpdate(queryString3);

				for (int j = 0; j < vendorID.length; j++) {
					vID = Integer.parseInt(vendorID[j]);
					iID = Integer.parseInt(itemID[j]);
					quant = Integer.parseInt(quantity[j]);
					amt = Integer.parseInt(amount[j]);
					if (vendor_id == vID) {

						queryString1 = "insert into justeat_order_desc (order_desc_id,item_id,vendor_order_id,quantity,amount,status_id) "
								+ " values(" + "justeat_order_desc_s.nextval, " + iID + ", " + vendor_seq + ", " + quant
								+ ", " + amt + ",1)";

						stmt1 = connection.createStatement();
						ret = stmt1.executeUpdate(queryString1);
					}
				}
			}

			CallableStatement cStmt = connection.prepareCall("{call calculation_engine(?)}");
			cStmt.setInt(1, orders_seq);
			cStmt.execute();

		} catch (Exception sqle) {
			sqle.printStackTrace();
			System.out.println("Unable to add orders" + sqle);
		}

	}

}
