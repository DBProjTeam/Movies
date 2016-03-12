package actions;

import dao.PersonDAO;
import entities.Person;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by Станислав on 12.03.16.
 */
public class SearchPerson extends Action{
    private static String MESSAGES_BY_NOT_FOUND="По данному запросу ничего не найдено!";
    @Override
    public PageAction execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String words =request.getParameter("searchPersonWordsByName");
        PersonDAO personDAO = new PersonDAO();
        List<Person>persons= personDAO.searchPersonByNameAndSurname(words);

        if(persons.isEmpty()){
            request.setAttribute("massagesByNotFound",MESSAGES_BY_NOT_FOUND);
        }
        request.setAttribute("searPearson",persons);
        return new PageAction("",true); // здесь вставить ссылку на страницу поиска!!!!!;
    }
}
