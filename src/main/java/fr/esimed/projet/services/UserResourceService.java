package fr.esimed.projet.services;

import com.querydsl.jpa.impl.JPAQuery;
import fr.esimed.projet.entities.*;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;
import org.springframework.transaction.support.TransactionTemplate;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by maximedesogus on 28/11/2016.
 */
@Transactional
@Scope("singleton")
@Repository
public class UserResourceService extends AbstractDAO<QUserResource, UserResource> implements Serializable {

    @Inject
    DateService dateService;

    public UserResourceService() {
        super(QUserResource.userResource, UserResource.class);
    }

    @PostConstruct
    protected void initDb() {
        new TransactionTemplate(transactionManager).execute(new TransactionCallbackWithoutResult() {
            @Override
            protected void doInTransactionWithoutResult(TransactionStatus ts) {
//                UserResource userResource = new UserResource();
//                userResource.setFirstname("Steve");
//                userResource.setLastname("Jobs");
//                userResource.setTrigramme("STJ");
//                em.persist(userResource);
//
//                Project project = new Project();
//                project.setName("Apple II");
//                project.setManager(userResource);
//                project.setTrigramme("AP2");
//
//                em.persist(project);
//
//                Jalon jalon = new Jalon();
//                jalon.setLabel("Jalon 1");
//                jalon.setManager(userResource);
//                jalon.setDeliveryDate(dateService.addDaysTo(new Date(), 1));
//                jalon.setRealDeliveryDate(dateService.addDaysTo(new Date(), 2));
//                jalon.setProject(project);
//
//                Jalon jalon2 = new Jalon();
//                jalon2.setLabel("Jalon 2");
//                jalon2.setManager(userResource);
//                jalon2.setDeliveryDate(dateService.addDaysTo(new Date(), 2));
//                jalon2.setRealDeliveryDate(dateService.addDaysTo(new Date(), 3));
//                jalon2.setProject(project);
////
////                Jalon jalon3 = new Jalon();
////                jalon3.setLabel("Jalon 3");
////                jalon3.setManager(userResource);
////                jalon3.setDeliveryDate(dateService.addDaysTo(new Date(), 3));
////                jalon3.setRealDeliveryDate(dateService.addDaysTo(new Date(), 3));
////                jalon3.setProject(project);
//
//                em.persist(jalon);
//                em.persist(jalon2);
////                em.persist(jalon3);
//
//                Task task = new Task();
//                task.setDescription("Test 1 ");
//                task.setManager(userResource);
//                task.setLabel("Task 1");
//                task.setTheoreticalBeginDate(dateService.addDaysTo(new Date(), 1));
//                task.setRealBeginDate(dateService.addDaysTo(new Date(), 1));
//                task.setJalon(jalon);
//                task.setLoad(2);
////                task.setStarted(true);
////                task.setFinished(true);
//
//                Task task1 = new Task();
//                task1.setDescription("Test 2 ");
//                task1.setManager(userResource);
//                task1.setLabel("Task toto");
//                task1.setLoad(1);
//                task1.setTheoreticalBeginDate(dateService.addDaysTo(new Date(), 3));
//                task1.setRealBeginDate(dateService.addDaysTo(new Date(), 3));
//                task1.setJalon(jalon2);
////                task1.setStarted(true);
//
////                Task task2 = new Task();
////                task2.setDescription("Test 3 ");
////                task2.setManager(userResource);
////                task2.setLabel("Task titi");
////                task2.setLoad(6);
////                task2.setTheoreticalBeginDate(dateService.addDaysTo(new Date(), 2));
////                task2.setRealBeginDate(dateService.addDaysTo(new Date(), 2));
////                task2.setJalon(jalon2);
////                task2.setStarted(true);
//////               task2.setFinished(true);
////
////                Task task3 = new Task();
////                task3.setDescription("Test 4 ");
////                task3.setManager(userResource);
////                task3.setLabel("Task tata");
////                task3.setLoad(3);
////                task3.setTheoreticalBeginDate(dateService.addDaysTo(new Date(), 1));
////                task3.setRealBeginDate(dateService.addDaysTo(new Date(), 3));
////                task3.setJalon(jalon);
////                task3.setStarted(true);
////                task3.setFinished(true);
////
////                Task task4 = new Task();
////                task4.setDescription("Test 5 ");
////                task4.setManager(userResource);
////                task4.setLabel("Task tutu");
////                task4.setLoad(12);
////                task4.setTheoreticalBeginDate(dateService.addDaysTo(new Date(), 2));
////                task4.setRealBeginDate(dateService.addDaysTo(new Date(), 2));
////                task4.setJalon(jalon2);
////                task4.setStarted(true);
////                task4.setFinished(true);
//
//                Requirement requirement = new Requirement();
//                requirement.setDescription("Test avec type DATA");
//                requirement.setProject(project);
//                requirement.setRequirementPrecisionType(RequirementPrecisionType.DATA);
//                requirement.setRequirementType(RequirementType.FUNC);
//                requirement.addTask(task);
////                requirement.addTask(task1);
////                requirement.addTask(task2);
//
//                Requirement requirement2 = new Requirement();
//                requirement2.setDescription("Test sans type");
//                requirement2.setProject(project);
//                requirement2.setRequirementType(RequirementType.UNFUNC);
//                requirement2.addTask(task1);
//
////                Requirement requirement3 = new Requirement();
////                requirement3.setDescription("Osef");
////                requirement3.setProject(project);
////                requirement3.setRequirementPrecisionType(RequirementPrecisionType.SERVICE);
////                requirement3.setRequirementType(RequirementType.FUNC);
////                requirement3.addTask(task3);
////                requirement3.addTask(task4);
//
////              em.persist(jalon);
//
//                em.persist(task);
//                em.persist(task1);
////                em.persist(task2);
////                em.persist(task3);
////                em.persist(task4);
//
//                em.persist(requirement);
//                em.persist(requirement2);
//                em.persist(requirement3);

            }
        });
    }

    public UserResource findByTrigramme(String trigramme){
        JPAQuery<UserResource> jpaQuery = new JPAQuery(em);
        jpaQuery.from(QUserResource.userResource).where(QUserResource.userResource.trigramme.eq(trigramme));
        return jpaQuery.fetchOne();
    }
}
