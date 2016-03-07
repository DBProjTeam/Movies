package dao;

import entities.Studio;
import util.Connector;

import java.sql.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Created by Едик  Лисогуб on 07.03.2016.
 */
public class StudioDAO {
    private static final String GET_STUDIO_BY_ID = "SELECT  * FROM movies.studio WHERE (studio_ID = ?);";
    private static final String GET_STUDIO_BY_NAME = "SELECT * FROM movies.studio WHERE (name = ? );";
    private static final String GET_ALL = "SELECT * FROM    movies.studio ;";

    Connection connection;

    public List <Studio> getAll() throws SQLException {
        List<Studio> studios = null;
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            studios = new ArrayList<Studio>();
            connection = Connector.getConnection();
            statement = connection.createStatement();
            resultSet = statement.executeQuery(GET_ALL);
            while (resultSet.next()) {
                studios.add(obtain(resultSet));
            }
        } finally {
            Connector.close(statement);
            Connector.close(resultSet);
        }
        return studios;
    }

    public Studio getById(int id) throws SQLException {
        Studio studio = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = Connector.getConnection();
            statement = connection.prepareStatement(GET_STUDIO_BY_ID);
            statement.setInt(1, id);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                studio = obtain(resultSet);
            }


        } finally {
            Connector.close(statement);
            Connector.close(resultSet);
        }
        return studio;
    }

    public Studio getByName(String name) throws SQLException {
        Studio studio = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = Connector.getConnection();
            statement = connection.prepareStatement(GET_STUDIO_BY_NAME);
            statement.setString(1, name);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                studio = obtain(resultSet);
            }


        } finally {
            Connector.close(statement);
            Connector.close(resultSet);
        }
        return studio;
    }

    private Studio obtain(ResultSet resultSet) throws SQLException {
        Studio std = new Studio();
        std.setId(resultSet.getInt("studio_ID"));
        std.setName(resultSet.getString("name"));
        return std;
    }
}
