package fr.esimed.projet.services;

import com.querydsl.jpa.impl.JPAQuery;
import fr.esimed.projet.entities.*;
import org.hibernate.Hibernate;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.List;

/**
 * Created by maximedesogus on 28/11/2016.
 */
@Transactional
@Scope("singleton")
@Repository
public class RequirementService extends AbstractDAO<QRequirement, Requirement> implements Serializable {

    public RequirementService() {
        super(QRequirement.requirement, Requirement.class);
    }

    protected void initDb() {

    }

//    public List<Requirement> findAllBy(Task task) {
//        JPAQuery<Requirement> jpaQuery = new JPAQuery(em);
//
//        jpaQuery.from(QRequirement.requirement).where(QTask.task.eq(task));
//        List<Requirement> requirements = jpaQuery.fetch();
//
//        return requirements;
//    }

    public List<Requirement> findAllBy(Project project) {
        JPAQuery<Requirement> jpaQuery = new JPAQuery(em);

        jpaQuery.from(QRequirement.requirement).where(QProject.project.eq(project));
        List<Requirement> requirements = jpaQuery.fetch();
        for (int i = 0; i < requirements.size(); i++) {
            Hibernate.initialize(requirements.get(i).getTasks());
        }
        return requirements;
    }

    @Override
    public Requirement findOne(Long id) {
        JPAQuery<Requirement> jpaQuery = new JPAQuery(em);

        jpaQuery.from(QRequirement.requirement).where(QRequirement.requirement.id.eq(id));
        Requirement requirement = jpaQuery.fetchOne();
        Hibernate.initialize(requirement.getTasks());
        return requirement;
    }
}
