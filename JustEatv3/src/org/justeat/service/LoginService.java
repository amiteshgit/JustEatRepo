package org.justeat.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import org.justeat.beans.LoginBean;
import org.justeat.util.Connectivity;

public class LoginService {

	private Connection connection;
	private ResultSet resultSet;
	private String queryString;
	// cprivate String query;
	Statement stmt = null;
	LoginBean loginBean;
	PreparedStatement pstmt1 = null;

	public LoginBean authenticate(String userID, String password) {

		try {
			loginBean = new LoginBean();
			loginBean.setUserType("LOGIN");
			System.out.println(userID);
			connection = Connectivity.getConnectionInstance();

			queryString = "select password , user_type,user_id from JUSTEAT_USERS where email_id='" + userID + "'";

			System.out.println(queryString);
			stmt = connection.createStatement();

			resultSet = stmt.executeQuery(queryString);

			resultSet.next();

			loginBean.setUserID(resultSet.getString(3));

			String type = "CUSTOMER";

			String admin_type = "ADMIN";

			if (resultSet.getString("password").equals(password)) {

				if (resultSet.getString("user_type").equals(type))

					loginBean.setUserType("CUSTOMER");

				else if (resultSet.getString("user_type").equals(admin_type))

					loginBean.setUserType("ADMIN");

				else
					loginBean.setUserType("VENDOR");
			}

			else
				loginBean.setUserType("LOGIN");
			return loginBean;

		} catch (Exception sqle) {
			sqle.printStackTrace();
			System.out.println("Unable to authenticate" + sqle);
			return loginBean;
		}

	}

}
