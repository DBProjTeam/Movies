package dao.view;

import bin.PersonRoleView;
import dao.PersonDAO;
import entities.Person;
import util.Connector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by Станислав on 09.03.16.
 */
public class PersonRoleDAO {
    private  static  String GET_PERSON_ROLE_BY_MOVIE_ID="SELECT * FROM movie_person_role_view WHERE movie_ID=?";
    Connection connection;

    public List<PersonRoleView> getPersonRoleByMovieId(int movie_ID) throws SQLException {
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<PersonRoleView> personRoleViews = null;
        try {
            connection = Connector.getConnection();
            statement = connection.prepareStatement(GET_PERSON_ROLE_BY_MOVIE_ID);
            statement.setInt(1, movie_ID);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                personRoleViews.add(obtain(resultSet));
        }
    } finally {
            Connector.close(statement);
            Connector.close(resultSet);
        }
        return personRoleViews;
    }

    private PersonRoleView obtain(ResultSet resultSet)throws SQLException{
        PersonRoleView personRoleView = new PersonRoleView();
        PersonDAO personDAO = new PersonDAO();
        personRoleView.setPerson(personDAO.getByPK(resultSet.getInt("person_ID")));
        personRoleView.setMovie_ID(resultSet.getInt("movie_ID"));
        personRoleView.setRole(resultSet.getString("role"));
        return personRoleView;
    }

}
