package dao;

import entities.Person;
import util.Connector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Едик  Лисогуб on 06.03.2016.
 */
public class PersonDAO {
    private static final String GET_PESON_BY_ID = "SELECT * FROM person WHERE person_ID=?";
    private static final String SEARCH_PERSON_BY_NAME_AND_SURNAME="SELECT * FROM person WHERE(person.name LIKE ?'%') OR (person.surname LIKE ?'%')";
    Connection connection;

    public Person getByPK(int pk) throws SQLException {
        Person person = null;
        PreparedStatement statement = null;
        ResultSet res = null;
        try {
            connection = Connector.getConnection();
            statement = connection.prepareStatement(GET_PESON_BY_ID);

            statement.setInt(1, pk);
            res = statement.executeQuery();
            if (res.next()) {
                person = obtain(res);
            }
        } finally {
            Connector.close(statement);
            Connector.close(res);
        }
        return person;

    }

    public List<Person> searchPersonByNameAndSurname(String words) throws SQLException {
        List<Person> person = new ArrayList<Person>();
        PreparedStatement statement = null;
        ResultSet res = null;
        try {
            connection = Connector.getConnection();
            statement = connection.prepareStatement(SEARCH_PERSON_BY_NAME_AND_SURNAME);
            statement.setString(1, words);
            statement.setString(2, words);
            res = statement.executeQuery();
            while (res.next()) {
                person.add(obtain(res));
            }
        } finally {
            Connector.close(statement);
            Connector.close(res);
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