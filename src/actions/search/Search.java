package actions.search;

import actions.Action;
import actions.MovieAction;
import actions.PageAction;
import bean.MovieImages;
import bean.MoviePersonRoleView;
import constants.PagePath;
import constants.PersonRoles;
import dao.ImageDAO;
import dao.MovieDAO;
import dao.view.MoviePersonRoleDAO;
import entities.Country;
import entities.Image;
import entities.Movie;
import util.FieldValidator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Станислав on 12.03.16.
 */
public class Search extends Action {

    private static String MESSAGES_BY_NOT_FOUND = "По данному запросу ничего не найдено!";

    static private StringBuilder staticSb = new StringBuilder();

    public static String checkParam(String country) {
        if ("Пусто".compareTo(country) == 0) {
            country = null;
        }
        return country;
    }

    @Override
    public PageAction execute(HttpServletRequest request, HttpServletResponse response) throws SQLException, UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        String word = request.getParameter("title");

        String country = checkParam(request.getParameter("country"));
        String genre = checkParam(request.getParameter("genre"));
        String studio = checkParam(request.getParameter("studio"));

        int from = Integer.parseInt(request.getParameter("from"));
        int to = Integer.parseInt(request.getParameter("to"));

        //Log to show params
        staticSb.delete(0, staticSb.length());//clear buffer
        System.out.println(staticSb.append("searchAction.execute: title:= ").append(word).append(" country:= ").append(country).append(" genre:= ").append(genre).append(" studio:= ").append(studio).append(" from:=").append(from).append(" to:=").append(to).toString());
        ///////////////-------------------------------///////////////
        if (!FieldValidator.isMovieTitleValid(word)) {
            request.setAttribute("error", "error.search.word.specified");// не работает как надо
        } else {
            List<Movie> movies = searchByTitle(word, country, genre, studio, from, to);


            List<MovieImages> listmovieImages = new ArrayList<MovieImages>();
            for (Movie movie : movies) {
                MovieImages movieImages = new MovieImages(movie, getImage(movie.getImageId()), getCountry(movie.getMovieId()), getDirectorOfFilm(movie.getMovieId()));
                listmovieImages.add(movieImages);
            }
            request.setAttribute("movie", false);
            request.setAttribute("person", true);
            request.setAttribute("word", word);
            request.setAttribute("searchMovie", listmovieImages);
            return new PageAction(PagePath.SEARCH_RESULT, true);
        }

        return new PageAction(PagePath.SEARCH_RESULT, true);
    }

    private MoviePersonRoleView getDirectorOfFilm(int movieId) throws SQLException {
        MoviePersonRoleDAO moviePersonRoleDAO = new MoviePersonRoleDAO();
        List<MoviePersonRoleView> persons = moviePersonRoleDAO.getPersonRoleByMovieId(movieId);
        if (!persons.isEmpty()) {
            List<MoviePersonRoleView> directors = MovieAction.getRole(persons, PersonRoles.DIRECTOR.getName());
            if (!directors.isEmpty()) {
                return directors.get(0);
            } else {
                return new MoviePersonRoleView();
            }
        } else {
            return new MoviePersonRoleView();
        }
    }

    private Country getCountry(int movieId) throws SQLException {
        return (new MovieDAO().getCountry(movieId)).getCountry();

    }

    private Image getImage(int movieId) throws SQLException {
        ImageDAO imageDAO = new ImageDAO();
        return imageDAO.getImageById(movieId);
    }

    private List<Image> getImages(int movieId) throws SQLException {
        ImageDAO imageDAO = new ImageDAO();
        List<Image> images = imageDAO.getAllImagesByMovieId(movieId);
        return images;
    }

    private List<Movie> searchByTitle(String word, String country, String genre, String studio, int from, int to) throws SQLException {
        MovieDAO movieDAO = new MovieDAO();
        List<Movie> movies = movieDAO.searchByTitle(word, country, genre, studio, from, to);
        return movies;
    }
}
