package org.justeat.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.justeat.util.Connectivity;

public class EditMenuService {

	private Connection connection;
	PreparedStatement pstmt = null;
	ResultSet resultSet = null;
	private String queryString = null;
	private String queryString1 = null;
	Statement stmt1 = null;

	public ResultSet getMenuList(int userid) {

		try {

			connection = Connectivity.getConnectionInstance();

			queryString = "select jm.item_name,jm.price,ja.DESCRIPTION,jm.ONE_SHOT_QUANTITY,jm.ONE_SHOT_TIME,jm.ITEM_ID,jm.AVAILABILITY_ID from JUSTEAT_vendors jv,justeat_menu jm,JUSTEAT_AVAILABILITY ja where jv.vendor_id=jm.vendor_id and jm.AVAILABILITY_ID=ja.AVAILABILITY_ID and jv.vendor_id="
					+ userid;
			pstmt = connection.prepareStatement(queryString);

			resultSet = pstmt.executeQuery();
			return resultSet;

		} catch (Exception sqle) {
			sqle.printStackTrace();
			System.out.println("Unable to fetch menu list" + sqle);
			return resultSet;
		}
	}

	public int editMenu(int itemID, String itemName, int price, int availability, int oneShotQuantity,int oneShotTime) {
		try {
			connection = Connectivity.getConnectionInstance();

			queryString1 = "update justeat_menu set ITEM_NAME='" + itemName + "' , AVAILABILITY_ID=" + availability
					+ ", PRICE=" + price + ", ONE_SHOT_QUANTITY=" + oneShotQuantity + ", ONE_SHOT_TIME=" + oneShotTime
					+ " where item_id=" + itemID;
			
			

			stmt1 = connection.createStatement();

			int i = stmt1.executeUpdate(queryString1);
			return i;

		} catch (Exception sqle) {
			sqle.printStackTrace();
			System.out.println("Unable to edit menu list" + sqle);
			return 1;
		}

	}
}
