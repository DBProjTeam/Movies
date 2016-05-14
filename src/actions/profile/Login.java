package actions.profile;

import actions.Action;
import actions.PageAction;
import constants.PagePath;
import dao.UserDAO;
import entities.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;

/**
 * Created by Vyacheslav.
 *
 * @author Vyacheslav
 */
public class Login extends Action {

    @Override
    public PageAction execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {

        String login = request.getParameter("login");
        String password = request.getParameter("password");
        System.out.println("Login.execute: login=" + login + ", password=" + password);
        UserDAO userDAO = new UserDAO();
        User user = userDAO.getByLogin(login);

        if (user == null || !user.getPassword().equals(password)) {
            request.setAttribute("error", "Неправильный логин или пароль");
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            System.out.println("Login.execute: user login=" + login + " logged");
            return new PageAction("do?action=index", false);
        }
        return new PageAction(PagePath.LOGIN, true);
    }
}
