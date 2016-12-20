package fr.esimed.projet.businessServices;

import fr.esimed.projet.entities.RequirementType;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

/**
 * Created by maximedesogus on 01/12/2016.
 */
@Converter
public class RequirementTypeConverter implements AttributeConverter<RequirementType, Integer> {

    public Integer convertToDatabaseColumn(RequirementType attribute) {
        return attribute != null ? attribute.getCode() : null;
    }

    public RequirementType convertToEntityAttribute(Integer code) {
        if (code == null) {
            return null;
        }

        return RequirementType.getRequirementType(code);
    }
}
