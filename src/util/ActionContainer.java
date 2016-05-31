package util;

import actions.*;
import actions.profile.ChangeProfile;
import actions.profile.Login;
import actions.profile.Logout;
import actions.profile.Registration;
import actions.search.FullSearch;
import actions.search.Search;
import actions.user.Rate;
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
        actionMap.put("logout", new Logout());


        /*===============Search=======================*/
        actionMap.put("full_search", new FullSearch());
        actionMap.put("search", new Search());


        /*===============Movie=======================*/
        actionMap.put("movie", new MovieAction());
        actionMap.put("rating", new Rate());


        /*=================Person====================*/
        actionMap.put("person",new PersonAction());
        actionMap.put("all_persons_on_film", new PageForward(PagePath.ALL_PERSONS_ON_FILM));





        /*===============Other============================*/
        actionMap.put("index", new IndexActions());
        actionMap.put("error", null); //TODO: error action
    }

    public static Action getAction(String name) {

        if (!actionMap.containsKey(name)) {
            return actionMap.get("error");
        }
        return actionMap.get(name);
    }

}
