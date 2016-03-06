package dao;

import entities.User;
import util.Connector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by Vyacheslav.
 */
public class UserDAO {

    private static final String GET_USER_BY_ID = "SELECT * FROM user WHERE user_ID=?";

    Connection connection;

    public User getByPK(int pk) throws SQLException {
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        User user = null;
        try {
            connection = Connector.getConnection();
            statement = connection.prepareStatement(GET_USER_BY_ID);
            statement.setInt(1, pk);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                user = obtain(resultSet);
            }
        } finally {
            Connector.close(statement);
            Connector.close(resultSet);
        }
        return user;
    }

    private User obtain(ResultSet resultSet) throws SQLException {
        User user = new User();
        user.setId(resultSet.getInt("user_ID"));
        user.setLogin(resultSet.getString("login"));
        user.setPassword(resultSet.getString("password"));
        user.setName(resultSet.getString("name"));
        user.setSurname(resultSet.getString("surname"));
        user.setRole(User.UserRole.getRole(resultSet.getInt("user_role_ID")));
        user.setImageId(resultSet.getInt("image_ID"));
        return user;
    }
}
