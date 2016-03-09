package entities;

import java.io.Serializable;

/**
 * Created by Едик  Лисогуб on 07.03.2016.
 */
public class MoviePersonRole implements Serializable {
    private int id;
    private int Movie_Person_Id;
    private String role;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMovie_Person_Id() {
        return Movie_Person_Id;
    }

    public void setMovie_Person_Id(int movie_Person_Id) {
        Movie_Person_Id = movie_Person_Id;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}