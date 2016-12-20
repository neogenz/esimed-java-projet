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
 * Created by maximedesogus on 29/11/2016.
 */
@Transactional
@Scope("singleton")
@Repository
public class TaskService extends AbstractDAO<QTask, Task> implements Serializable {

    public TaskService() {
        super(QTask.task, Task.class);
    }

    protected void initDb() {

    }

    public List<Task> findAllBy(Project project) {
        JPAQuery<Task> jpaQuery = new JPAQuery(em);

        jpaQuery.from(QTask.task).where(QProject.project.eq(project));
        List<Task> tasks = jpaQuery.fetch();
        for (int i = 0; i < tasks.size(); i++) {
            Hibernate.initialize(tasks.get(i).getManager());
            Hibernate.initialize(tasks.get(i).getJalon());
            Hibernate.initialize(tasks.get(i).getRequiredTask());
        }
        return tasks;
    }

    public List<Task> findAllBy(Jalon jalon) {
        JPAQuery<Task> jpaQuery = new JPAQuery(em);

        jpaQuery.from(QTask.task).where(QJalon.jalon.eq(jalon));
        List<Task> tasks = jpaQuery.fetch();
        for (int i = 0; i < tasks.size(); i++) {
            Hibernate.initialize(tasks.get(i).getManager());
            Hibernate.initialize(tasks.get(i).getJalon());
            Hibernate.initialize(tasks.get(i).getRequiredTask());
        }
        return tasks;
    }

    public List<Task> findAllDescBy(Jalon jalon) {
        JPAQuery<Task> jpaQuery = new JPAQuery(em);

        jpaQuery.from(QTask.task).where(QJalon.jalon.eq(jalon));
        jpaQuery.orderBy(QTask.task.theoreticalBeginDate.desc());
        List<Task> tasks = jpaQuery.fetch();
        for (int i = 0; i < tasks.size(); i++) {
            Hibernate.initialize(tasks.get(i).getManager());
            Hibernate.initialize(tasks.get(i).getJalon());
            Hibernate.initialize(tasks.get(i).getRequiredTask());
        }
        return tasks;
    }

    public void merge(Task task) {
        em.merge(task);
    }
}
