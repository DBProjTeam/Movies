package actions.editor.movie;

import actions.Action;
import actions.PageAction;
import bean.MovieImages;
import constants.PagePath;
import dao.MovieDAO;
import entities.Movie;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Pavel on 07.06.2016.
 */
public class ShowMovie extends Action {

    @Override
    public PageAction execute(HttpServletRequest request, HttpServletResponse response) throws SQLException, UnsupportedEncodingException, ParseException {
        MovieDAO movieDAO = new MovieDAO();
        List<Movie> movieList = movieDAO.getAllMovie();
        List<MovieImages> movieImageses = new ArrayList<MovieImages>();
        for (Movie movie : movieList) {
            movieImageses.add(new MovieImages(movie, movieDAO.getCountry(movie.getMovieId())));
        }
        request.setAttribute("movies", movieImageses);

        return new PageAction(PagePath.EDITOR_PANEL, true);
    }
}
