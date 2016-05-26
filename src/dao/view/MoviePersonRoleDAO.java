package dao.view;

import bean.MoviePersonRoleView;
import constants.PersonRoles;
import dao.PersonDAO;
import util.Connector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Станислав on 09.03.16.
 * {Очень содержательный класс в нем все связывающие  Person Movie и Role}
 */
public class MoviePersonRoleDAO {
    private static final String GET_PERSON_BY_MOVIE_ID = "SELECT * FROM movies.movie_person_role_view where movie_ID=? and  role=?;";//запрос на выборку определенной роли в фильме
    private static String GET_PERSON_ROLE_BY_MOVIE_ID = "SELECT * FROM movie_person_role_view WHERE movie_ID=?";//запрос на выборку всех персон кто играл в фильме
    private static String GET_PERSON_ROLE_BY_PERSON_ID = "SELECT * FROM movie_person_role_view WHERE person_ID=?";//запрос на выборку всех ролей персоны
    Connection connection;

    public List<MoviePersonRoleView> getPersonRoleByMovieId(int movie_ID) throws SQLException {
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<MoviePersonRoleView> moviePersonRoleViews = new ArrayList<MoviePersonRoleView>();
        try {
            connection = Connector.getConnection();
            statement = connection.prepareStatement(GET_PERSON_ROLE_BY_MOVIE_ID);
            statement.setInt(1, movie_ID);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                moviePersonRoleViews.add(obtain(resultSet));
            }
        } finally {
            Connector.close(statement);
            Connector.close(resultSet);
        }
        return moviePersonRoleViews;
    }

    public List<MoviePersonRoleView> getPersonRoleByPersonId(int person_id) throws SQLException {
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<MoviePersonRoleView> moviePersonRoleViews = new ArrayList<MoviePersonRoleView>();
        try {
            connection = Connector.getConnection();
            statement = connection.prepareStatement(GET_PERSON_ROLE_BY_PERSON_ID);
            statement.setInt(1, person_id);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                moviePersonRoleViews.add(obtain(resultSet));
            }
        } finally {
            Connector.close(statement);
            Connector.close(resultSet);
        }
        return moviePersonRoleViews;
    }

    public List<MoviePersonRoleView> getPersonByMovieId(int movie_id, PersonRoles role) throws SQLException {
        List<MoviePersonRoleView> moviePersonRoleViews = new ArrayList<MoviePersonRoleView>();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = Connector.getConnection();
            statement = connection.prepareStatement(GET_PERSON_BY_MOVIE_ID);//возможно что нет к этому фильму role
            statement.setInt(1, movie_id);
            statement.setString(2, role.getName());
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                moviePersonRoleViews.add(obtain(resultSet));
            }
        } finally {
            Connector.close(statement);
            Connector.close(resultSet);
        }

        return moviePersonRoleViews;
    }

    private MoviePersonRoleView obtain(ResultSet resultSet) throws SQLException {
        MoviePersonRoleView moviePersonRoleView = new MoviePersonRoleView();
        PersonDAO personDAO = new PersonDAO();
        moviePersonRoleView.setPerson(personDAO.getByPK(resultSet.getInt("person_ID")));
        moviePersonRoleView.setMovie_ID(resultSet.getInt("movie_ID"));
        moviePersonRoleView.setRole(resultSet.getString("role"));
        return moviePersonRoleView;
    }

}
