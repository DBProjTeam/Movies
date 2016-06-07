package actions;

import constants.PagePath;
import dao.PersonDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.text.ParseException;

/**
 * Created by Pavel on 05.06.2016.
 */
public class ShowPanel extends Action {
    @Override
    public PageAction execute(HttpServletRequest request, HttpServletResponse response) throws SQLException, UnsupportedEncodingException, ParseException {
        PersonDAO personDAO = new PersonDAO();
        request.setAttribute("persons", personDAO.getAll());
        return new PageAction(PagePath.EDITOR_SHOW_PERSONS, true);
    }
}
