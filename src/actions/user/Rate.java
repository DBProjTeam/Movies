package actions.user;

import actions.Action;
import actions.PageAction;
import dao.RatingDAO;
import entities.Rating;
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
public class Rate extends Action {

    @Override
    public PageAction execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {

        int movieID = Integer.parseInt(request.getParameter("movie_id"));
        int score = Integer.parseInt(request.getParameter("score"));

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");


        RatingDAO ratingDAO = new RatingDAO();
        Rating rating = null;
        if ((rating = ratingDAO.getRatingByMovieIDAndUserID(movieID, user.getId())) == null) {
            rating = new Rating();
            rating.setUser_ID(user.getId());
            rating.setMovie_ID(movieID);
            rating.setScore(score);
            ratingDAO.insert(rating);
        } else {
            rating.setScore(score);
            ratingDAO.update(rating);
        }

        return new PageAction("do?action=movie_page&movie_id=" + movieID, false);
    }
}
