package org.justeat.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import org.justeat.util.Connectivity;

public class SignupService {

	private Connection connection;
	private ResultSet resultSet;
	private String queryString0;
	private String queryString;
	private String queryString1;

	// cprivate String query;
	Statement stmt = null;
	Statement stmt1 = null;
	Statement stmt0 = null;
	PreparedStatement pstmt1 = null;

	public String signup(String fullname, String emailID, String usertype, String password) {

		try {

			connection = Connectivity.getConnectionInstance();

			queryString0 = "select justeat_users_s.nextval from dual";
			stmt0 = connection.createStatement();
			resultSet = stmt0.executeQuery(queryString0);
			resultSet.next();
			int users_seq = resultSet.getInt(1);

			queryString = "insert into justeat_users(user_id , full_name , email_id , password , user_type)"
					+ " values (" + users_seq + " ," + "'" + fullname + "' ," + "'" + emailID + "' ," + "'" + password
					+ "' ," + "'" + usertype + "')";

			stmt = connection.createStatement();

			int ret = stmt.executeUpdate(queryString);

			if (usertype.equalsIgnoreCase("VENDOR"))

			{

				queryString1 = "insert into justeat_vendors(vendor_id , vendor_name , user_id)" + " values ("
						+ "justeat_vendors_s.nextval," + "'" + fullname + "' ," + users_seq + ")";

				stmt1 = connection.createStatement();

				int ret1 = stmt1.executeUpdate(queryString1);

			}

			return "SUCCESS";

		} catch (Exception sqle) {
			sqle.printStackTrace();
			System.out.println("Unable to register" + sqle);
			return "invalid";
		}

	}
}
