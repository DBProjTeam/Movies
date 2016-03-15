package actions.profile;

import actions.Action;
import actions.PageAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;

/**
 * Created by Vyacheslav.
 */
public class Logout extends Action {

    @Override
    public PageAction execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        HttpSession session = request.getSession();
        if (session != null) {
            session.removeAttribute("user");
        }
        return new PageAction("do?action=index", false);
    }
}
