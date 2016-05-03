package dao;


import entities.Genre;
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
public class GenreDAO {
    private  static final  String GET_ALL_GENRE ="SELECT * FROM `genre`";
    Connection connection;

    public List<Genre> getAllGenre () throws SQLException{
        List<Genre> list = new ArrayList<Genre>();
        Statement statement = null;
        ResultSet resultSet = null;
        try{
            connection = Connector.getConnection();
            statement = connection.createStatement();
            resultSet= statement.executeQuery(GET_ALL_GENRE);
            while (resultSet.next()){

            }
        }finally {
            Connector.close(resultSet);
            Connector.close(statement);
        }
        return list;
    }
    private Genre obtain(ResultSet resultSet) throws SQLException{
        Genre genre=new Genre();
        genre.setGenre(resultSet.getString("genre"));
        return genre;
    }

}
