package entities;

import java.io.Serializable;

/**
 * Created by Едик  Лисогуб on 07.03.2016.
 */
public class MoviePerson implements Serializable {
    private int id;
    private int Movie_Id;
    private int Person_Id;

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

    public int getPerson_Id() {
        return Person_Id;
    }

    public void setPerson_Id(int person_Id) {
        Person_Id = person_Id;
    }
}
