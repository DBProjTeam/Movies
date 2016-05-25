package actions.search;

import actions.Action;
import actions.PageAction;
import dao.CountryDAO;
import dao.GenreDAO;
import dao.RoleDAO;
import dao.StudioDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;

/**
 * Created by Станислав on 02.05.16.
 */
public class DetailSearchPage extends Action {
    @Override
    public PageAction execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        RoleDAO roleDAO = new RoleDAO();
        StudioDAO studioDAO = new StudioDAO();
        CountryDAO countryDAO = new CountryDAO();
        GenreDAO genreDAO = new GenreDAO();

        request.setAttribute("roles",roleDAO.getAllRole());
        request.setAttribute("studios",studioDAO.getAll());
        request.setAttribute("country",countryDAO.getAllCountry());
        request.setAttribute("genres",genreDAO.getAllGenre());

        return null;// Страница
    }
}
