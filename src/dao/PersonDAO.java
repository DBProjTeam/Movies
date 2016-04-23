package dao;

import entities.Person;
import util.Connector;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Едик  Лисогуб on 06.03.2016.
 */
public class PersonDAO {
    private static final String GET_PERSON_BY_ID = "SELECT * FROM person WHERE person_ID=?";
    private static final String SEARCH_PERSON_BY_NAME_AND_SURNAME="SELECT * FROM person WHERE(person.name LIKE ?'%') OR (person.surname LIKE ?'%')";
    private static final String INSERT_PERSON ="INSERT INTO `person` (`name`,`surname`,`birth_date`,`death_date`,`country`,`image_ID`) VALUES (?,?,?,?,?,?);";
    private static final String UPDATE_PERSON="UPDATE `person` SET `name`=?, `surname`=?, `birth_date`=?, `death_date`=?, `country`=?,`image_ID`=? WHERE `person_ID`=?;";
    private static final String DELETE_PERSON="DELETE FROM `person` WHERE `person_ID`=?;";
    Connection connection;

    public Person getByPK(int pk) throws SQLException {
        Person person = null;
        PreparedStatement statement = null;
        ResultSet res = null;
        try {
            connection = Connector.getConnection();
            statement = connection.prepareStatement(GET_PERSON_BY_ID);
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

    public boolean insert(Person person)throws SQLException{
        boolean isOk = false;
        PreparedStatement  statement = null;
        try {
            connection=Connector.getConnection();
            statement=connection.prepareStatement(INSERT_PERSON);
            statement.setString(1,person.getName());
            statement.setString(2,person.getSurname());
            statement.setDate(3, (Date) person.getBirth_date());
            statement.setDate(4,(Date) person.getDeath_date());
            statement.setString(5, person.getCountry());
            statement.setInt(6,person.getImageId());
            isOk = statement.execute();
        }finally {
            Connector.close(statement);
        }
        return isOk;
    }

    public boolean update(Person person)throws SQLException{
        boolean isOk= false;
        PreparedStatement statement = null;
        try {
            connection = Connector.getConnection();
            statement= connection.prepareStatement(UPDATE_PERSON);
            statement.setString(1,person.getName());
            statement.setString(2,person.getSurname());
            statement.setDate(3,(Date)person.getBirth_date());
            statement.setDate(4,(Date)person.getDeath_date());
            statement.setString(5,person.getCountry());
            statement.setInt(6,person.getImageId());
            statement.setInt(7,person.getId());
            isOk= statement.execute();
        }finally {
            Connector.close(statement);
        }
        return isOk;
    }

    public boolean delete(Person person)throws SQLException{
        boolean isOk= false;
        PreparedStatement statement = null;
        try{
            connection= Connector.getConnection();
            statement= connection.prepareStatement(DELETE_PERSON);
            statement.setInt(1,person.getId());
            isOk= statement.execute();
        }finally {
            Connector.close(statement);
        }
        return isOk;
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