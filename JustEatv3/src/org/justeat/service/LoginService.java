package org.justeat.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import org.justeat.util.Connectivity;

public class LoginService {

	private Connection connection;
	private ResultSet resultSet;
	private String queryString;
	// cprivate String query;
	Statement stmt = null;
	PreparedStatement pstmt1 = null;

	public String authenticate(String userID, String password) {

		try {

			connection = Connectivity.getConnectionInstance();

			queryString = "select password , user_type from JUSTEAT_USERS where user_id=" + userID;
			stmt = connection.createStatement();

			resultSet = stmt.executeQuery(queryString);

			resultSet.next();

			String type = "CUSTOMER";

			if (resultSet.getString("password").equals(password)) {

				System.out.println(resultSet.getString("user_type"));

				if (resultSet.getString("user_type").equals(type))

					return "CUSTOMER";

				else
					return "VENDOR";
			}

			else
				return "LOGIN";

		} catch (Exception sqle) {
			sqle.printStackTrace();
			System.out.println("Unable to authenticate" + sqle);
			return "invalid";
		}

	}
	
	
	
	
	
	
	
	
	
	

}
