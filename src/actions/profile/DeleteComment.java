package actions.profile;

import actions.Action;
import actions.PageAction;
import dao.CommentDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;

/**
 * Created by Vyacheslav.
 */
public class DeleteComment extends Action {

    @Override
    public PageAction execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        int movieID = Integer.parseInt(request.getParameter("movie_id"));
        int commentID = Integer.parseInt(request.getParameter("comment_id"));
        CommentDAO commentDAO = new CommentDAO();

        commentDAO.delete(commentID);

        return new PageAction("do?action=movie_page&movie_id=" + movieID, false);
    }
}
