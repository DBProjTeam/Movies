package dao;

import entities.Country;
import util.Connector;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Станислав on 02.05.16.
 */
public class CountryDAO {

    private static final String GET_ALL_COUNTRY = "SELECT * FROM `country`";
    private Connection connection;
    public List<Country> getAllCountry()throws SQLException {
        List<Country> list = new ArrayList<Country>();
        ResultSet resultSet = null;
        Statement statement=null;
        connection= Connector.getConnection();
        try{
            statement=connection.createStatement();
            resultSet=statement.executeQuery(GET_ALL_COUNTRY);
            while (resultSet.next()) {
                list.add(obtain(resultSet));
            }
        }finally {
            Connector.close(statement);
            Connector.close(resultSet);
        }
        return list;
    }

    private Country obtain(ResultSet resultSet) throws SQLException{
        Country country= new Country(resultSet.getString("country"));
        return country;
    }
}
