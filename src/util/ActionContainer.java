package util;

import actions.Action;
import actions.MovieActions;
import actions.PageForward;
import actions.Search;
import actions.profile.ChangeProfile;
import actions.profile.Login;
import actions.profile.Registration;
import actions.user.ViewFavoriteMovies;
import constants.PagePath;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Vyacheslav.
 */
public class ActionContainer {

    private static Map<String, Action> actionMap = new HashMap<String, Action>();

    static {
        /*===============Login/Registration========= */
        actionMap.put("registration_page", new PageForward(PagePath.REGISTRATION));
        actionMap.put("registration", new Registration());
        actionMap.put("registration_done", new PageForward(PagePath.REGISTRATION_DONE));
        actionMap.put("login", new Login());

        /*===============Profile==================== */
        actionMap.put("profile_page", new PageForward(PagePath.PROFILE));
        actionMap.put("profile_change", new ChangeProfile());
        actionMap.put("profile_change", new ChangeProfile());
        actionMap.put("favorite_movies", new ViewFavoriteMovies());

        actionMap.put("movie_page", new MovieActions());

        actionMap.put("search", new Search());




        actionMap.put("error", null); //TODO: error action
    }

    public static Action getAction(String name) {

        if (!actionMap.containsKey(name)) {
            return actionMap.get("error");
        }
        return actionMap.get(name);
    }

}
