package servlets;

import actions.Action;
import actions.PageAction;
import util.ActionContainer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;

/**
 * Created by Vyacheslav.
 */

public class ActionController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        try {
            process(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        try {
            process(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }

    private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ParseException {
        String actionName = request.getParameter("action");
        HttpSession session = request.getSession();
        System.out.println("ActionController.process : request received '" + actionName + "'");
        Action action = ActionContainer.getAction(actionName);
        if (!actionName.contentEquals("login")) {
            session.setAttribute("last_url", request.getRequestURL() + "?" + request.getQueryString());
        }
        PageAction pageAction = action.execute(request, response);
        response.setContentType("text/html;charset=UTF-8");
        if (pageAction.isForward()) {
            request.getRequestDispatcher(pageAction.getPage()).forward(request, response);
        } else {
            response.sendRedirect(pageAction.getPage());
        }

    }
}
