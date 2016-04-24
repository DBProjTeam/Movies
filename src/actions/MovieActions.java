package actions;
//Проверен 

import bean.MoviePersonRoleView;
import constants.PagePath;
import dao.CommentDAO;
import dao.MovieDAO;
import dao.RatingDAO;
import dao.view.MoviePersonRoleDAO;
import entities.Comment;
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
 */
public class MovieActions extends Action {


    private static int count_max_role = 10;

    @Override
    public PageAction execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {

        int movie_id = Integer.parseInt(request.getParameter("movie_id"));

        MovieDAO movieDAO = new MovieDAO();
        CommentDAO commentDAO = new CommentDAO();
        MoviePersonRoleDAO moviePersonRoleDAO = new MoviePersonRoleDAO();
        RatingDAO ratingDAO = new RatingDAO();


        Movie movie = movieDAO.getByPK(movie_id);
        List<Rating> ratingList = ratingDAO.getRatingAllByIdMovie(movie_id);
        List<MoviePersonRoleView> persons = moviePersonRoleDAO.getPersonRoleByMovieId(movie_id);
        List<Comment> comments = commentDAO.getAllCommentByIdMovie(movie_id);
        double rating = getRatingAverage(ratingList);
        MoviePersonRoleDAO personMRDAO = new MoviePersonRoleDAO();
        List<MoviePersonRoleView> director = null, oper = null, composer = null, producer = null;

        try {
            director = personMRDAO.getPersonByMovieId(movie.getMovie_id(), "DIRECTOR");
            oper = personMRDAO.getPersonByMovieId(movie.getMovie_id(), " operator");
            composer = personMRDAO.getPersonByMovieId(movie.getMovie_id(), "composer");
            producer = personMRDAO.getPersonByMovieId(movie.getMovie_id(), "producer");
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("director", director);
        request.setAttribute("oper", oper);
        request.setAttribute("composer", composer);
        request.setAttribute("producer", producer);
        request.setAttribute("country", movieDAO.getCountry(movie.getMovie_id()));
        request.setAttribute("movie", movie);
        request.setAttribute("comments", comments);
        request.setAttribute("persons", persons);
        request.setAttribute("rating", rating);
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

    //deprecated method
    private List<MoviePersonRoleView> getRole(List<MoviePersonRoleView> list, String role) {
        ListIterator<MoviePersonRoleView> iterator = list.listIterator();
        List<MoviePersonRoleView> personsRole = new ArrayList<MoviePersonRoleView>();
        int count = 0;
        while (iterator.hasNext() && count < count_max_role) {
            MoviePersonRoleView moviePersonRoleView = iterator.next();
            if (role.equals(moviePersonRoleView.getRole())) {
                personsRole.add(moviePersonRoleView);
                count++;
                list.remove(moviePersonRoleView);
            }
        }
        return personsRole;
    }


}
