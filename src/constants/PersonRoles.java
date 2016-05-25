package constants;

/**
 * Created by Vyacheslav.
 */
public enum PersonRoles {

    DIRECTOR("Режиссер"), PRODUCER("Продюсер"), SCENARIO("Сценарий"), OPERATOR("Оператор"), ACTOR("Актер");

    private String name;

    PersonRoles(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}
