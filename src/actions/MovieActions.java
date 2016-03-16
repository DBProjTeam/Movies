package actions;
//Проверен 
import bin.PersonRoleView;
import constants.PagePath;
import dao.CommentDAO;
import dao.MovieDAO;
import dao.RatingDAO;
import dao.view.PersonRoleDAO;
import entities.Comment;
import entities.Movie;
import entities.Person;
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
    private static String  ROLE_PRODUCER="продюсер";
    private static String  ROLE_ACTOR="актор";
    private static String  ROLE_DIRECTOR="режиссер";
    private static int count_mox_role=10;
    @Override
    public PageAction execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        int movie_id =Integer.parseInt(request.getParameter("movie_id"));

        MovieDAO movieDAO = new MovieDAO();
        CommentDAO commentDAO = new CommentDAO();
        PersonRoleDAO personRoleDAO = new PersonRoleDAO();
        RatingDAO ratingDAO = new RatingDAO();


        Movie movie = movieDAO.getByPK(movie_id);
        List <Rating> ratingList = ratingDAO.getRatingAllByIdMovie(movie_id);
        List<PersonRoleView> personRoleViewList=personRoleDAO.getPersonRoleByMovieId(movie_id);
        List<Comment>  comments= commentDAO.getAllCommentByIdMovie(movie_id);

        double rating = getRatingAverage(ratingList);
        List<PersonRoleView> personRoleProducer =getRole(personRoleViewList, ROLE_PRODUCER);
        List<PersonRoleView> personRoleActor =getRole(personRoleViewList,ROLE_ACTOR);
        List<PersonRoleView> personRoleDirector =getRole(personRoleViewList,ROLE_DIRECTOR);


        request.setAttribute("movie",movie);
        request.setAttribute("comments",comments);
        request.setAttribute("roleProducer",personRoleProducer);
        request.setAttribute("roleActor",personRoleActor);
        request.setAttribute("roleDirector",personRoleDirector);

        request.setAttribute("rating",rating);
        PageAction pageAction = new PageAction(PagePath.MOVIE,true);// здесь вставить ссылку на страницу поиска!!!!!
        return pageAction;
    }

   private double getRatingAverage(List<Rating> ratings){
       int sum=0;
       int count=0;
       ListIterator<Rating> iterator=ratings.listIterator();
       while (iterator.hasNext()){
           Rating rating = iterator.next();
           sum+=rating.getScore();
           count++;
       }
       return (double)((sum*1.0)/(count*1.0));
   }

        // Исправлен и Залить!!!

   private   List<PersonRoleView> getRole(List<PersonRoleView> list,String role){
       ListIterator<PersonRoleView> iterator= list.listIterator();
       List<PersonRoleView>personsRole=new ArrayList<PersonRoleView>();
       int count=0;
        while (iterator.hasNext()&&count<count_mox_role){
            PersonRoleView personRoleView = iterator.next();
            if(role.equals(personRoleView.getRole())){
                personsRole.add(personRoleView);
                count++;
                list.remove(personRoleView);
            }
        }
       return personsRole;
   };

}
