package dao;

import entities.Person;
import util.Connector;

import java.sql.*;

/**
 * Created by Едик  Лисогуб on 06.03.2016.
 */
public class PersonDAO {
    private static final String GET_PESON_BY_ID = "SELECT * FROM person WHERE person_ID=?";
    Connection connection;
    public Person getByPK(int pk) throws SQLException {
        Person person=null;
        PreparedStatement statement = null;
        ResultSet res;
        try {
            connection = Connector.getConnection();
            statement = connection.prepareStatement(GET_PESON_BY_ID);
            statement.setInt(1,pk);
            res = statement.executeQuery();
           if(res.next()){
               person = obtain(res);
           }
        }
        finally {
            /* TODO : why? */
           // connection.close(statement);
           // connection.close(res);
        }
        return person;

    }

    private Person obtain(ResultSet res) throws SQLException {
        Person person = new Person();
        person.setId(res.getInt("person_Id"));
        person.setName(res.getString("name"));
        person.setSurname(res.getString("surname"));
        person.setCountry(res.getString("country"));
        person.setImageId(res.getInt("image_ID"));
        person.setBirth_date(res.getDate("birth_date"));
        person.setDeath_date(res.getDate("death_date"));
        return person;
    }
}
