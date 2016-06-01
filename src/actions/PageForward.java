package actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Vyacheslav.
 */
public class PageForward extends  Action{

    private String pagePath;

    public PageForward(String pagePath) {
        this.pagePath = pagePath;
    }

    @Override
    public PageAction execute(HttpServletRequest request, HttpServletResponse response) {
        return new PageAction(pagePath, true);
    }


}
