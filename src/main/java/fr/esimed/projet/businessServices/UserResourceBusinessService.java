package fr.esimed.projet.businessServices;

import fr.esimed.projet.entities.UserResource;
import fr.esimed.projet.services.UserResourceService;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

/**
 * Created by maximedesogus on 30/11/2016.
 */
@Service
@Scope("singleton")
public class UserResourceBusinessService {

    @Inject
    UserResourceService userResourceService;

    public UserResource findByTrigramme(String trigramme){
        return userResourceService.findByTrigramme(trigramme);
    }

    public UserResource findById(Long id){
        return userResourceService.findOne(id);
    }

    public void save(UserResource userResource){
        userResourceService.save(userResource);
    }

    public List<UserResource> findAll(){
        return userResourceService.findAll();
    }
}
