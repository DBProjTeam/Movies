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
 * @author Станислав
 * @author Vyacheslav
 */

public class CommentDAO {
    Connection connection;
    private static String GET_ALL_COMMENT_BY_ID_MOVIE="SELECT * FROM comment WHERE movie_ID=?";
    private static String INSERT_COMMENT="INSERT INTO comment(user_ID, movie_ID, text, date) VALUES(?,?,?,?)";

    public List<Comment> getAllCommentByIdMovie(int idMovie) throws SQLException{
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<Comment> comments = new ArrayList<Comment>();
        try {
            connection = Connector.getConnection();
            statement = connection.prepareStatement(GET_ALL_COMMENT_BY_ID_MOVIE);
            statement.setInt(1, idMovie);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {//Исправлено
                 comments.add(obtain(resultSet));
            }
        } finally {
            Connector.close(statement);
            Connector.close(resultSet);
        }
        return comments;

    }

    public void insert(Comment comment) throws SQLException {
        PreparedStatement statement = null;
        try {
            connection = Connector.getConnection();
            statement = connection.prepareStatement(INSERT_COMMENT);
            statement.setInt(1, comment.getUser_ID());
            statement.setInt(2, comment.getMovie_ID());
            statement.setString(3, comment.getText());
            statement.setDate(4, comment.getDate());

            statement.executeQuery();
        } finally {
            Connector.close(statement);
        }
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
