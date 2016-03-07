package dao;

import entities.Studio;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by ${Pavel} on 07.03.2016.
 */
public class MovieStudioDAO {
    private static final String GET_STUDIO_BY_MOVIE_ID = "SELECT studio_ID FROM movie_studio WHERE (movie_ID=?)";
    private static final String GET_ALL_MOVIES_BY_STUDIO_ID = "SELECT movie_ID FROM movie_studio WHERE (studio_ID=?)";
    Connection connection;
    StudioDAO std;

    public Studio getStudioByMovieId(int id) throws SQLException {
        std=new StudioDAO();
        return std.getById(id);
    }
    /*When there will be Movie then I will implement this method*/
    //public List<Movie> getAllMovies(int id){}
}