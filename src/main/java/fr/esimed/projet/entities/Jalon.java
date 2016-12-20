package fr.esimed.projet.entities;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.Future;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by maximedesogus on 25/11/2016.
 */
@Entity
public class Jalon implements Serializable {
    @Id
    @GeneratedValue
    private Long id;

    @NotNull
    @Size(min = 3, max = 120)
    @Column(nullable = false)
    private String label;

    @Column(nullable = false)
    @Temporal(TemporalType.DATE)
    @NotNull(message = "Merci de saisir une date de livraison de début.")
    @DateTimeFormat(pattern = "dd/MM/yyyy")
//    @Future(message = "Veuillez saisir une date supérieur à la date du jour.")
    private Date deliveryDate;

    @ManyToOne
    @NotNull
    private UserResource manager;


    //    @Column(nullable = false)
    @Temporal(TemporalType.DATE)
//    @NotNull(message = "Merci de saisir une date de livraison réelle de début.")
    @DateTimeFormat(pattern = "dd/MM/yyyy")
//    @Future(message = "Veuillez saisir une date supérieur à la date du jour.")
    private Date realDeliveryDate;

    @ManyToOne
    private Project project;

    public Jalon() {
        this.project = new Project();
        this.manager = new UserResource();
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

    public Date getDeliveryDate() {
        return deliveryDate;
    }

    public void setDeliveryDate(Date deliveryDate) {
        this.deliveryDate = deliveryDate;
    }

    public UserResource getManager() {
        return manager;
    }

    public void setManager(UserResource manager) {
        this.manager = manager;
    }

    public Date getRealDeliveryDate() {
        return realDeliveryDate;
    }

    public void setRealDeliveryDate(Date realDeliveryDate) {
        this.realDeliveryDate = realDeliveryDate;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null || this.id == null) {
            return false;
        }
        Jalon jalon = (Jalon) obj;
        if (this.id.equals(jalon.getId())) {
            return true;
        }
        return false;
    }
}
