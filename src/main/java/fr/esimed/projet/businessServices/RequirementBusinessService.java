package fr.esimed.projet.businessServices;

import com.querydsl.jpa.impl.JPAQuery;
import fr.esimed.projet.entities.*;
import fr.esimed.projet.services.ProjectService;
import fr.esimed.projet.services.RequirementService;
import fr.esimed.projet.services.TaskService;
import org.hibernate.Hibernate;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import java.util.List;

/**
 * Created by maximedesogus on 28/11/2016.
 */
@Service
@Scope("singleton")
public class RequirementBusinessService {

    @Inject
    RequirementService requirementService;

    @Inject
    ProjectService projectService;

    @Inject
    TaskService taskService;

    public List<Requirement> findAllBy(Project project) {
        return requirementService.findAllBy(project);
    }

    public Boolean isFinished(Requirement requirement) {
        if(requirement.getTasks().size() == 0 )
        {
            return false;
        }
        for (Task task : requirement.getTasks()) {
            if (!task.getFinished()) {
                return false;
            }
        }
        return true;
    }

    public void save(Requirement requirement) {
        requirementService.save(requirement);
    }

    public Requirement findOneBy(Long id) {
        return requirementService.findOne(id);
    }

    @Transactional
    public void merge(Requirement requirement){
        requirementService.getEm().merge(requirement);
    }
}
