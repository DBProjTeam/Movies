package bean;

import entities.Person;

import java.io.Serializable;

/**
 * Created by Станислав on 09.03.16.
 * Можно также сюда добавить не movie_id, а entitie movie
 */
public class MoviePersonRoleView implements Serializable {
    private  Person person;
    private String role;
    private int movie_ID;

    public Person getPerson() {
        return person;
    }

    public void setPerson(Person person) {
        this.person = person;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public int getMovie_ID() {
        return movie_ID;
    }

    public void setMovie_ID(int movie_ID) {
        this.movie_ID = movie_ID;
    }


}
