package bean;

import entities.Country;
import entities.Image;
import entities.Movie;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Pavel on 01.06.2016.
 */
public class MovieImages extends Movie implements Serializable {
    private String label = null;
    private List<Image> images = null;
    private Image mainImage = null;
    private Country country = null;
    private MoviePersonRoleView director = null;

    public MovieImages() {
        super();
        this.label = "";
        this.images = new ArrayList<Image>(0);
        this.mainImage = new Image();
    }

    public MovieImages(Movie m) {
        super(m);
        this.label = m.getTitle();
    }
    public MovieImages(Movie m, Image s) {
        super(m);
        this.label = m.getTitle();
        this.mainImage = s;
        this.images = new ArrayList<Image>(0);
    }

    public MovieImages(Movie m, Image s, Country c) {
        super(m);
        this.mainImage = s;
        this.images = new ArrayList<Image>();
        this.country = c;
    }

    public MovieImages(Movie m, Image s, Country c, MoviePersonRoleView mpr) {
        super(m);
        this.mainImage = s;
        this.images = new ArrayList<Image>();
        this.country = c;
        this.director = mpr;
    }

    public Country getCountry() {
        return country;
    }

    public void setCountry(Country country) {
        this.country = country;
    }

    public List<Image> getImages() {
        return images;
    }

    public void setImages(List<Image> images) {
        this.images = images;
    }

    public Image getMainImage() {
        return mainImage;
    }

    public void setMainImage(Image mainImage) {
        this.mainImage = mainImage;
    }

    public MoviePersonRoleView getDirector() {
        return director;
    }

    public void setDirector(MoviePersonRoleView director) {
        this.director = director;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }
}
