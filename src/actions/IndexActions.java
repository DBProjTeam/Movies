package actions;

import bean.MovieImages;
import bean.MoviePersonRoleView;
import constants.PagePath;
import constants.PersonRoles;
import dao.ImageDAO;
import dao.MovieDAO;
import dao.view.MoviePersonRoleDAO;
import entities.Image;
import entities.Movie;
import entities.MovieCountry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class IndexActions extends Action {

    @Override
    public PageAction execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        MovieDAO movieDAO = new MovieDAO();
        MoviePersonRoleDAO personMRDAO = new MoviePersonRoleDAO();
        ImageDAO imageDAO = new ImageDAO();
        Movie movie = movieDAO.getRecent();
        List<MoviePersonRoleView> director = personMRDAO.getPersonByMovieId(movie.getMovieId(), PersonRoles.DIRECTOR);
        MovieCountry country = movieDAO.getCountry(movie.getMovieId());
        Image mainImage = imageDAO.getImageById(movie.getMovieId());
        List<Image> images = imageDAO.getAllImagesByMovieId(movie.getMovieId());
        MovieImages movieImages = new MovieImages(movie, mainImage, images, country.getCountry(), director.get(0));
        List<Movie> moviesPop = movieDAO.getPopularMovies();
        List<MovieImages> movieImagesesPop = new ArrayList<MovieImages>();
        for (Movie moviepop : moviesPop) {
            Image iamgePop = imageDAO.getImageById(moviepop.getImageId());
            movieImagesesPop.add(new MovieImages(movie, iamgePop));
        }
        request.setAttribute("popular_movies", movieImagesesPop);
        request.setAttribute("movie", movieImages);
        return new PageAction(PagePath.INDEX, true);
    }
}
