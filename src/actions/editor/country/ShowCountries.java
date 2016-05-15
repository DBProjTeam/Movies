package actions.editor.country;

import actions.Action;
import actions.PageAction;
import constants.PagePath;
import dao.CountryDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;

public class ShowCountries extends Action {

    @Override
    public PageAction execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        CountryDAO countryDAO = new CountryDAO();
        request.setAttribute("countries", countryDAO.getAllCountry());
        return new PageAction(PagePath.EDITOR_SHOW_COUNTRIES, true);
    }
}
