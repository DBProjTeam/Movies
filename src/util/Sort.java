package util;

import dao.RatingDAO;
import entities.Movie;
import entities.Rating;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.ListIterator;

/**
 * Created by Станислав on 28.03.16.
 */
public class Sort {

    private static List<MovieRating> movieRatingList = new ArrayList<MovieRating>();

    public static void sortMovieByName(List<Movie> list) {
        list.sort(new Comparator<Movie>() {
            @Override
            public int compare(Movie o1, Movie o2) {
                String title1 = o1.getTitle();
                String title2 = o2.getTitle();
                return title1.toString().compareTo(title2.toString());
            }
        });
    }

    public static void sortMovieByYear(List<Movie> list) {
        list.sort(new Comparator<Movie>() {
            @Override
            public int compare(Movie o1, Movie o2) {
                int year1 = o1.getYear();
                int year2 = o2.getYear();
                if (year1 > year2) {
                    return -1;
                } else if (year1 < year2) {
                    return 1;
                } else {
                    return 0;
                }
            }
        });
    }


    public static void sortMovieByRating(List<Movie> list) {
        ListIterator<Movie> iterator = list.listIterator();
        Movie movie = null;
        while (iterator.hasNext()) {
            movie = iterator.next();
            movieRatingList.add(new MovieRating(movie));
        }
        movieRatingList.sort(new Comparator<MovieRating>() {
            @Override
            public int compare(MovieRating o1, MovieRating o2) {
                if (o1.rating > o2.rating) {
                    return -1;
                } else if (o1.rating < o2.rating) {
                    return 1;
                } else {
                    return 0;
                }
            }
        });

        list.clear();
        ListIterator<MovieRating> iteratorMovieRating = movieRatingList.listIterator();
        MovieRating movieRating = null;
        while (iteratorMovieRating.hasNext()) {
            movieRating = iteratorMovieRating.next();
            list.add(movieRating.getMovie());
        }

    }


    private static class MovieRating {
        private Movie movie = null;
        private double rating = 0;

        public MovieRating(Movie movie) {
            this.movie = movie;
            this.rating = calculationRatingMovie(movie.getMovieId());
        }

        public double getRating() {
            return rating;
        }

        public Movie getMovie() {
            return movie;
        }

        private static double calculationRatingMovie(int movie_id) {
            RatingDAO ratingDAO = new RatingDAO();
            int count = 0;
            int sum = 0;
            try {

                List<Rating> list = ratingDAO.getRatingAllByIdMovie(movie_id);
                ListIterator<Rating> iterator = list.listIterator();
                Rating rating = null;
                while (iterator.hasNext()) {
                    rating = iterator.next();
                    sum += rating.getScore();
                }
            } catch (SQLException e) {
            }
            count++;
            return ((sum * 1.0) / (count * 1.0));
        }
    }

}
