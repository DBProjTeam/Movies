package bean;

import dao.UserDAO;
import entities.User;

import java.io.Serializable;
import java.sql.SQLException;

/**
 * Created by Pavel on 26.05.2016.
 */
public class NameOfPerson implements Serializable {
    public String getNameOfUser(int userId) throws SQLException {
        UserDAO d = new UserDAO();
        User u = d.getByPK(userId);
        String s = u.getName();
        return s;
    }
}
