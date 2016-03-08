package servlets;

import actions.Action;
import actions.PageAction;
import util.ActionContainer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by Vyacheslav.
 */

public class ActionController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        process(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        process(request, response);
    }

    private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String actionName = request.getParameter("action");
        Action action = ActionContainer.getAction(actionName);
        try {
            PageAction pageAction = action.execute(request,response);
            if (pageAction.isForward()) {
                request.getRequestDispatcher(pageAction.getPage()).forward(request,response);
            } else {
                response.sendRedirect(pageAction.getPage());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
