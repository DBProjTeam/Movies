package dao;

import entities.Role;
import util.Connector;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Станислав on 02.05.16.
 */
public class RoleDAO {
    private static final String GET_ALL_ROLE = "SELECT * FROM `role`";
    private Connection connection;
    public List<Role> getAllRole()throws SQLException{
        List<Role> list = new ArrayList<Role>();
        ResultSet resultSet = null;
        Statement statement=null;
        connection=Connector.getConnection();
        try{
            statement=connection.createStatement();
            resultSet=statement.executeQuery(GET_ALL_ROLE);
           while (resultSet.next()) {
               list.add(obtain(resultSet));
            }
        }finally {
            Connector.close(statement);
            Connector.close(resultSet);
        }
        return list;
    }

    private Role obtain(ResultSet resultSet) throws SQLException{
        Role role= new Role();
        role.setRole(resultSet.getString("role"));
        return role;
    }
}
