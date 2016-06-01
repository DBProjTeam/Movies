package entities;

import java.io.Serializable;

/**
 * Created by Pavel on 30.05.2016.
 */
public class Image implements Serializable {
    private int id;
    private String name;

    public Image() {
        this.id = 111;
        this.name = "movie-1.png";
    }


    public Image(String name) {
        this();
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
