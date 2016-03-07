package entities;

import java.io.Serializable;

/**
 * Created by Едик  Лисогуб on 07.03.2016.
 */
public class Genre implements Serializable {
    /*
    private final static String GET_GERNE ="SELECT * FROM genre WHERE genre=?;";
    private final static String GET_ALL_GENRES="SELECT * FROM genre;";
    private final static String NUMBER_OF_GANRES="SELECT COUNT(`genre`) FROM `movies`.`genre`;";
    private final static String GET_ALL_GENRES_ORDER_BY_ASC="SELECT   `genre` FROM `movies`.`genre` ORDER BY COUNT(`genre`) ASC;";
    private final static String GET_ALL_GENRES_ORDER_BY_DESC="SELECT   `genre` FROM `movies`.`genre` ORDER BY COUNT(`genre`) DESC;";

    TODO:часть запросов связаных с жанром
        можно исполльзовать при сортировки по жанрам
*/
    private String genre;


    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }
}
