package servlets;

import constants.PagePath;
import entities.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

/**
 * Created by Vyacheslav.
 */
@WebFilter(filterName = "ActionAccessFilter")
public class ActionAccessFilter implements Filter {

    /**
     * Map contains user role as key and list of actions as value
     */
    private Map<User.UserRole, List<String>> accessMap = new HashMap<User.UserRole, List<String>>();
    /**
     * List of actions which are available to every registered user
     */
    private List<String> commonActions = new ArrayList<String>();
    /**
     * List of actions which are available to every user
     */
    private List<String> outOfControlActions = new ArrayList<String>();

    public ActionAccessFilter() {
    }

    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        if (isAccessAllowed(request)) {
            chain.doFilter(request, response);
        } else {
            request.getRequestDispatcher(PagePath.ERROR_PAGE).forward(request, response);
        }
    }
    /**
     * Checks if user can access action
     * @param request
     * @return true if user can access action, false otherwise
     */
    private boolean isAccessAllowed(ServletRequest request) {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        String actionName = request.getParameter("action");
        if (actionName == null || actionName.isEmpty()) {
            return false;
        }
        if (outOfControlActions.contains(actionName)) {
            return true;
        }
        HttpSession session = httpRequest.getSession(false);
        if (session == null) {
            return false;
        }
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return false;
        }

        if (user.getRole().equals(User.UserRole.ADMIN)) {
            return accessMap.get(User.UserRole.ADMIN).contains(actionName)
                    || accessMap.get(User.UserRole.EDITOR).contains(actionName) || commonActions.contains(actionName);
        } else {
            return accessMap.get(user.getRole()).contains(actionName) || commonActions.contains(actionName);
        }

    }

    public void init(FilterConfig fConfig) throws ServletException {
        accessMap.put(User.UserRole.ADMIN, asList(fConfig.getInitParameter("admin")));
        accessMap.put(User.UserRole.EDITOR, asList(fConfig.getInitParameter("editor")));
        accessMap.put(User.UserRole.USER, asList(fConfig.getInitParameter("user")));
        commonActions = asList(fConfig.getInitParameter("common"));
        outOfControlActions = asList(fConfig.getInitParameter("outOfControl"));
    }
    /**
     * Extracts list of action names from init parameter
     * @param str
     * @return
     */
    private List<String> asList(String str) {
        List<String> list = new ArrayList<String>();
        StringTokenizer st = new StringTokenizer(str);
        while (st.hasMoreTokens()) {
            list.add(st.nextToken());
        }
        return list;
    }
}