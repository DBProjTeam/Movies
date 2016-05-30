package actions.profile;

import actions.Action;
import actions.PageAction;
import constants.PagePath;
import dao.UserDAO;
import entities.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;

/**
 * Created by Pavel on 29.05.2016.
 */
public class AddRating extends Action {

    @Override
    public PageAction execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        int movieID = Integer.parseInt(request.getParameter("movie_id"));
        int value = Integer.parseInt(request.getParameter("rang"));
        String login = request.getParameter("login");
        UserDAO userDAO = new UserDAO();
        User user = userDAO.getByLogin(login);
        if (user == null) {
            request.setAttribute("error", "Неправильный логин или пароль");
        } else {

        }
        return new PageAction(PagePath.LOGIN, true);
    }
}
