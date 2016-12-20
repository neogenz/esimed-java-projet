package fr.esimed.projet.entities;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.Future;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by maximedesogus on 25/11/2016.
 */
@Entity
public class Task implements Serializable {
    @Id
    @GeneratedValue
    private Long id;

    @NotNull
    @Column(nullable = false)
    private String label;

    @NotNull
    @Column(nullable = false)
    private String description;

    @ManyToOne
    @NotNull
    private UserResource manager;

    @Column(nullable = false)
    @Temporal(TemporalType.DATE)
    @NotNull(message = "Merci de saisir une date théorique de début.")
    @DateTimeFormat(pattern = "dd/MM/yyyy")
//    @Future(message = "Veuillez saisir une date supérieur à la date du jour.")
    private Date theoreticalBeginDate;

//    @Column(nullable = false)
    @Temporal(TemporalType.DATE)
//    @NotNull(message = "Merci de saisir une date de début.")
    @DateTimeFormat(pattern = "dd/MM/yyyy")
//    @Future(message = "Veuillez saisir une date supérieur à la date du jour.")
    private Date realBeginDate;

    @NotNull
    @Column(nullable = false)
    private Integer load;

    @OneToOne
    private Task requiredTask;

    @NotNull
    @Column(nullable = false)
    private Boolean started;

    @NotNull
    @Column(nullable = false)
    private Boolean finished;

    @ManyToOne
    private Jalon jalon;

    public Task() {
//        this.requiredTask = new Task();
        this.jalon = new Jalon();
        this.started = false;
//        this.load = 0;
        this.finished = false;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public UserResource getManager() {
        return manager;
    }

    public void setManager(UserResource manager) {
        this.manager = manager;
    }

    public Date getTheoreticalBeginDate() {
        return theoreticalBeginDate;
    }

    public void setTheoreticalBeginDate(Date theoreticalBeginDate) {
        this.theoreticalBeginDate = theoreticalBeginDate;
    }

    public Integer getLoad() {
        return load;
    }

    public void setLoad(Integer load) {
        this.load = load;
    }

    public Task getRequiredTask() {
        return requiredTask;
    }

    public void setRequiredTask(Task requiredTask) {
        this.requiredTask = requiredTask;
    }

    public Boolean getStarted() {
        return started;
    }

    public void setStarted(Boolean started) {
        this.started = started;
    }

    public Boolean getFinished() {
        return finished;
    }

    public void setFinished(Boolean finished) {
        this.finished = finished;
    }

    public Jalon getJalon() {
        return jalon;
    }

    public void setJalon(Jalon jalon) {
        this.jalon = jalon;
    }

    public Date getRealBeginDate() {
        return realBeginDate;
    }

    public void setRealBeginDate(Date realBeginDate) {
        this.realBeginDate = realBeginDate;
    }
}
