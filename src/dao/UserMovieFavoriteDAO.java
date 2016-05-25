package dao;

import entities.Movie;
import entities.UserMovieFavorite;
import util.Connector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Станислав on 16.03.16.
 */
public class UserMovieFavoriteDAO {
    private static final String GET_MOVIE_ID_FAVORITE_MOVIE_USER ="SELECT * FROM user_movie_favorite WHERE user_ID =?";
    private static final String DELETE_MOVIE_FAVORITE_FROM_USER="DELETE FROM user_movie_favorite WHERE user_ID=? AND movie_ID=?";
    private static final String INSERT_MOVIE_FAVORITE_FROM_USER="INSERT INTO user_movie_favorite (user_movie_favorite_ID,user_ID,movie_ID) VALUES(NULL, ? , ? )";

    private static final String GET_FAVORITE_MOVIES ="SELECT * FROM user_movie_favorite INNER JOIN movie ON " +
            "user_movie_favorite.movie_ID = movie.movie_ID WHERE user_ID =?";

    Connection connection;

    public void deleteMovieIdFavoriteUser(UserMovieFavorite userMovieFavorite)throws SQLException{
        int user_ID= userMovieFavorite.getUserId();
        int movie_ID =userMovieFavorite.getMovieId();
        PreparedStatement statement = null;
        try {
            connection = Connector.getConnection();
            statement = connection.prepareStatement(DELETE_MOVIE_FAVORITE_FROM_USER);
            statement.setInt(1, user_ID);
            statement.setInt(2,movie_ID);
            statement.executeQuery();
        } finally {
            Connector.close(statement);
        }
    }

    public List<UserMovieFavorite> getMovieIdFavoriteUser(int user_id)throws SQLException{
        List<UserMovieFavorite> userMovieFavoritesList = new ArrayList<UserMovieFavorite>();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = Connector.getConnection();
            statement = connection.prepareStatement(GET_MOVIE_ID_FAVORITE_MOVIE_USER);
            statement.setInt(1, user_id);
            resultSet = statement.executeQuery();
            while (resultSet.next()){
                  userMovieFavoritesList.add(obtain(resultSet));
            }
        } finally {
            Connector.close(statement);
            Connector.close(resultSet);
        }
        return userMovieFavoritesList;
    }

    public List<Movie> getFavoriteMovies(int userId) throws SQLException{
        List<Movie> userMovieFavoritesList = new ArrayList<Movie>();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        MovieDAO movieDAO = new MovieDAO();
        try {
            connection = Connector.getConnection();
            statement = connection.prepareStatement(GET_FAVORITE_MOVIES);
            statement.setInt(1, userId);
            resultSet = statement.executeQuery();
            while (resultSet.next()){
                userMovieFavoritesList.add(movieDAO.obtain(resultSet));
            }
        } finally {
            Connector.close(statement);
            Connector.close(resultSet);
        }
        return userMovieFavoritesList;
    }


    private UserMovieFavorite obtain(ResultSet resultSet) throws SQLException {
        UserMovieFavorite userMovieFavorite = new UserMovieFavorite();
        userMovieFavorite.setMovieId(resultSet.getInt("movie_ID"));
        userMovieFavorite.setUserId(resultSet.getInt("user_ID"));
        userMovieFavorite.setId(resultSet.getInt("user_movie_favorite_ID"));
    return userMovieFavorite;
    }

    public void AddMovieIdFavoriteUser(UserMovieFavorite userMovieFavorite) throws SQLException{
        int userId= userMovieFavorite.getUserId();
        int movieId = userMovieFavorite.getMovieId();
        PreparedStatement statement = null;
        try {
            connection = Connector.getConnection();
            statement = connection.prepareStatement(INSERT_MOVIE_FAVORITE_FROM_USER);
            statement.setInt(1, userId);
            statement.setInt(2,movieId);
            statement.executeQuery();
        } finally {
            Connector.close(statement);
        }
    }
}
