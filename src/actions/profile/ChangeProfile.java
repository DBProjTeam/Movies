package actions.profile;

import actions.Action;
import actions.PageAction;
import dao.UserDAO;
import entities.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;

/**
 * Created by Vyacheslav.
 * @author Vyacheslav
 */
public class ChangeProfile extends Action {
    @Override
    public PageAction execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {

        String name = request.getParameter("name");
        String surname = request.getParameter("surname");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        user.setName(name);
        user.setSurname(surname);

        UserDAO userDAO = new UserDAO();
        userDAO.update(user);
        return new PageAction("do?action=profile_page", false);
    }
}
