package actions.search;

import actions.Action;
import actions.PageAction;
import constants.PagePath;
import dao.MovieDAO;
import dao.PersonDAO;
import entities.Movie;
import entities.Person;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by Станислав on 12.03.16.
 */
public class Search extends Action {

    private static String MESSAGES_BY_NOT_FOUND="По данному запросу ничего не найдено!";

    @Override
    public PageAction execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String word = request.getParameter("word");
        List<Movie> movies =searchByTitle(word);
        PersonDAO personDAO = new PersonDAO();
        List<Person>persons= personDAO.searchPersonByNameAndSurname(word);

        if (movies.isEmpty() && persons.isEmpty()){
            request.setAttribute("massagesByNotFound",MESSAGES_BY_NOT_FOUND);
        }
        request.setAttribute("searchMovie", movies);
        request.setAttribute("searchPerson",persons);
        return new PageAction(PagePath.SEARCH_RESULT, true);// здесь вставить ссылку на страницу поиска!!!!!;
    }

    private List<Movie> searchByTitle(String word) throws SQLException {
        MovieDAO movieDAO = new MovieDAO();
        List<Movie>movies=movieDAO.searchByTitle(word);
        return movies;
    }
}
