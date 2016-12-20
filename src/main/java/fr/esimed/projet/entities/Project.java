package fr.esimed.projet.entities;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;

/**
 * Created by maximedesogus on 25/11/2016.
 */
@Entity
public class Project implements Serializable{

    @Id
    @GeneratedValue
    private Long id;

    @NotNull
    @Size(min=3, max=120)
    @Column(nullable = false)
    private String name;

    @NotNull
    @Column(nullable = false)
    @Size(min = 3, max = 3)
    private String trigramme;

    @ManyToOne
    private UserResource manager;

    public Project() {
        this.manager = new UserResource();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public UserResource getManager() {
        return manager;
    }

    public void setManager(UserResource manager) {
        this.manager = manager;
    }

    public String getTrigramme() {
        return trigramme;
    }

    public void setTrigramme(String trigramme) {
        this.trigramme = trigramme;
    }
}
