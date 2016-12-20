package fr.esimed.projet.services;

import fr.esimed.projet.entities.Project;
import fr.esimed.projet.entities.QProject;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;

/**
 * Created by maximedesogus on 25/11/2016.
 */
@Transactional
@Scope("singleton")
@Repository
public class ProjectService extends AbstractDAO<QProject, Project> implements Serializable{

    public ProjectService() {
        super(QProject.project, Project.class);
    }

    protected void initDb() {

    }

}
