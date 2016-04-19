package actions;

import bean.MoviePersonRoleView;
import constants.PagePath;
import dao.MovieDAO;
import dao.view.MoviePersonRoleDAO;
import entities.Movie;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;

/**
 * Created by Алексей on 18.04.2016.
 */
public class IndexActions extends Action {

    @Override
    public PageAction execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        MovieDAO movieDAO = new MovieDAO();
        MoviePersonRoleDAO personMRDAO = new MoviePersonRoleDAO();

        Movie movie = movieDAO.getRecent();

        MoviePersonRoleView director = personMRDAO.getPersonByMovieId(movie.getMovie_id(), "DIRECTOR");
        MoviePersonRoleView oper = personMRDAO.getPersonByMovieId(movie.getMovie_id(), " operator");
        MoviePersonRoleView composer = personMRDAO.getPersonByMovieId(movie.getMovie_id(), "composer");

        request.setAttribute("popular_movies", movieDAO.getPopularMovies());
        request.setAttribute("country", movieDAO.getCountry(movie.getMovie_id()));
        request.setAttribute("movie", movie);
        request.setAttribute("director", director);
        request.setAttribute("oper", oper);
        request.setAttribute("composer", composer);
        return new PageAction(PagePath.INDEX, true);
    }
}
