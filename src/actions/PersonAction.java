package actions;

import bin.PersonRoleView;
import dao.MovieDAO;
import dao.RoleDAO;
import dao.view.PersonRoleDAO;
import entities.Movie;
import entities.Role;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

/**
 * Created by Станислав on 12.03.16.
 */
public class PersonAction extends  Action {
    private int COUNT_MOVIE_WherePersonAttended=0;
    @Override
    public PageAction execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        int person_id =Integer.parseInt(request.getParameter("person_id"));
        PersonRoleDAO personRoleDAO = new PersonRoleDAO();
        List<PersonRoleView> personRoleViews = personRoleDAO.getPersonRoleByPersonId(person_id);
        List<Movie> moviesWherePersonAttended = getMovieWherePersonAttended(personRoleViews);
        List<Role> rolesWherePersonAttended=getRoleWherePersonAttended(personRoleViews);
        if (moviesWherePersonAttended.isEmpty()&&rolesWherePersonAttended.isEmpty()){
            //ошыбка или вроде то во
            return null;
        }
        request.setAttribute("movies",moviesWherePersonAttended);
        request.setAttribute("roles",rolesWherePersonAttended);
        request.setAttribute("countMovie",COUNT_MOVIE_WherePersonAttended);
        return new PageAction("",true);// здесь вставить ссылку на страницу поиска!!!!!
    }

    private List<Movie> getMovieWherePersonAttended(List<PersonRoleView> personRoleViews) throws SQLException {
        int count=0;
        MovieDAO movieDAO = new MovieDAO();
        List<Movie> movies = new ArrayList<Movie>();
        ListIterator<PersonRoleView> iterator= personRoleViews.listIterator();
        while (iterator.hasNext()) {
            PersonRoleView personRoleViewGetMovie = iterator.next();
            if (movies.isEmpty()) {
                count++;
                movies.add(movieDAO.getByPK(personRoleViewGetMovie.getMovie_ID()));
            } else {
                Movie movie = movieDAO.getByPK(personRoleViewGetMovie.getMovie_ID());
                if(movies.indexOf(movie)<0){}
                else {
                    count++;
                    movies.add(movie);
                }
            }
        }
        COUNT_MOVIE_WherePersonAttended=count;//=====
        return movies;
    }

    private List<Role> getRoleWherePersonAttended(List<PersonRoleView> personRoleViews)throws SQLException{
        List<Role> roles = new ArrayList<Role>();
        ListIterator<PersonRoleView> iterator= personRoleViews.listIterator();
        while (iterator.hasNext()) {
            PersonRoleView personRoleViewGetRole = iterator.next();
            if (roles.isEmpty()) {
                Role role= new Role();
                role.setRole(personRoleViewGetRole.getRole());
            } else {
                Role role = new Role();
                role.setRole(personRoleViewGetRole.getRole());
                if(roles.indexOf(role)<0){}
                else {
                    roles.add(role);
                }
            }
        }
        return roles;
    }

}
