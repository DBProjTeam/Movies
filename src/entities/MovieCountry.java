package entities;

import java.io.Serializable;

/**
 * Created by Едик  Лисогуб on 07.03.2016.
 */
public class MovieCountry implements Serializable {
    private int id;
    private int Movie_Id;
    private Country country;

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

    public Country getCountry() {
        return country;
    }

    public void setCountry(Country country) {
        this.country = country;
    }
}
