package dao;

import entities.Image;
import util.Connector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Pavel on 30.05.2016.
 */
public class ImageDAO {
    public static final String ALL_IMAGES_IN_FILM = "SELECT Image.image_ID, Image.name  FROM  image INNER JOIN movie_image ON movie_image.image_ID = image.image_ID WHERE movie_Id=?";
    public static final String IMAGE_ON_ID = "SELECT * FROM image WHERE image_id = ?";
    Connection connection;

    public Image getImageById(int id) throws SQLException {
        Image image = new Image();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = Connector.getConnection();
            statement = connection.prepareStatement(IMAGE_ON_ID);
            statement.setInt(1, id);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                image = obtain(resultSet);
            }
        } finally {
            Connector.close(statement);
            Connector.close(resultSet);
        }
        return image;
    }

    public List<Image> getAllImagesByMovieId(int id) throws SQLException {
        List<Image> images = new ArrayList<Image>();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            connection = Connector.getConnection();
            statement = connection.prepareStatement(ALL_IMAGES_IN_FILM);
            statement.setInt(1, id);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                images.add(obtain(resultSet));
            }
        } finally {
            Connector.close(statement);
            Connector.close(resultSet);
        }

        return images;

    }

    private Image obtain(ResultSet resultSet) throws SQLException {
        Image img = new Image();
        img.setId(resultSet.getInt("image_ID"));
        img.setName(resultSet.getString("name"));
        return img;
    }

}
