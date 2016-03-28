package dao.view;

import bin.PersonRoleView;
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
 */
public class PersonRoleDAO {
    private static String GET_PERSON_ROLE_BY_MOVIE_ID = "SELECT * FROM movie_person_role_view WHERE movie_ID=?";//запрос на выборку всех персон кто играл в фильме
    private static String GET_PERSON_ROLE_BY_PERSON_ID = "SELECT * FROM movie_person_role_view WHERE person_ID=?";//запрос на выборку всех ролей персоны

    Connection connection;

    public List<PersonRoleView> getPersonRoleByMovieId(int movie_ID) throws SQLException {
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        //todo так не хорошо я 20 мин искал ошибку надо инициализировать пременную прежде чем добавлять add!!!!
        List<PersonRoleView> personRoleViews = new ArrayList<PersonRoleView>();

        try {
            connection = Connector.getConnection();
            statement = connection.prepareStatement(GET_PERSON_ROLE_BY_MOVIE_ID);
            statement.setInt(1, movie_ID);
            resultSet = statement.executeQuery();
            while (resultSet.next()) { //Исправлено
                personRoleViews.add(obtain(resultSet));
            }
        } finally {
            Connector.close(statement);
            Connector.close(resultSet);
        }
        return personRoleViews;
    }

    public List<PersonRoleView> getPersonRoleByPersonId(int person_id) throws SQLException {
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<PersonRoleView> personRoleViews = new ArrayList<PersonRoleView>();
        try {
            connection = Connector.getConnection();
            statement = connection.prepareStatement(GET_PERSON_ROLE_BY_PERSON_ID);
            statement.setInt(1, person_id);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                personRoleViews.add(obtain(resultSet));
            }
        } finally {
            Connector.close(statement);
            Connector.close(resultSet);
        }
        return personRoleViews;
    }

    private PersonRoleView obtain(ResultSet resultSet) throws SQLException {

        PersonRoleView personRoleView = new PersonRoleView();
        PersonDAO personDAO = new PersonDAO();
        personRoleView.setPerson(personDAO.getByPK(resultSet.getInt("person_ID")));
        personRoleView.setMovie_ID(resultSet.getInt("movie_ID"));
        personRoleView.setRole(resultSet.getString("role"));
        return personRoleView;
    }

}
