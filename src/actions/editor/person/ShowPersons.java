package actions.editor.person;

import actions.Action;
import actions.PageAction;
import constants.PagePath;
import dao.PersonDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;

/**
 * Created by Vyacheslav.
 */
public class ShowPersons extends Action {

    @Override
    public PageAction execute(HttpServletRequest request, HttpServletResponse response) throws SQLException, UnsupportedEncodingException {
        PersonDAO personDAO = new PersonDAO();
        request.setAttribute("persons", personDAO.getAll());
        return new PageAction(PagePath.EDITOR_SHOW_PERSONS, true);
    }
}
