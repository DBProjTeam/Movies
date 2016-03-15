package actions;

import constants.PagePath;
import dao.UserDAO;
import entities.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;

/**
 * Created by Vyacheslav.
 */
public class LoginAction extends Action {
    @Override
    public PageAction execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String login = request.getParameter("login");
        String password = request.getParameter("password");

        UserDAO userDAO = new UserDAO();
        User user = userDAO.getByLogin(login);
        if (user == null || !user.getPassword().equals(password)) {
            request.setAttribute("error", "Неправильный логин или пароль");
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            return new PageAction("do?action=index", false);
        }
        return new PageAction(PagePath.LOGIN, true);
    }
}
