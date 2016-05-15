package actions.editor.person;

import actions.Action;
import actions.PageAction;
import constants.PagePath;
import dao.PersonDAO;
import entities.Person;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 * Created by Vyacheslav.
 */
public class UpdatePerson extends Action {

    @Override
    public PageAction execute(HttpServletRequest request, HttpServletResponse response) throws SQLException, UnsupportedEncodingException, ParseException {
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String birthDate = request.getParameter("birthDate");
        String deathDate = request.getParameter("deathDate");
        String country = request.getParameter("country");
        String imageId = request.getParameter("imageId");

        System.out.println("UpdatePerson.execute: " +
                "name=" + name +
                "surname=" + surname +
                "birthDate=" + birthDate +
                "deathDate=" + deathDate +
                "country" + country +
                "imageId" + imageId);
        Person person = new Person();
        DateFormat format = new SimpleDateFormat("dd.MM.yyyy");
        person.setName(name);
        person.setSurname(surname);
        person.setBirth_date(format.parse(birthDate));
        if(deathDate!=null && !deathDate.isEmpty()) {
            person.setDeath_date(format.parse(deathDate));
        }
        person.setCountry(country);
        if(imageId!=null && !imageId.isEmpty()) {
            person.setImageId(Integer.parseInt(imageId));
        }
        PersonDAO personDAO = new PersonDAO();
        personDAO.update(person);

        return new PageAction(PagePath.EDITOR_SHOW_PERSONS, true);
    }
}
