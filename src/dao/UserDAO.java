package dao;

import entities.User;
import util.Connector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by Vyacheslav.
 * @author Vyacheslav
 */
public class UserDAO {

    private static final String GET_USER_BY_ID = "SELECT * FROM user WHERE user_ID=?";
    private static final String GET_USER_BY_LOGIN = "SELECT * FROM user WHERE login=?";
    private static final String INSERT_USER = "INSERT INTO user(login, password, name, surname, user_role_ID, image_ID) VALUES(?,?,?,?,?,?)";
    private static final String UPDATE_USER = "UPDATE user SET login=?, password=?, name=?, surname=?, user_role_ID=?, image_ID=? WHERE user_ID=?";

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

    public User getByLogin(String login) throws SQLException {
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        User user = null;
        try {
            connection = Connector.getConnection();
            statement = connection.prepareStatement(GET_USER_BY_LOGIN);
            statement.setString(1, login);
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

    public void insert(User user) throws SQLException {
        PreparedStatement statement = null;
        try {
            connection = Connector.getConnection();
            statement = connection.prepareStatement(INSERT_USER);
            statement.setString(1, user.getLogin());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getName());
            statement.setString(4, user.getSurname());
            statement.setInt(5, user.getRole().ordinal() + 1); // ordinal вернет index с нуля
            statement.setInt(6, user.getImageId());
            statement.executeUpdate();
        } finally {
            Connector.close(statement);
            Connector.close(connection);
        }
    }


    public void update(User user) throws SQLException {
        PreparedStatement statement = null;
        try {
            connection = Connector.getConnection();

            statement = connection.prepareStatement(UPDATE_USER);
            statement.setString(1, user.getLogin());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getName());
            statement.setString(4, user.getSurname());
            statement.setInt(5, user.getRole().ordinal() + 1); // ordinal вернет index с нуля
            statement.setInt(6, user.getImageId());
            statement.setInt(7, user.getId());

            statement.executeUpdate();
        } finally {
            Connector.close(statement);
            Connector.close(connection);
        }
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
