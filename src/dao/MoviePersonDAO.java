package dao;

import entities.MoviePerson;
import util.Connector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Станислав on 09.03.16.
 */
public class MoviePersonDAO {
    private  static  String GET_MOVIE_PERSON_BY_ID_MOVIE = "SELECT * FROM movie_person WHERE movie_ID=?";
       Connection connection;
    public List<MoviePerson> getPersonByIdMovie(int movie_id) throws SQLException {
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<MoviePerson> moviePersons = new ArrayList<MoviePerson>();
        try {
            connection = Connector.getConnection();
            statement = connection.prepareStatement(GET_MOVIE_PERSON_BY_ID_MOVIE);
            statement.setInt(1, movie_id);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                moviePersons.add(obtain(resultSet));
            }
        } finally {
            Connector.close(statement);
            Connector.close(resultSet);
        }
        return moviePersons;
    }

    private MoviePerson obtain(ResultSet resultSet)throws SQLException {
        MoviePerson moviePerson = new MoviePerson();
        moviePerson.setId(resultSet.getInt("movie_person_ID"));
        moviePerson.setMovie_Id(resultSet.getInt("movie_ID"));
        moviePerson.setPerson_Id(resultSet.getInt("person_ID"));
        return moviePerson;
    }
}
