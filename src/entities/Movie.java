package entities;


import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;

/**
 * Created by Станислав on 08.03.16.
 */
public class Movie implements Serializable {
    private int movieId;
    private Time runtime; //будет в минутах, чтоб с форматом времени не возиться
    private int year;
    private Date releaseDate;
    private String description;
    private int imageId;
    private String title;

    public Movie() {
        this.movieId = 1;
        this.runtime = new Time(0);
        this.releaseDate = new Date(0);
        this.year = 0;
        this.description = new String();
        this.imageId = 111;
        this.title = new String();
    }

    public Movie(Movie m) {
        this.movieId = m.getMovieId();
        this.runtime = m.getRuntime();
        this.releaseDate = m.getReleaseDate();
        this.year = m.getYear();
        this.description = m.getDescription();
        this.imageId = m.getImageId();
        this.title = m.getTitle();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getMovieId() {
        return movieId;
    }

    public void setMovieId(int movie_id) {
        this.movieId = movie_id;
    }

    public Time getRuntime() {
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


    public int getImageId() {
        return imageId;
    }

    public void setImageId(int image_id) {
        this.imageId = image_id;
    }


}
