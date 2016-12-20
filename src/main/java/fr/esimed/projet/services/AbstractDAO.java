package fr.esimed.projet.services;

import com.querydsl.core.types.EntityPath;
import com.querydsl.jpa.impl.JPAQuery;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

/**
 * Created by maximedesogus on 22/11/2016.
 */
@Repository
@Scope("singleton")
@Transactional
public abstract class AbstractDAO<Path extends EntityPath, T> {

    public AbstractDAO(Path qPath, Class<T> instanceClass) {
        this.qPath = qPath;
        this.instanceClass = instanceClass;
    }

    @PersistenceContext
    protected EntityManager em;

    @Inject
    protected PlatformTransactionManager transactionManager;

    protected Path qPath;

    protected Class<T> instanceClass;

    @PostConstruct
    protected abstract void initDb();

    public List<T> findAll() {
        JPAQuery query = new JPAQuery(em);
        return query.from(qPath)
                .fetch();
    }

    public T findOne(Long id) {
        JPAQuery<T> query = new JPAQuery<T>(em);
        return em.find(getInstanceClass(), id);
    }

    public T save(T objectToSave) {
        em.persist(objectToSave);
        return objectToSave;
    }

    public T delete(T objectToDelete) {
        if (objectToDelete == null) {
            return null;
        }
        em.remove(objectToDelete);
        return objectToDelete;
    }

    public T update(T objectToUpdate) {
        return null;
    }

    public Path getqPath() {
        return qPath;
    }

    public void setqPath(Path qPath) {
        this.qPath = qPath;
    }

    public Class<T> getInstanceClass() {
        return instanceClass;
    }

    public void setInstanceClass(Class<T> instanceClass) {
        this.instanceClass = instanceClass;
    }

    public EntityManager getEm() {
        return em;
    }

    public void setEm(EntityManager em) {
        this.em = em;
    }
}
