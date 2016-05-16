package util;

import actions.*;
import actions.editor.country.AddCountry;
import actions.editor.country.ShowCountries;
import actions.editor.person.AddPerson;
import actions.editor.person.DeletePerson;
import actions.editor.person.ShowPersons;
import actions.editor.person.UpdatePerson;
import actions.profile.*;
import actions.search.FullSearch;
import actions.search.PSearch;
import actions.search.Search;
import actions.user.AddMovieFavoriteUser;
import actions.user.DeleteMovieFromFavoriteUser;
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
        actionMap.put("change_profile", new ChangeProfile());
        actionMap.put("favorite_movies", new ViewFavoriteMovies());
        actionMap.put("logout", new Logout());


        /*===============Search=======================*/
        actionMap.put("search_page", new PageForward(PagePath.FULL_SEARCH));
        actionMap.put("full_search", new FullSearch());
        actionMap.put("search", new Search());
        actionMap.put("psearch", new PSearch());


        /*===============Movie=======================*/
        actionMap.put("movie", new MovieAction());
        actionMap.put("rating", new Rate());
        actionMap.put("add_favorite_movie", new AddMovieFavoriteUser());
        actionMap.put("delete_favorite_movie", new DeleteMovieFromFavoriteUser());
        actionMap.put("add_comment", new AddComment());


        /*=================Person====================*/
        actionMap.put("person",new PersonAction());
        //actionMap.put("all_persons_on_film", new PageForward(PagePath.ALL_PERSONS_ON_FILM));
        actionMap.put("all_persons_on_film",new PageAllPersonFilm());

        /*=================Editor====================*/

        //country
        actionMap.put("show_countries", new ShowCountries());
        actionMap.put("add_country_page", new PageForward(PagePath.EDITOR_ADD_COUNTRY));
        actionMap.put("add_country", new AddCountry());
        //person
        actionMap.put("show_persons", new ShowPersons());
        actionMap.put("add_person_page", new PageForward(PagePath.EDITOR_ADD_PERSON));
        actionMap.put("add_person", new AddPerson());
        actionMap.put("update_person_page", new PageForward(PagePath.EDITOR_UPDATE_PERSON));
        actionMap.put("update_person", new UpdatePerson());
        actionMap.put("delete_person", new DeletePerson());

        /*===============Other============================*/
        actionMap.put("index", new IndexActions());
    }

    public static Action getAction(String name) {

        if (!actionMap.containsKey(name)) {
            return actionMap.get("error");
        }
        return actionMap.get(name);
    }

}
