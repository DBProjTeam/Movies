package entities;

import java.io.Serializable;

/**
 * Created by Vyacheslav.
 */
public class User implements Serializable {
//Все entity Java Bean

    private int id;
    private String login;
    private String password;
    private String name;
    private String surname;
    private UserRole role;
    private int imageId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public UserRole getRole() {
        return role;
    }

    public void setRole(UserRole role) {
        this.role = role;
    }

    public int getImageId() {
        return imageId;
    }

    public void setImageId(int imageId) {
        this.imageId = imageId;
    }

    public static enum UserRole {
        ADMIN, USER;

        public static UserRole getRole(int role) {
            switch (role) {
                case 2:
                    return ADMIN;
                case 1:
                    return USER;
            }
            return null;
        }
    }
}
