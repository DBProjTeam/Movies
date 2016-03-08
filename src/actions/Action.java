package actions;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;

/**
 * Created by Vyacheslav.
 */
public abstract class Action {

    public abstract PageAction execute(HttpServletRequest request, HttpServletResponse response) throws SQLException;

}
