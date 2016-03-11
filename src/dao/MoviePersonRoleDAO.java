package dao;

import entities.MoviePerson;
import entities.MoviePersonRole;
import util.Connector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Здесь нужно узнать зачем этот  класс
 * Created by Станислав on 09.03.16.
 */
public class MoviePersonRoleDAO {
    private  static  String GET_MOVIE_PERSON_ROLE_BY_MOVIE_PERSON_ID = "SELECT * FROM movie_person_role WHERE movie_person_ID=?";
    Connection connection;

    public List<MoviePersonRole> getPersonByIdMovie(int movie_person_ID) throws SQLException {
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<MoviePersonRole> moviePersons = new ArrayList<MoviePersonRole>();
        try {
            connection = Connector.getConnection();
            statement = connection.prepareStatement(GET_MOVIE_PERSON_ROLE_BY_MOVIE_PERSON_ID);
            statement.setInt(1, movie_person_ID);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {//Исправлено
                moviePersons.add(obtain(resultSet));
            }
        } finally {
            Connector.close(statement);
            Connector.close(resultSet);
        }
        return moviePersons;
    }

    private MoviePersonRole obtain(ResultSet resultSet)throws SQLException{
        MoviePersonRole moviePersonRole = new MoviePersonRole();
        moviePersonRole.setId(resultSet.getInt("movie_person_role_ID"));
        moviePersonRole.setMovie_Person_Id(resultSet.getInt("movie_person_ID"));
        moviePersonRole.setRole(resultSet.getString("role"));
        return moviePersonRole;
    }
}
