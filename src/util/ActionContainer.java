package util;

import actions.*;
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
        actionMap.put("favorite_movies", new ViewFavoriteMovies());


        /*===============Movie=======================*/
        actionMap.put("movie", new MovieActions());

        /*=================Person====================*/
        actionMap.put("person",new PersonAction());

        actionMap.put("search", new Search());




        /*===============Other============================*/
        actionMap.put("index",new PageForward(PagePath.INDEX));
        actionMap.put("error", null); //TODO: error action
    }

    public static Action getAction(String name) {

        if (!actionMap.containsKey(name)) {
            return actionMap.get("error");
        }
        return actionMap.get(name);
    }

}
