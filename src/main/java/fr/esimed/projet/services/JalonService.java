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
public class JalonService extends AbstractDAO<QJalon, Jalon> implements Serializable {

    public JalonService() {
        super(QJalon.jalon, Jalon.class);
    }

    protected void initDb() {

    }

    public List<Jalon> findAllBy(Project project) {
        JPAQuery<Jalon> jpaQuery = new JPAQuery(em);

        jpaQuery.from(QJalon.jalon).where(QProject.project.eq(project));
        List<Jalon> jalons = jpaQuery.fetch();
        for(int i = 0; i < jalons.size(); i++){
            Hibernate.initialize(jalons.get(i).getManager());
//            Hibernate.initialize(tasks.get(i).getJalon());
//            Hibernate.initialize(tasks.get(i).getRequiredTask());
        }
        return jalons;
    }

    public List<Jalon> findAllDescBy(Project project){
        JPAQuery<Jalon> jpaQuery = new JPAQuery(em);

        //Du plus vieux au plus récent
        jpaQuery.from(QJalon.jalon).where(QProject.project.eq(project)).orderBy(QJalon.jalon.deliveryDate.desc());
        List<Jalon> jalons = jpaQuery.fetch();

        return jalons;
    }

    public List<Jalon> findAllAscBy(Project project){
        JPAQuery<Jalon> jpaQuery = new JPAQuery(em);

        //Du plus vieux au plus récent
        jpaQuery.from(QJalon.jalon).where(QProject.project.eq(project)).orderBy(QJalon.jalon.deliveryDate.asc());
        List<Jalon> jalons = jpaQuery.fetch();

        return jalons;
    }


    public void merge(Jalon jalon){
        em.merge(jalon);
    }

}
