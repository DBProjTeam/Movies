package entities;

import java.io.Serializable;

/**
 * Created by Едик  Лисогуб on 07.03.2016.
 */
public class MoviePerson implements Serializable {
    private int movie_person_ID;
    private int movie_ID;
    private int person_ID;

    public int getId() {
        return movie_person_ID;
    }

    public void setId(int movie_person_ID) {
        this.movie_person_ID = movie_person_ID;
    }

    public int getMovie_Id() {
        return movie_ID;
    }

    public void setMovie_Id(int movie_Id) {
        movie_ID = movie_Id;
    }

    public int getPerson_Id() {
        return person_ID;
    }

    public void setPerson_Id(int person_Id) {
        person_ID = person_Id;
    }
}