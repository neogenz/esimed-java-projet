package fr.esimed.projet.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;

/**
 * Created by maximedesogus on 25/11/2016.
 */
@Entity
public class UserResource implements Serializable {
    @Id
    @GeneratedValue
    private Long id;

    @NotNull
    @Size(min = 3, max = 120)
    @Column(nullable = false)
    private String firstname;

    @NotNull
    @Size(min = 3, max = 120)
    @Column(nullable = false)
    private String lastname;

    @NotNull
    @Column(nullable = false)
    @Size(min = 3, max = 3)
    private String trigramme;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getTrigramme() {
        return trigramme;
    }

    public void setTrigramme(String trigamme) {
        this.trigramme = trigamme;
    }
}
