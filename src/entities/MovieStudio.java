package entities;

import java.io.Serializable;

/**
 * Created by Едик  Лисогуб on 07.03.2016.
 */
public class MovieStudio implements Serializable{
    private int id;
    private int Movie_Id;
    private int Studio_Id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMovie_Id() {
        return Movie_Id;
    }

    public void setMovie_Id(int movie_Id) {
        Movie_Id = movie_Id;
    }

    public int getStudio_Id() {
        return Studio_Id;
    }

    public void setStudio_Id(int studio_Id) {
        Studio_Id = studio_Id;
    }
}
