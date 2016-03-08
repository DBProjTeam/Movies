package dao;

import entities.Comment;
import util.Connector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Станислав on 08.03.16.
 */
public class CommentDAO {
    Connection connection;
    private static String GET_ALL_COMMENT_BY_ID_MOVIE="SELECT * FROM comment WHERE movie_ID=?";

    public List<Comment> getAllCommentByIdMovie(int idMovie) throws SQLException{
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<Comment> comments = new ArrayList<Comment>();
        try {
            connection = Connector.getConnection();
            statement = connection.prepareStatement(GET_ALL_COMMENT_BY_ID_MOVIE);
            statement.setInt(1, idMovie);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                 comments.add(obtain(resultSet));
            }
        } finally {
            Connector.close(statement);
            Connector.close(resultSet);
        }
        return comments;

    }
    private Comment obtain(ResultSet resultSet) throws SQLException {
        Comment comment = new Comment();
        comment.setComment_ID(resultSet.getInt("comment_ID"));
        comment.setText(resultSet.getString("text"));
        comment.setUser_ID(resultSet.getInt("user_ID"));
        comment.setDate(resultSet.getDate("date"));
        comment.setMovie_ID(resultSet.getInt("movie_ID"));
        return comment;
    }
}
