package actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;

/**
 * Created by Vyacheslav.
 */
public class PageForward extends  Action{

    private String pagePath;

    public PageForward(String pagePath) {
        this.pagePath = pagePath;
    }

    @Override
    public PageAction execute(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        return new PageAction(pagePath, true);
    }


}
