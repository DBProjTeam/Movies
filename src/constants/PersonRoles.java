package constants;

/**
 * Created by Vyacheslav.
 */
public enum PersonRoles {

    DIRECTOR("DIRECTOR"), PRODUCER("producer"), SCENARIO("scenario"), OPERATOR("operator"), ACTOR("actor"), ACTRISS("actress");

    private String name;

    PersonRoles(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}
