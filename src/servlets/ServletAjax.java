package servlets;

import bean.MovieImages;
import com.fasterxml.jackson.databind.ObjectMapper;
import dao.MovieDAO;
import entities.Movie;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Pavel on 04.06.2016.
 */
@WebServlet("/ServletAjax")
public class ServletAjax extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain");
        String title = request.getParameter("title");
        System.out.println("ServletAjax.process :request received parameters: title:= " + title);
        List<MovieImages> movieList = new ArrayList<MovieImages>();
        if (title != "") {
            try {
                response.setContentType("application/json");
                movieList = getByTitlelike(title);
                ObjectMapper mapper = new ObjectMapper();
                mapper.writeValue(response.getOutputStream(), movieList);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else {
            ObjectMapper mapper = new ObjectMapper();
            mapper.writeValue(response.getOutputStream(), movieList);
        }
    }

    private List<MovieImages> getByTitlelike(String title) throws SQLException {
        List<Movie> movies = new MovieDAO().searchByTitle(title, "", "", "", 1000, 2080);
        List<MovieImages> movieImageslist = new ArrayList<MovieImages>();
        for (Movie mov : movies) {
            movieImageslist.add(new MovieImages(mov));
        }
        return movieImageslist;
    }

}
