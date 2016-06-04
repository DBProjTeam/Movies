package dao;

import entities.Country;
import entities.Movie;
import entities.MovieCountry;
import util.Connector;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MovieDAO {

    public static final String GET_POPULAR_MOVIES = "select * from movie \n" +
            "\twhere movie_ID in\n" +
            "\t\t(select id from \n" +
            "\t\t\t(select sum(score) as 'avarage', movie_ID as 'id' from rating \n" +
            "\t\t\t\t\t group by movie_ID order by avarage desc ) \n" +
            "\t\t\t as t2 where avarage > 22)  ";
    private static final String GET_RECENT_MOVIE = "select * FROM movie where movie.year=Year(now()) order by movie.releaseDate  desc limit 1 ; ";
    private static final String GET_COUNTRY_MOVIE = "SELECT * FROM movie_country where movie_ID=?;";
    private static final String GET_MOVIE_BY_ID = "SELECT * FROM movie WHERE movie.movie_ID=?;";
    private static final String GET_MOVIE_BY_YEAR = "SELECT * FROM movie WHERE movie.year=?;";
    private static final String GET_MOVIE_ALL = "SELECT * FROM movie;";
    private static final String SEARCH_BY_TITLE = "CALL findMovie(?,?,?,?,?,?)";
    private static final String INSERT_MOVIE = "INSERT INTO movie (runtime,releaseDate,year,description,image_ID,title,country) VALUES( ?, ?, ?, ?, ?, ?,?);";
    private static final String UPDATE_MOVIE = "UPDATE movie SET runtime=?, releaseDate=?,year=?,description=?, image_ID=?, title=?, country=? WHERE movie_ID=?;";
    private static final String DELETE_MOVIE = "DELETE FROM movie WHERE movie_ID =?;";
    private static final String GET_MIN_MAX_YEAR = "SELECT MIN(YEAR) AS 'min',MAX(YEAR)AS 'max' FROM movie";

    Connection connection;

    public List<Movie> getPopularMovies() throws SQLException {
        Statement statement = null;
        ResultSet resultSet = null;
        List<Movie> movies = new ArrayList<Movie>();
        try {
            connection = Connector.getConnection();
            statement = connection.createStatement();
            resultSet = statement.executeQuery(GET_POPULAR_MOVIES);
            while (resultSet.next()) {
                movies.add(obtain(resultSet));
            }
        } finally {
            Connector.close(statement);
            Connector.close(resultSet);
        }
        return movies;
    }

    public Movie getRecent() throws SQLException {
        Movie movie = null;
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            connection = Connector.getConnection();
            statement = connection.createStatement();
            resultSet = statement.executeQuery(GET_RECENT_MOVIE);
            while (resultSet.next()) {
                movie = obtain(resultSet);
            }
        } finally {
            Connector.close(statement);
            Connector.close(resultSet);
        }
        return movie;
    }

    public MovieCountry getCountry(int movie_id) throws SQLException {
        MovieCountry movieCountry = new MovieCountry();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = Connector.getConnection();
            statement = connection.prepareStatement(GET_COUNTRY_MOVIE);
            statement.setInt(1, movie_id);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                movieCountry = obtainCountry(resultSet);
            }
        } finally {
            Connector.close(statement);
            Connector.close(resultSet);
        }
        return movieCountry;
    }

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

    public List<Movie> searchByTitle(String word, String country, String genre, String studio, int from, int to) throws SQLException {
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        List<Movie> movies = new ArrayList<Movie>();
        try {
            connection = Connector.getConnection();
            statement = connection.prepareStatement(SEARCH_BY_TITLE);
            statement.setString(1, word);
            statement.setString(2, country);
            statement.setString(3, genre);
            statement.setString(4, studio);
            statement.setInt(5, from);
            statement.setInt(6, to);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                movies.add(obtain(resultSet));
            }
        } finally {
            Connector.close(statement);
            Connector.close(resultSet);
        }
        return movies;
    }

    public List<Movie> getMoviesByYear(int year) throws SQLException {
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<Movie> movies = new ArrayList<Movie>();
        try {
            connection = Connector.getConnection();
            statement = connection.prepareStatement(GET_MOVIE_BY_YEAR);
            statement.setInt(1, year);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {//Исправлено
                movies.add(obtain(resultSet));
            }
        } finally {
            Connector.close(statement);
            Connector.close(resultSet);
        }
        return movies;
    }

    public List<Movie> getAllMovie() throws SQLException {
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<Movie> movies = new ArrayList<Movie>();
        try {
            connection = Connector.getConnection();
            resultSet = statement.executeQuery(GET_MOVIE_ALL);
            while (resultSet.next()) {//Исправлено
                movies.add(obtain(resultSet));
            }
        } finally {
            Connector.close(statement);
            Connector.close(resultSet);
        }
        return movies;
    }

    public boolean insert(Movie movie) throws SQLException {
        boolean isOk = false;
        PreparedStatement statement = null;
        try {
            connection = Connector.getConnection();
            statement = connection.prepareStatement(INSERT_MOVIE);
            statement.setTime(1, movie.getRuntime());
            statement.setDate(2, movie.getReleaseDate());
            statement.setInt(3, movie.getYear());
            statement.setString(4, movie.getDescription());
            statement.setInt(5, movie.getImageId());
            statement.setString(6, movie.getTitle());
            // statement.setString(7, movie.getCountry().getCountry());
            isOk = statement.execute();
        } finally {
            Connector.close(statement);
        }
        return isOk;
    }

    public boolean update(Movie movie) throws SQLException {
        boolean isOk = false;
        PreparedStatement statement = null;
        try {
            connection = Connector.getConnection();
            statement = connection.prepareStatement(UPDATE_MOVIE);
            statement.setTime(1, movie.getRuntime());
            statement.setDate(2, movie.getReleaseDate());
            statement.setInt(3, movie.getYear());
            statement.setString(4, movie.getDescription());
            statement.setInt(5, movie.getImageId());
            statement.setString(6, movie.getTitle());
            //statement.setString(7, movie.getCountry());
            statement.setInt(7, movie.getMovieId());
            isOk = statement.execute();
        } finally {
            Connector.close(statement);
        }
        return isOk;
    }

    public boolean delete(Movie movie) throws SQLException {
        boolean isOk = false;
        PreparedStatement statement = null;
        try {
            connection = Connector.getConnection();
            statement = connection.prepareStatement(DELETE_MOVIE);
            statement.setInt(1, movie.getMovieId());
            isOk = statement.execute();
        } finally {
            Connector.close(statement);
        }
        return isOk;
    }

    public Movie obtain(ResultSet resultSet) throws SQLException {
        Movie movie = new Movie();
        movie.setMovieId(resultSet.getInt("movie_ID"));
        movie.setRuntime(resultSet.getTime("runtime"));
        movie.setDescription(resultSet.getString("description"));
        movie.setYear(resultSet.getInt("year"));
        movie.setTitle(resultSet.getString("title"));
        movie.setReleaseDate(resultSet.getDate("releaseDate"));
        movie.setImageId(resultSet.getInt("image_ID"));
        return movie;
    }

    private MovieCountry obtainCountry(ResultSet resultSet) throws SQLException {
        MovieCountry movieCountry = new MovieCountry();
        movieCountry.setMovieId(resultSet.getInt("movie_ID"));
        movieCountry.setCountry(new Country(resultSet.getString("country")));
        movieCountry.setId(resultSet.getInt("movie_country_ID"));
        return movieCountry;
    }

    public int[] getMinMaxYear() throws SQLException {
        int year[] = {2000, 2018};
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            connection = Connector.getConnection();
            statement = connection.createStatement();
            resultSet = statement.executeQuery(GET_MIN_MAX_YEAR);
            while (resultSet.next()) {
                year[0] = resultSet.getInt("min");
                year[1] = resultSet.getInt("max");
            }
        } finally {
            Connector.close(statement);
            Connector.close(resultSet);
        }
        return year;
    }
}
