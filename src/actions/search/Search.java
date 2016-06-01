package actions.search;

import actions.Action;
import actions.PageAction;
import constants.PagePath;
import dao.MovieDAO;
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

    private static String MESSAGES_BY_NOT_FOUND = "По данному запросу ничего не найдено!";

    static private StringBuilder staticSb = new StringBuilder();

    @Override
    public PageAction execute(HttpServletRequest request, HttpServletResponse response) throws SQLException, UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        String word = request.getParameter("title");

        String country = checkParam(request.getParameter("country"));
        String genre = checkParam(request.getParameter("genre"));
        String studio = checkParam(request.getParameter("studio"));

        //Log to show params
        staticSb.delete(0, staticSb.length());//clear buffer
        System.out.println(staticSb.append("searchAction.execute: title").append(word).append(" country:=").append(country).append(" genre:=").append(genre).append(" studio:=").append(studio).toString());
        ///////////////-------------------------------///////////////
        if (!FieldValidator.isMovieTitleValid(word)) {
            request.setAttribute("error", "error.search.word.specified");//todo не работает как надо
        } else {
            List<Movie> movies = searchByTitle(word);
            if (movies.isEmpty()) {
                request.setAttribute("error", MESSAGES_BY_NOT_FOUND);
            }
            request.setAttribute("word", word);
            request.setAttribute("searchMovie", movies);
            return new PageAction(PagePath.SEARCH_RESULT, true);// здесь вставить ссылку на страницу поиска!!!!!;
        }
        return new PageAction(PagePath.ERROR_PAGE, true);
    }

    private String checkParam(String country) {
        if ("Пусто".compareTo(country) == 0) {
            country = null;
        }
        return country;
    }

    private List<Movie> searchByTitle(String word) throws SQLException {
        MovieDAO movieDAO = new MovieDAO();
        List<Movie> movies = movieDAO.searchByTitle(word);
        return movies;
    }
}
