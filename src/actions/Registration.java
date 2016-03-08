package actions;

import constants.PagePath;
import dao.UserDAO;
import entities.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;

/**
 * Created by Vyacheslav.
 */
public class Registration extends Action {
    @Override
    public PageAction execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {

        String login = request.getParameter("login");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");

        UserDAO userDAO = new UserDAO();

        if (userDAO.getByLogin(login) != null) {
            request.setAttribute("error", "Пользователь уже существует");
            System.out.println("Error");
        } else {

            User user = new User();

            user.setLogin(login);
            user.setPassword(password);
            user.setName(name);
            user.setSurname(surname);
            user.setRole(User.UserRole.USER);
            user.setImageId(1); //default avatar for user
            UserDAO dao = new UserDAO();
            dao.insert(user);
            return new PageAction("do?action=registration_done", false);
        }
        return new PageAction(PagePath.REGISTRATION, true);
    }
}
