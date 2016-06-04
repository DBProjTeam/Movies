package actions.search;

import actions.Action;
import actions.PageAction;
import constants.PagePath;
import dao.PersonDAO;
import entities.Person;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

/**
 * Created by Pavel on 02.06.2016.
 */
public class PSearch extends Action {
    @Override
    public PageAction execute(HttpServletRequest request, HttpServletResponse response) throws SQLException, UnsupportedEncodingException, ParseException {
        String role = request.getParameter("role");
        String name = request.getParameter("name");
        role = checkParam(role);
        System.out.println("PSearch.execute: search with role= " + role + " name=" + name);
        List<Person> persons = searchPersonsNameOrSurname(name, role);
        request.setAttribute("persons", persons);
        request.setAttribute("word", name);
        if (!persons.isEmpty()) {
            request.setAttribute("person", false);
            request.setAttribute("movie", true);
        } else {
            request.setAttribute("person", true);
        }
        return new PageAction(PagePath.SEARCH_RESULT, true);
    }

    private String checkParam(String role) {
        if ("Пусто".compareTo(role) == 0) {
            return "";
        }
        return role;
    }

    private List<Person> searchPersonsNameOrSurname(String name, String role) throws SQLException {
        PersonDAO dao = new PersonDAO();

        return dao.searchPersonByNameAndSurname(name, role);
    }
}
