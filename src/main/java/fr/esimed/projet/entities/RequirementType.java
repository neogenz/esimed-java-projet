package fr.esimed.projet.entities;

/**
 * Created by maximedesogus on 25/11/2016.
 */
public enum RequirementType {
    FUNC(0, "Fonctionnelle"),
    UNFUNC(1, "Non fonctionnelle");

    private Integer code = 0;
    private String label;

    private RequirementType(Integer code, String label) {
        this.code = code;
        this.label = label;
    }

    /**
     * Récupération des données.
     *
     * @param code
     * @return
     */
    public static RequirementType getRequirementType(Integer code) {

        RequirementType[] resources = RequirementType.values();

        for (RequirementType res : resources) {
            if (res.code == code) {
                return res;
            }
        }

        return UNFUNC;
    }

    public int getCode() {
        return this.code;
    }

    public String getLabel() {
        return label;
    }

    public String toString() {
        return this.label;
    }
}
