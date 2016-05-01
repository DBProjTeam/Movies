package actions;

import dao.UserMovieFavoriteDAO;
import entities.User;
import entities.UserMovieFavorite;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;

/**
 * Created by Станислав on 16.03.16.
 */
public class DeleteMovieFromFavoriteUser extends Action {

    @Override
    public PageAction execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        HttpSession session=request.getSession();
        User user = (User) session.getAttribute("user");
        if (user!=null){
            UserMovieFavoriteDAO userMovieFavoriteDAO = new UserMovieFavoriteDAO();
            UserMovieFavorite userMovieFavorite = new UserMovieFavorite();
            userMovieFavorite.setUserId(user.getId());
            userMovieFavorite.setMovieId(Integer.parseInt(request.getParameter("movieFavoriteId")));
            userMovieFavoriteDAO.deleteMovieIdFavoriteUser(userMovieFavorite);
        }
        return new PageAction("",false);// здесь вставить ссылку обрат.
    }
}
