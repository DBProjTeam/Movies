package entities;

import java.io.Serializable;

/**
 * Created by Едик  Лисогуб on 07.03.2016.
 */
public class MovieGenre implements Serializable {
    private int id;
    private int Movie_id;
    private Genre genre;

    public Genre getGenre() {
        return genre;
    }

    public void setGenre(Genre genre) {
        this.genre = genre;
    }


    public int getMovie_id() {
        return Movie_id;
    }

    public void setMovie_id(int movie_id) {
        Movie_id = movie_id;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
