package entities;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Станислав on 08.03.16.
 */
public class Comment implements Serializable {
    private  int comment_ID;
    private  int user_ID;
    private  int movie_ID;
    private  String text;
    private  Date date;

    public int getComment_ID() {
        return comment_ID;
    }

    public void setComment_ID(int comment_ID) {
        this.comment_ID = comment_ID;
    }

    public int getUser_ID() {
        return user_ID;
    }

    public void setUser_ID(int user_ID) {
        this.user_ID = user_ID;
    }

    public int getMovie_ID() {
        return movie_ID;
    }

    public void setMovie_ID(int movie_ID) {
        this.movie_ID = movie_ID;
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
