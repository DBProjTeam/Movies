package actions.editor.country;

import actions.Action;
import actions.PageAction;
import constants.PagePath;
import dao.CountryDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;

/**
 * Created by Vyacheslav.
 */
public class AddCountry extends Action {

    @Override
    public PageAction execute(HttpServletRequest request, HttpServletResponse response) throws SQLException, UnsupportedEncodingException {
        String countryString = request.getParameter("country");
        System.out.println("AddCountry.execute: country=" + countryString);
        CountryDAO countryDAO = new CountryDAO();
        countryDAO.insert(countryString);
        return new PageAction(PagePath.EDITOR_SHOW_PERSONS, true);
    }
}
