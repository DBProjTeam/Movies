package entities;


import java.io.Serializable;
import java.sql.Time;
import java.util.Date;

/**
 * Created by Станислав on 08.03.16.
 */
public class Movie implements Serializable {
    private int movie_ID;
    private Time runtime;
    private int year;
    private Date releaseDate;
    private String description;
    private int image_ID;
    private String title;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getMovie_id() {
        return movie_ID;
    }

    public void setMovie_id(int movie_id) {
        this.movie_ID = movie_id;
    }

    public Date getRuntime() {
        return runtime;
    }

    public void setRuntime(Time runtime) {
        this.runtime = runtime;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }


    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


    public int getImage_id() {
        return image_ID;
    }

    public void setImage_id(int image_id) {
        this.image_ID = image_id;
    }

}
