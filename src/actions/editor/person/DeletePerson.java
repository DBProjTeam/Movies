package actions.editor.person;

import actions.Action;
import actions.PageAction;
import constants.PagePath;
import dao.PersonDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.text.ParseException;

/**
 * Created by Vyacheslav.
 */
public class DeletePerson extends Action {

    @Override
    public PageAction execute(HttpServletRequest request, HttpServletResponse response) throws SQLException, UnsupportedEncodingException, ParseException {
        String personId = request.getParameter("personId");

        System.out.println("DeletePerson.execute: personId=" + personId);

        PersonDAO personDAO = new PersonDAO();
        personDAO.delete(Integer.parseInt(personId));
        return new PageAction(PagePath.EDITOR_SHOW_PERSONS, true);


    }
}
