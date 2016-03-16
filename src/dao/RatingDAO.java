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
 */
public class RatingDAO {
    private static String GET_RATING_BY_ID_MOVIE="SELECT *  FROM rating WHERE rating.movie_ID=?";
    private static String ADD_NEW_RATING="INSERT INTO rating (`rating_ID`,`user_ID`,`movie_ID`,`score`)VALUES (NULL,?,?,?)";
    private static String INSERT_OR_UPDATE_RATING="INSERT INTO rating (`user_ID`,`movie_ID`,`score`) VALUES (?,?,?)" +
            " ON DUPLICATE KEY UPDATE score=?";

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

    public void insertOrUpdate(Rating rating)throws SQLException{
        PreparedStatement statement = null;
        try {
            connection = Connector.getConnection();
            statement = connection.prepareStatement(INSERT_OR_UPDATE_RATING);
            statement.setInt(1, rating.getUser_ID());
            statement.setInt(2, rating.getMovie_ID());
            statement.setInt(3, rating.getScore());
            statement.setInt(4, rating.getScore());

            statement.executeUpdate();
        } finally {
            Connector.close(statement);
        }
    }

    private Rating obtain(ResultSet resultSet) throws SQLException {
       Rating rating= new Rating();
        rating.setRating_ID(resultSet.getInt("rating_ID"));
        rating.setUser_ID(resultSet.getInt("user_ID"));
        rating.setMovie_ID(resultSet.getInt("movie_ID"));
        rating.setScore(resultSet.getInt("score"));
        return rating;
    }


}
