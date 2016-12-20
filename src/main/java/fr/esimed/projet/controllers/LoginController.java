package fr.esimed.projet.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by maximedesogus on 02/12/2016.
 */
@Controller
@RequestMapping({"/authentification"})
public class LoginController {

    @Inject
    HttpServletRequest httpServletRequest;

    @RequestMapping({"/deconnexion"})
    public String all(Model model) {
        try {
            httpServletRequest.logout();
        } catch (Exception e) {

        }
        return "login";
    }
}
