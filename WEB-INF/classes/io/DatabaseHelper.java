package io;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * @author: Wray Zheng
 * @date: 2017-09-22
 * @description: 封装数据库的连接和关闭操作
 */
public class DatabaseHelper {
	static private Connection connection;
	static private final String URL =
			"jdbc:mysql://localhost:3306/mydb?user=web&password=helloworld&characterEncoding=UTF-8";
	
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public static Connection getConnection() throws SQLException {
		if(connection == null || connection.isClosed())
			connection = DriverManager.getConnection(URL);

		return connection;
	}
	
	public static void closeConnection() {
		try {
			if(connection != null && !connection.isClosed())
				connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
