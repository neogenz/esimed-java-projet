package fr.esimed.projet.services;

import java.util.List;

/**
 * Created by maximedesogus on 22/11/2016.
 */
public interface IService<T> {
    void initDb();
    List<T> findAll();
    T findOne(Long id);
    T save(T objectToSave);
    T delete(T objectToDelete);
    T update(T objectToUpdate);
}
