package actions.user;

import actions.Action;
import actions.PageAction;
import dao.MovieDAO;
import dao.UserMovieFavoriteDAO;
import entities.Movie;
import entities.UserMovieFavorite;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;

/**
 * Created by Станислав on 16.03.16.
 */
public class UserMovieFavoriteActions extends Action {

    @Override
    public PageAction execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        int user_id = Integer.parseInt(request.getParameter("user_id"));
        UserMovieFavoriteDAO movieFavoriteDAO = new UserMovieFavoriteDAO();
        List<UserMovieFavorite> movieFavoriteList = movieFavoriteDAO.getMovieIdFavoriteUser(user_id);
        List<Movie> movies = getMovieFavorite(movieFavoriteList);

        request.setAttribute("movieFavorite",movies);
        return new PageAction("",true);// здесь вставить ссылку на страницу!!!!!;
    }

    private List<Movie> getMovieFavorite(List<UserMovieFavorite> listMovie)throws SQLException{
        MovieDAO movieDAO = new MovieDAO();
        ListIterator<UserMovieFavorite> iterator = listMovie.listIterator();
        List<Movie> movies = new ArrayList<Movie>();
        while (iterator.hasNext()) {
            int movie_id = iterator.next().getMovieId();
            movies.add(movieDAO.getByPK(movie_id));
        }
        return movies;
    }

}
