package actions;
//Проверен 

import bean.MoviePersonRoleView;
import bean.NameOfPerson;
import constants.PagePath;
import constants.PersonRoles;
import dao.CommentDAO;
import dao.ImageDAO;
import dao.MovieDAO;
import dao.RatingDAO;
import dao.view.MoviePersonRoleDAO;
import entities.Comment;
import entities.Image;
import entities.Movie;
import entities.Rating;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;

/**
 * Created by Станислав on 09.03.16.
 * modify pavel
 */
public class MovieAction extends Action {

    private static final int COUNT_MAX_ROLE = 10;

    @Override
    public PageAction execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        int movie_id = 0;

        movie_id = Integer.parseInt(request.getParameter("movie_id"));


        MovieDAO movieDAO = new MovieDAO();
        CommentDAO commentDAO = new CommentDAO();
        MoviePersonRoleDAO moviePersonRoleDAO = new MoviePersonRoleDAO();
        RatingDAO ratingDAO = new RatingDAO();
        ImageDAO imageDAO = new ImageDAO();
        Movie movie = movieDAO.getByPK(movie_id);

        String country = "''";
        if (movieDAO.getCountry(movie_id) != null) {
            country = movieDAO.getCountry(movie_id).getCountry().getCountry();
        }
        List<Rating> ratingList = ratingDAO.getRatingAllByIdMovie(movie_id);
        List<MoviePersonRoleView> persons = moviePersonRoleDAO.getPersonRoleByMovieId(movie_id);
        List<Comment> comments = commentDAO.getAllCommentByIdMovie(movie_id);
        double rating = getRatingAverage(ratingList);
        List<MoviePersonRoleView> producers = getRole(persons, PersonRoles.PRODUCER.getName());
        List<MoviePersonRoleView> actors = getRole(persons, PersonRoles.ACTOR.getName());
        List<MoviePersonRoleView> directors = getRole(persons, PersonRoles.DIRECTOR.getName());
        List<MoviePersonRoleView> operators = getRole(persons, PersonRoles.OPERATOR.getName());
        List<MoviePersonRoleView> scenario = getRole(persons, PersonRoles.SCENARIO.getName());

        List<Image> images = imageDAO.getAllImagesByMovieId(movie_id);
        images.add(0, imageDAO.getImageById(movie.getImageId()));
        request.setAttribute("movie", movie);
        request.setAttribute("images", images);
        request.setAttribute("country", country);
        request.setAttribute("comments", comments);
        request.setAttribute("directors", directors);
        request.setAttribute("actors", actors);
        request.setAttribute("producers", producers);
        request.setAttribute("operators", operators);
        request.setAttribute("scenario", scenario);
        request.setAttribute("rating", rating);
        request.setAttribute("user_name", new NameOfPerson());
        PageAction pageAction = new PageAction(PagePath.MOVIE, true);
        return pageAction;
    }

    private double getRatingAverage(List<Rating> ratings) {
        int sum = 0;
        int count = 0;
        ListIterator<Rating> iterator = ratings.listIterator();
        while (iterator.hasNext()) {
            Rating rating = iterator.next();
            sum += rating.getScore();
            count++;
        }
        return (sum * 1.0) / (count * 1.0);
    }


    private List<MoviePersonRoleView> getRole(List<MoviePersonRoleView> list, String role) {
        ListIterator<MoviePersonRoleView> iterator = list.listIterator();
        List<MoviePersonRoleView> personsRole = new ArrayList<MoviePersonRoleView>();
        int count = 0;
        while (iterator.hasNext() && count < COUNT_MAX_ROLE) {
            MoviePersonRoleView moviePersonRoleView = iterator.next();
            if (role.equals(moviePersonRoleView.getRole())) {
                personsRole.add(moviePersonRoleView);
                count++;
                //list.remove(moviePersonRoleView);//TOdo Error happend here
            }
        }
        return personsRole;
    }


}
