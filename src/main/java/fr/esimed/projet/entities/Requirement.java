package fr.esimed.projet.entities;

import fr.esimed.projet.businessServices.RequirementPrecisionTypeConverter;
import fr.esimed.projet.businessServices.RequirementTypeConverter;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by maximedesogus on 25/11/2016.
 */
@Entity
public class Requirement implements Serializable {

    public Requirement() {
        this.tasks = new ArrayList<Task>();
    }

    @Id
    @GeneratedValue
    private Long id;

    @NotNull
    @Column(nullable = false)
    private String description;

    @NotNull
    @Column(nullable = false)
    @Convert(converter = RequirementTypeConverter.class)
    private RequirementType requirementType;

    @Convert(converter = RequirementPrecisionTypeConverter.class)
    private RequirementPrecisionType requirementPrecisionType;

    @ManyToOne
    private Project project;

    @ManyToMany(cascade = CascadeType.MERGE)
    private List<Task> tasks;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public RequirementType getRequirementType() {
        return requirementType;
    }

    public void setRequirementType(RequirementType requirementType) {
        this.requirementType = requirementType;
    }

    public RequirementPrecisionType getRequirementPrecisionType() {
        return requirementPrecisionType;
    }

    public void setRequirementPrecisionType(RequirementPrecisionType requirementPrecisionType) {
        this.requirementPrecisionType = requirementPrecisionType;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public List<Task> getTasks() {
        return tasks;
    }

    public void setTasks(List<Task> tasks) {
        this.tasks = tasks;
    }

    @Override
    public String toString() {
        return "{" +
                "description='" + description + '\'' +
                ", requirementType=" + requirementType +
                ", requirementPrecisionType=" + requirementPrecisionType +
                ", project=" + project +
                '}';
    }

    public void addTask(Task task) {
        this.tasks.add(task);
    }
}
