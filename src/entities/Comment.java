package entities;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Станислав on 08.03.16.
 */
public class Comment implements Serializable {
    private  int commentId;
    private  int userId;
    private  int movieId;
    private  String text;
    private  Date date;

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserID(int userId) {
        this.userId = userId;
    }

    public int getMovieId() {
        return movieId;
    }

    public void setMovieId(int movieId) {
        this.movieId = movieId;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

}
