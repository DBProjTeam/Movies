package entities;

import java.io.Serializable;

/**
 * Created by Едик  Лисогуб on 07.03.2016.
 */
public class Studio implements Serializable {
    private int id;
    private String name;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
