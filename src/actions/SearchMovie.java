package actions;

import dao.MovieDAO;
import entities.Movie;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by Станислав on 12.03.16.
 */
public class SearchMovie extends Action {
    //private  static int LIMIT_MOVIE_SEARCH=20; ограничения на вывод?
    private static String MESSAGES_BY_NOT_FOUND="По данному запросу ничего не найдено!";

    @Override
    public PageAction execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String wordByTitle=request.getParameter("searchWordByTitle");
        List<Movie> movies =searchByTitle(wordByTitle);
        if (movies.isEmpty()){
            request.setAttribute("massagesByNotFound",MESSAGES_BY_NOT_FOUND);
        }
        request.setAttribute("searchMovie",movies);
        return new PageAction("",true); // здесь вставить ссылку на страницу поиска!!!!!;
    }

    private List<Movie> searchByTitle(String word) throws SQLException {
        MovieDAO movieDAO = new MovieDAO();
        List<Movie>movies=movieDAO.searchByTitle(word);
        return movies;
    }
}
