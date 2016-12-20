package fr.esimed.projet.businessServices;

import fr.esimed.projet.entities.RequirementPrecisionType;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

/**
 * Created by maximedesogus on 01/12/2016.
 */
@Converter
public class RequirementPrecisionTypeConverter implements AttributeConverter<RequirementPrecisionType, Integer> {
    public Integer convertToDatabaseColumn(RequirementPrecisionType attribute) {
        return attribute != null ? attribute.getCode() : null;
    }

    public RequirementPrecisionType convertToEntityAttribute(Integer code) {
        if (code == null) {
            return null;
        }

        return RequirementPrecisionType.getRequirementPrecisionType(code);
    }
}
