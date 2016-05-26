package actions;

import bean.MoviePersonRoleView;
import constants.PagePath;
import constants.PersonRoles;
import dao.MovieDAO;
import dao.view.MoviePersonRoleDAO;
import entities.Movie;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;


public class IndexActions extends Action {

    @Override
    public PageAction execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        MovieDAO movieDAO = new MovieDAO();
        MoviePersonRoleDAO personMRDAO = new MoviePersonRoleDAO();

        Movie movie = movieDAO.getRecent();

        List<MoviePersonRoleView> director = personMRDAO.getPersonByMovieId(movie.getMovieId(), PersonRoles.DIRECTOR);
        List<MoviePersonRoleView> oper = personMRDAO.getPersonByMovieId(movie.getMovieId(), PersonRoles.OPERATOR);
        List<MoviePersonRoleView> composer = personMRDAO.getPersonByMovieId(movie.getMovieId(), PersonRoles.SCENARIO);
        request.setAttribute("popular_movies", movieDAO.getPopularMovies());
        request.setAttribute("country", movieDAO.getCountry(movie.getMovieId()));
        request.setAttribute("movie", movie);
        request.setAttribute("director", director);
        request.setAttribute("oper", oper);
        request.setAttribute("composer", composer);
        return new PageAction(PagePath.INDEX, true);
    }
}
