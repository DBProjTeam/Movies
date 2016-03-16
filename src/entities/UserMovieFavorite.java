package entities;

/**
 * Created by Станислав on 16.03.16.
 */
public class UserMovieFavorite {
    private int user_movie_favorite_ID;
    private int user_ID;
    private int movie_ID;

    public int getUserMovieFavoriteID() {
        return user_movie_favorite_ID;
    }

    public void setUserMovieFavoriteID(int user_movie_favorite_ID) {
        this.user_movie_favorite_ID = user_movie_favorite_ID;
    }

    public int getUserID() {
        return user_ID;
    }

    public void setUserID(int user_ID) {
        this.user_ID = user_ID;
    }

    public int getMovieID() {
        return movie_ID;
    }

    public void setMovieID(int movie_ID) {
        this.movie_ID = movie_ID;
    }


}
