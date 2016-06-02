package entities;

import java.io.Serializable;

/**
 * Created by Едик  Лисогуб on 07.03.2016.
 */
public class Country implements Serializable {
    private String country;

    public Country() {
        this.country = "Без Страны";
    }

    public Country(String country) {
        this.country = country;
    }
    public String getCountry() {
        return country;
    }
    public void setCountry(String country) {
        this.country = country;
    }
}
