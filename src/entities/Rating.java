package entities;

import java.io.Serializable;

/**
 * Created by Станислав on 08.03.16.
 */
public class Rating implements Serializable {

    private int rating_ID;
    private int user_ID;
    private int movie_ID;
    private int score;

    public int getRating_ID() {
        return rating_ID;
    }

    public void setRating_ID(int rating_ID) {
        this.rating_ID = rating_ID;
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

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

}
