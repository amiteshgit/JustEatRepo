package org.justeat.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import org.justeat.util.Connectivity;

public class SignupService {

	private Connection connection;

	private String queryString;

	// cprivate String query;
	Statement stmt = null;
	Statement stmt1 = null;
	Statement stmt0 = null;
	PreparedStatement pstmt1 = null;

	public String signup(String fullname, String emailID, String usertype, String password) {

		try {

			connection = Connectivity.getConnectionInstance();

			queryString = "insert into justeat_users(user_id , full_name , email_id , password , user_type)"
					+ " values (justeat_users_s.nextval ," + "'" + fullname + "' ," + "'" + emailID + "' ," + "'"
					+ password + "' ," + "'" + usertype + "')";

			stmt = connection.createStatement();

			int ret = stmt.executeUpdate(queryString);

			return "SUCCESS";

		} catch (Exception sqle) {
			sqle.printStackTrace();
			System.out.println("Unable to register" + sqle);
			return "invalid";
		}

	}
}
