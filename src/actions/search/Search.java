package actions.search;

import actions.Action;
import actions.PageAction;
import constants.PagePath;
import dao.MovieDAO;
import dao.PersonDAO;
import entities.Movie;
import util.FieldValidator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by Станислав on 12.03.16.
 */
public class Search extends Action {

    private static String MESSAGES_BY_NOT_FOUND="По данному запросу ничего не найдено!";

    @Override
    public PageAction execute(HttpServletRequest request, HttpServletResponse response) throws SQLException, UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        String word = request.getParameter("title");

        if (!FieldValidator.isMovieTitleValid(word)) {
            request.setAttribute("error", "error.search.word.specified");
        } else {
            List<Movie> movies = searchByTitle(word);
            PersonDAO personDAO = new PersonDAO();
            if (movies.isEmpty()) {
                request.setAttribute("error", MESSAGES_BY_NOT_FOUND);
            }
            request.setAttribute("searchMovie", movies);
            return new PageAction(PagePath.SEARCH_RESULT, true);// здесь вставить ссылку на страницу поиска!!!!!;
        }
        return new PageAction(PagePath.ERROR_PAGE, true);
    }

    private List<Movie> searchByTitle(String word) throws SQLException {
        MovieDAO movieDAO = new MovieDAO();
        List<Movie>movies=movieDAO.searchByTitle(word);
        return movies;
    }
}
