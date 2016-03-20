package actions.user;

import actions.Action;
import actions.PageAction;
import constants.PagePath;
import dao.UserMovieFavoriteDAO;
import entities.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;

/**
 * Created by Vyacheslav.
 */
public class ViewFavoriteMovies extends Action {

    @Override
    public PageAction execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {

        UserMovieFavoriteDAO favoriteDAO = new UserMovieFavoriteDAO();
        User user = (User) request.getSession().getAttribute("user");
        request.setAttribute("movies", favoriteDAO.getFavoriteMovies(user.getId()));
        return new PageAction(PagePath.FAVORITE_MOVIES, true);
    }
}
