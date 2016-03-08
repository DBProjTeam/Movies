package dao;


import entities.Movie;
import util.Connector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MovieDAO {
    private  static String GET_MOVIE_BY_ID="SELECT * FROM movie WHERE movie_ID=?";
    private static String GET_MOVIE_BY_YEAR="SELECT * FROM movie WHERE movie.year=?";
    private static String GET_MOVIE_ALL ="SELECT * FROM movie";
    Connection connection;

    public Movie getByPK(int pk) throws SQLException {
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        Movie movie = null;
        try {
            connection = Connector.getConnection();
            statement = connection.prepareStatement(GET_MOVIE_BY_ID);
            statement.setInt(1, pk);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                movie = obtain(resultSet);
            }
        } finally {
            Connector.close(statement);
            Connector.close(resultSet);
        }
        return movie;
    }

    public List<Movie> getMoviesByYear(int year) throws SQLException {
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<Movie> movies =new ArrayList<Movie>();
        try {
            connection = Connector.getConnection();
            statement = connection.prepareStatement(GET_MOVIE_BY_YEAR);
            statement.setInt(1,year);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                movies.add(obtain(resultSet));
            }
        } finally {
            Connector.close(statement);
            Connector.close(resultSet);
        }
        return movies;
    }

    public  List<Movie>getAllMovie()throws SQLException{
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<Movie> movies =new ArrayList<Movie>();
        try {
            connection = Connector.getConnection();
            resultSet = statement.executeQuery(GET_MOVIE_ALL);
            if (resultSet.next()) {
                movies.add(obtain(resultSet));
            }
        } finally {
            Connector.close(statement);
            Connector.close(resultSet);
        }
        return movies;
    }
    private Movie obtain(ResultSet resultSet) throws SQLException {
        Movie movie = new Movie();
        movie.setMovie_id(resultSet.getInt("movie_ID"));
        movie.setRuntime(resultSet.getInt("runtime"));
        movie.setDescription(resultSet.getString("description"));
        movie.setImage_id(resultSet.getInt("year"));
        movie.setReleaseDate(resultSet.getDate("releaseDate"));
        movie.setImage_id(resultSet.getInt("image_ID"));
        return movie;
    }

}
