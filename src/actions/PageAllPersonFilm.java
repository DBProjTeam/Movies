package actions;

import bean.MoviePersonRoleView;
import constants.PagePath;
import dao.PersonDAO;
import dao.view.MoviePersonRoleDAO;
import entities.MoviePersonRole;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

/**
 * Created by Станислав on 15.05.16.
 */
public class PageAllPersonFilm extends Action {

    @Override
    public PageAction execute(HttpServletRequest request, HttpServletResponse response) throws SQLException, UnsupportedEncodingException, ParseException {
        int movie_id=Integer.parseInt(request.getParameter("movie_id"));
        PersonDAO personDAO = new PersonDAO();
        MoviePersonRoleDAO moviePersonRoleDAO = new MoviePersonRoleDAO();
        List<MoviePersonRoleView> list=moviePersonRoleDAO.getPersonRoleByMovieId(movie_id);
        request.setAttribute("listPerson",list);
        return new PageAction(PagePath.ALL_PERSONS_ON_FILM,true);
    }
}
