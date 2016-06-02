package dao;


import entities.Genre;
import util.Connector;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Станислав on 02.05.16.
 */
public class GenreDAO {
    private static final String GET_ALL_GENRE = "SELECT * FROM `genre`";
    private static final String GET_MOVIE_GENRES = "SELECT genre FROM movie_genre INNER JOIN movie ON movie.movie_ID = movie_genre.movie_ID\n" +
            " WHERE movie.movie_ID=?";
    Connection connection;

    public List<Genre> getAllGenre() throws SQLException {
        List<Genre> list = new ArrayList<Genre>();
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            connection = Connector.getConnection();
            statement = connection.createStatement();
            resultSet = statement.executeQuery(GET_ALL_GENRE);
            while (resultSet.next()) {
                list.add(obtain(resultSet));
            }
        } finally {
            Connector.close(resultSet);
            Connector.close(statement);
        }
        return list;
    }

    private Genre obtain(ResultSet resultSet) throws SQLException {
        Genre genre = new Genre();
        genre.setGenre(resultSet.getString("genre"));
        return genre;
    }

    public List<Genre> getMovieGenres(int movie_id) throws SQLException {
        List<Genre> list = new ArrayList<Genre>();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = Connector.getConnection();
            statement = connection.prepareStatement(GET_MOVIE_GENRES);
            statement.setInt(1, movie_id);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                list.add(obtain(resultSet));
            }
        } finally {
            Connector.close(statement);
            Connector.close(resultSet);
        }

        return list;
    }
}
