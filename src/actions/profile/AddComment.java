package actions.profile;

import actions.Action;
import actions.PageAction;
import dao.CommentDAO;
import entities.Comment;
import entities.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.sql.Date;
import java.util.GregorianCalendar;

/**
 * Created by Vyacheslav.
 * @author Vyacheslav
 */
public class AddComment extends Action {
    @Override
    public PageAction execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {

        int movieID = Integer.parseInt(request.getParameter("movie_id"));
        String text = request.getParameter("text");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        Comment comment = new Comment();
        comment.setUserID(user.getId());
        comment.setMovieId(movieID);
        comment.setText(text);
        comment.setDate(new Date(new GregorianCalendar().getTimeInMillis())); //Дата на текущий момент

        CommentDAO commentDAO = new CommentDAO();
        commentDAO.insert(comment);

        return new PageAction("do?action=movie_page&movie_id=" + movieID, false);
    }
}
