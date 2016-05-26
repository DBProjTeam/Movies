package actions;

import bean.MoviePersonRoleView;
import constants.PagePath;
import dao.MovieDAO;
import dao.PersonDAO;
import dao.view.MoviePersonRoleDAO;
import entities.Movie;
import entities.Person;
import entities.Role;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;

/**
 * Created by Станислав on 12.03.16.
 */
public class PersonAction extends Action {
    private static int COUNT_MOVIE_WherePersonAttended = 0;

    @Override
    public PageAction execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        int person_id = Integer.parseInt(request.getParameter("person_id"));
        PersonDAO personDAO = new PersonDAO();
        Person person = personDAO.getByPK(person_id);
        MoviePersonRoleDAO moviePersonRoleDAO = new MoviePersonRoleDAO();
        //request.setAttribute("movies", moviesWherePersonAttended);
        //request.setAttribute("roles", rolesWherePersonAttended);
        request.setAttribute("countMovie", COUNT_MOVIE_WherePersonAttended);
        request.setAttribute("person", person);
        return new PageAction(PagePath.PERSON, true);//
    }

    private List<Movie> getMovieWherePersonAttended(List<MoviePersonRoleView> moviePersonRoleViews) throws SQLException {
        int count = 0;
        MovieDAO movieDAO = new MovieDAO();
        List<Movie> movies = new ArrayList<Movie>();
        ListIterator<MoviePersonRoleView> iterator = moviePersonRoleViews.listIterator();
        while (iterator.hasNext()) {
            MoviePersonRoleView moviePersonRoleViewGetMovie = iterator.next();
            if (movies.isEmpty()) {
                count++;
                movies.add(movieDAO.getByPK(moviePersonRoleViewGetMovie.getMovie_ID()));
            } else {
                Movie movie = movieDAO.getByPK(moviePersonRoleViewGetMovie.getMovie_ID());
                if (movies.indexOf(movie) >= 0) {
                } else {
                    count++;
                    movies.add(movie);
                }
            }
        }
        COUNT_MOVIE_WherePersonAttended = count;//=====
        return movies;
    }

    private List<Role> getRoleWherePersonAttended(List<MoviePersonRoleView> moviePersonRoleViews) throws SQLException {
        List<Role> roles = new ArrayList<Role>();
        ListIterator<MoviePersonRoleView> iterator = moviePersonRoleViews.listIterator();
        while (iterator.hasNext()) {
            MoviePersonRoleView moviePersonRoleViewGetRole = iterator.next();
            if (roles.isEmpty()) {
                Role role = new Role();
                role.setRole(moviePersonRoleViewGetRole.getRole());
            } else {
                Role role = new Role();
                role.setRole(moviePersonRoleViewGetRole.getRole());
                if (roles.indexOf(role) >= 0) {
                } else {
                    roles.add(role);
                }
            }
        }
        return roles;
    }

}
