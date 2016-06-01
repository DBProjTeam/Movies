package bean;

import entities.Image;
import entities.Movie;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Pavel on 01.06.2016.
 */
public class MovieImages extends Movie implements Serializable {
    private List<Image> images = null;
    private Image mainImage = null;

    public MovieImages() {
        super();
        this.images = new ArrayList<Image>(0);
        this.mainImage = new Image();
    }

    public MovieImages(Movie m, Image s) {
        super(m);
        this.mainImage = s;
        this.images = new ArrayList<Image>(0);
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
}
