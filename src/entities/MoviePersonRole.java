package entities;

import java.io.Serializable;

/**
 * Created by Едик  Лисогуб on 07.03.2016.
 */
public class MoviePersonRole implements Serializable {
    private int movie_person_role_ID;
    private int movie_person_ID;
    private String role;

    public int getId() {
        return movie_person_role_ID;
    }

    public void setId(int movie_person_role_ID) {
        this.movie_person_role_ID = movie_person_role_ID;
    }

    public int getMovie_Person_Id() {
        return movie_person_ID;
    }

    public void setMovie_Person_Id(int movie_person_ID) {
        this.movie_person_ID = movie_person_ID;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}