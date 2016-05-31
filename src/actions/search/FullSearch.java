package actions.search;

import actions.Action;
import actions.PageAction;
import constants.PagePath;
import dao.*;
import entities.Country;
import entities.Genre;
import entities.Role;
import entities.Studio;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by Pavel on 31.05.2016.
 */
public class FullSearch extends Action {
    @Override
    public PageAction execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        CountryDAO countryDAO = new CountryDAO();
        GenreDAO genreDAO = new GenreDAO();
        StudioDAO studioDAO = new StudioDAO();
        MovieDAO movieDAO = new MovieDAO();
        RoleDAO roleDAO = new RoleDAO();
        List<Country> countries = countryDAO.getAllCountry();
        List<Genre> genres = genreDAO.getAllGenre();
        List<Studio> studios = studioDAO.getAllStudio();
        List<Role> roles = roleDAO.getAllRole();
        int[] minmaxYear = movieDAO.getMinMaxYear();
        int minYear = minmaxYear[0];
        int maxYear = minmaxYear[1];
        request.setAttribute("countries", countries);
        request.setAttribute("genres", genres);
        request.setAttribute("studios", studios);
        request.setAttribute("max_year", maxYear);
        request.setAttribute("min_year", minYear);
        request.setAttribute("roles", roles);

        return new PageAction(PagePath.FULL_SEARCH, true);

    }
}
