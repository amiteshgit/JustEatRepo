package org.justeat.util;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connectivity {
	private static Connection connection = null;
	private static String username = "justeat";
	private static String password = "justeat";

	public static Connection getConnectionInstance() {
		try {
			if (connection == null) {
System.out.println("b4 class");
				Class.forName("oracle.jdbc.driver.OracleDriver");
System.out.println("befor dr");
				connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:PRPCDB", username, password);
				System.out.println("after conn");

			}
		} catch (ClassNotFoundException cnfe) {
			System.out.println("Unable to  load Driver Class" + cnfe);
		} catch (SQLException sqle) {
			System.out.println("Sql Exception " + sqle);
		}
		return connection;

	}

	public static void closeConnection() throws IOException, SQLException {

		connection.close();

	}

}
