package util;

import actions.Action;
import actions.PageForward;
import actions.profile.Registration;
import constants.PagePath;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Vyacheslav.
 */
public class ActionContainer {

    private static Map<String, Action> actionMap = new HashMap<String, Action>();

    static {
        actionMap.put("registration_page", new PageForward(PagePath.REGISTRATION));
        actionMap.put("registration", new Registration());
        actionMap.put("registration_done", new PageForward(PagePath.REGISTRATION_DONE));



        actionMap.put("error", null); //TODO: error action
    }

    public static Action getAction(String name) {

        if (!actionMap.containsKey(name)) {
            return actionMap.get("error");
        }
        return actionMap.get(name);
    }

}
