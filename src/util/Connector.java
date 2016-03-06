package util;

import java.sql.*;

/**
 * Created by Vyacheslav.
 */
public class Connector {

    private static Connection connection;

    private Connector() {

    }

    public synchronized static Connection getConnection() throws SQLException {
        if (connection == null) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/movies", "root",
                    "root");
        }
        return connection;
    }

    public static void close(Connection connection) {
        if (connection != null) {
			try {
				connection.close();
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}
    }

    public static void close(Statement statement) {
        if (statement != null) {
            try {
                statement.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    public static void close(ResultSet resultSet) {
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}
