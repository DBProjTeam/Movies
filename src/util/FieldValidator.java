package util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by Pavel on 01.06.2016.
 */

public class FieldValidator {

    private static final String PASSWORD_PATTERN = "^[A-Za-z0-9]{4,20}$";
    private static final String NAME_SURNAME_PATTERN = "^[A-Za-zА-Яа-я]{2,30}$";
    private static final String TITLE_PATTERN = ".*$";

    private static final String EMAIL_PATTERN = "^[_A-Za-z0-9-+]+(.[_A-Za-z0-9-]+)*@"
            + "[A-Za-z0-9-]+(.[A-Za-z0-9]+)*(.[A-Za-z]{2,})$";
    private static final String POSITIVE_INTEGER_PATTERN = "^([1-9][0-9]{0,9})|(0)$";
    private static final String TIME_PATTERN = "^(([0-1]*[0-9])|(2[0-3])):[0-5][0-9]$";
    private static final String DATE_PATTERN = "^(([0-2]*[0-9])|(3[0-1]))[.](([0]*[0-9])|(1[0-2]))[.](2[0-9]{3})$";

    public static boolean isPasswordValid(String field) {
        return validateField(field, PASSWORD_PATTERN);
    }

    public static boolean isNameFieldValid(String field) {
        return validateField(field, NAME_SURNAME_PATTERN);
    }

    public static boolean isMovieTitleValid(String field) {
        return validateField(field, TITLE_PATTERN);
    }

    public static boolean isEmailValid(String email) {
        return validateField(email, EMAIL_PATTERN);
    }

    public static boolean isPositiveInteger(String number) {
        return validateField(number, POSITIVE_INTEGER_PATTERN);
    }

    public static boolean isTimeValid(String time) {
        return validateField(time, TIME_PATTERN);
    }

    public static boolean isDateValid(String date) {
        return validateField(date, DATE_PATTERN);
    }

    /**
     * Validates string by regular expression
     *
     * @param field  string to validate
     * @param regexp pattern
     * @return true if string matches regexp, false otherwise
     */
    private static boolean validateField(String field, String regexp) {
        if (field == null) {
            return false;
        }
        Pattern pattern = Pattern.compile(regexp);
        Matcher matcher = pattern.matcher(field);
        return matcher.matches();
    }

    public static boolean isTextFieldValid(String field, int maxLength) {
        if ((field != null) && (field.length() <= maxLength) && (!field.isEmpty())) {
            return true;
        }
        return false;
    }

}
