package fr.esimed.projet.businessServices;

import fr.esimed.projet.entities.Jalon;
import fr.esimed.projet.entities.Project;
import fr.esimed.projet.entities.Requirement;
import fr.esimed.projet.services.DateService;
import fr.esimed.projet.services.ProjectService;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.Date;
import java.util.List;

/**
 * Created by maximedesogus on 28/11/2016.
 */
@Service
@Scope("singleton")
public class ProjectBusinessService {

    @Inject
    ProjectService projectService;

    @Inject
    JalonBusinessService jalonBusinessService;

    @Inject
    RequirementBusinessService requirementBusinessService;

    @Inject
    DateService dateService;

    public List<Project> findAll() {
        return projectService.findAll();
    }

    public Project findOneBy(Long id) {
        return projectService.findOne(id);
    }

    /**
     * Calcul le taux d'avancement du projet en pourcentage en fonction de ses jalons terminés.
     *
     * @param project
     * @return {Integer} percentage
     */
    public Integer getProgressPercentageOf(Project project) {
        List<Jalon> jalons = jalonBusinessService.findAllBy(project);
        Integer nbTotalOfJalons = new Integer(jalons.size());
        if (nbTotalOfJalons == 0) {
            return 0;
        }
        Integer nbTotalOfJalonsFinished = 0;

        for (Jalon jalon : jalons) {
            if (jalonBusinessService.isFinished(jalon)) {
                nbTotalOfJalonsFinished++;
            }
        }


        Integer percentageOfOneJalonInProject = 100 / nbTotalOfJalons;
        Integer progressPercentageOfCurrentJalon = 0;
        if (!nbTotalOfJalonsFinished.equals(nbTotalOfJalons)) {
            progressPercentageOfCurrentJalon = jalonBusinessService.getProgressPercentageOf(jalonBusinessService.findCurrentBy(project));
        }
        Integer progressPercentageOfCurrentJalonInProject = progressPercentageOfCurrentJalon * percentageOfOneJalonInProject / 100;

        return ((nbTotalOfJalonsFinished * 100) / nbTotalOfJalons) + progressPercentageOfCurrentJalonInProject;
    }

    public Integer getProgressPercentageGlobalByExigenceOf(Project project) {
        if(project == null){
            return 0;
        }
        List<Requirement> requirements = requirementBusinessService.findAllBy(project);
        Integer nbTotalOfRequirements = requirements.size();
        Integer nbOfFinishedRequirements = 0;

        if (nbTotalOfRequirements == 0) {
            return 0;
        }

        for (Requirement requirement : requirements) {
            if (requirementBusinessService.isFinished(requirement)) {
                nbOfFinishedRequirements++;
            }
        }

        return ((nbOfFinishedRequirements * 100) / nbTotalOfRequirements);
    }

    public Date getTheoricalEndDateOf(Project project) {
        List<Jalon> jalons = jalonBusinessService.findAllDescBy(project);
        if (jalons == null || jalons.size() == 0) {
            return new Date();
        }
        Date theoriticalEndDate = jalons.get(0).getDeliveryDate();
        Integer difference = 0;

        for (Jalon jalon : jalons) {
            if (jalonBusinessService.isFinished(jalon)) {
                if (jalon.getRealDeliveryDate() != null) {
                    if (jalon.getDeliveryDate().after(jalon.getRealDeliveryDate())) {
                        difference = dateService.getDifferenceInDaysBetween(jalon.getDeliveryDate(), jalon.getRealDeliveryDate());
                        theoriticalEndDate = dateService.substractDaysTo(theoriticalEndDate, difference);
//                    return theoriticalEndDate;
                    } else if (jalon.getRealDeliveryDate().after(jalon.getDeliveryDate())) {
                        difference = dateService.getDifferenceInDaysBetween(jalon.getRealDeliveryDate(), jalon.getDeliveryDate());
                        theoriticalEndDate = dateService.addDaysTo(theoriticalEndDate, difference);
//                    return theoriticalEndDate;
                    }
                }
            }
        }
        return theoriticalEndDate;
    }

    public void save(Project project) {
        projectService.save(project);
    }
}
