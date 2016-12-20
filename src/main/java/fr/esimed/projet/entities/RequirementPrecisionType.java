package fr.esimed.projet.entities;

/**
 * Created by maximedesogus on 25/11/2016.
 */
public enum RequirementPrecisionType {
    DATA(0, "Données"),
    PERFS(1, "Performances"),
    UI(2, "IHM"),
    QUALITY(3, "Qualité"),
    SERVICE(4, "Service");

    private String label;
    private Integer code = 0;

    private RequirementPrecisionType(Integer code, String label) {
        this.label = label;
        this.code = code;
    }

    public String toString() {
        return this.label;
    }

    /**
     * Récupération des données.
     *
     * @param code
     * @return
     */
    public static RequirementPrecisionType getRequirementPrecisionType(Integer code) {

        RequirementPrecisionType[] resources = RequirementPrecisionType.values();

        for (RequirementPrecisionType res : resources) {
            if (res.code == code) {
                return res;
            }
        }

        return DATA;
    }

    public int getCode() {
        return this.code;
    }

    public String getLabel() {
        return label;
    }
}
