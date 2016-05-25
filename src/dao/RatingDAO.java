package dao;

import entities.Rating;
import util.Connector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Станислав on 08.03.16.
 * @author Vyacheslav
 * @author Станислав
 */
public class RatingDAO {
    private static String GET_RATING_BY_ID_MOVIE="SELECT *  FROM rating WHERE rating.movie_ID=?";

    private static String GET_RATING_BY_MOVIE_AND_USER_ID="SELECT *  FROM rating WHERE movie_ID=? AND user_ID=?";
    private static String INSERT_RATING="INSERT INTO rating (user_ID,movie_ID,score) VALUES (?,?,?)";
    private static String UPDATE_RATING="UPDATE rating SET user_ID=?, movie_ID=?, score=? WHERE rating_ID=?";

    Connection connection;

    public List<Rating> getRatingAllByIdMovie(int idMovie) throws SQLException{
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<Rating> ratings = new ArrayList<Rating>();
        try {
            connection = Connector.getConnection();
            statement = connection.prepareStatement(GET_RATING_BY_ID_MOVIE);
            statement.setInt(1, idMovie);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {//Исправлено
                ratings.add(obtain(resultSet));
            }
        } finally {
            Connector.close(statement);
            Connector.close(resultSet);
        }
        return ratings;
    }

    public Rating getRatingByMovieIDAndUserID(int movieId,int userId)throws SQLException{
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        Rating rating = null;
        try {
            connection = Connector.getConnection();
            statement = connection.prepareStatement(GET_RATING_BY_MOVIE_AND_USER_ID);
            statement.setInt(1, movieId);
            statement.setInt(2, userId);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                rating = obtain(resultSet);
            }
        } finally {
            Connector.close(statement);
        }
        return rating;
    }

    public void insert(Rating rating)throws SQLException{
        PreparedStatement statement = null;
        try {
            connection = Connector.getConnection();
            statement = connection.prepareStatement(INSERT_RATING);
            statement.setInt(1, rating.getUserId());
            statement.setInt(2, rating.getMovieId());
            statement.setInt(3, rating.getScore());

            statement.executeUpdate();
        } finally {
            Connector.close(statement);
        }
    }
    public void update(Rating rating)throws SQLException{
        PreparedStatement statement = null;
        try {
            connection = Connector.getConnection();
            statement = connection.prepareStatement(UPDATE_RATING);
            statement.setInt(1, rating.getUserId());
            statement.setInt(2, rating.getMovieId());
            statement.setInt(3, rating.getScore());
            statement.setInt(4, rating.getId());

            statement.executeUpdate();
        } finally {
            Connector.close(statement);
        }
    }

    private Rating obtain(ResultSet resultSet) throws SQLException {
       Rating rating= new Rating();
        rating.setId(resultSet.getInt("rating_ID"));
        rating.setUserId(resultSet.getInt("user_ID"));
        rating.setMovieId(resultSet.getInt("movie_ID"));
        rating.setScore(resultSet.getInt("score"));
        return rating;
    }


}
