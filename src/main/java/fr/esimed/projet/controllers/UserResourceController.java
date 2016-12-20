package fr.esimed.projet.controllers;

import fr.esimed.projet.businessServices.UserResourceBusinessService;
import fr.esimed.projet.entities.UserResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.inject.Inject;
import javax.validation.Valid;

/**
 * Created by maximedesogus on 02/12/2016.
 */
@Controller
@RequestMapping({"/ressources"})
public class UserResourceController {

    @Inject
    UserResourceBusinessService userResourceBusinessService;

    @RequestMapping({"/nouveau"})
    public String add(Model model) {
        model.addAttribute("userResourceHasCreated", false);
        UserResource newUserResource = new UserResource();
        model.addAttribute("newUserResource", newUserResource);

        return "userResource/add";
    }

    @RequestMapping({"/sauvegarder"})
    public String save(@ModelAttribute("newUserResource") @Valid UserResource newUserResource, BindingResult result, Model model) {
        model.addAttribute("userResourceHasCreated", false);

        if (!result.hasErrors()) {
            userResourceBusinessService.save(newUserResource);
            UserResource newUserResourceReseted = new UserResource();
            model.addAttribute("newUserResource", newUserResourceReseted);
            model.addAttribute("userResourceHasCreated", true);
        }

        return "userResource/add";
    }
}
