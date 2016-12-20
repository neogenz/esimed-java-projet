/*TODO :
 - Faire une vue liste de manager 7
*/

package fr.esimed.projet.controllers;

import com.google.gson.*;
import fr.esimed.projet.businessServices.*;
import fr.esimed.projet.entities.*;
import fr.esimed.projet.services.JalonService;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import javax.validation.Valid;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * Created by maximedesogus on 28/11/2016.
 */
@Controller
@RequestMapping({"/projets"})
public class ProjectController {

    @Inject
    ProjectBusinessService projectBusinessService;

    @Inject
    UserResourceBusinessService userResourceBusinessService;

    @Inject
    RequirementBusinessService requirementBusinessService;

    @Inject
    TaskBusinessService taskBusinessService;

    @Inject
    JalonBusinessService jalonBusinessService;

    @Inject
    JalonService jalonService;

    @RequestMapping({"/"})
    public String all(Model model) {
        model.addAttribute("projects", projectBusinessService.findAll());

        return "project/list";
    }

    @RequestMapping("/{id}")
    @Transactional
    public String details(@PathVariable Long id, Model model) {
//        Gson gson = new GsonBuilder()
//                .registerTypeAdapter(Requirement.class, new RequirementSerializer()).setPrettyPrinting().create();
//        String json = gson.toJson(requirementBusinessService.findAllBy(projectBusinessService.findOneBy(id)));

        model.addAttribute("taskRequiredError", null);
        model.addAttribute("hasTaskRequiredError", false);
        loadProjectDetails(id, model);


        return "project/details";
    }

    @RequestMapping({"/nouveau"})
    public String add(Model model) {
        Project newProject = new Project();
        List<UserResource> userResources = userResourceBusinessService.findAll();
        model.addAttribute("newProject", newProject);
        model.addAttribute("userResources", userResources);
        model.addAttribute("projectHasCreated", false);
        return "project/add";
    }

    @RequestMapping({"/sauvegarder"})
    public String save(@ModelAttribute("newProject") @Valid Project newProject, BindingResult result, Model model) {
        model.addAttribute("projectHasCreated", false);
        if (!result.hasErrors()) {
            newProject.setManager(userResourceBusinessService.findById(newProject.getManager().getId()));
            projectBusinessService.save(newProject);
            Project newProjectReseted = new Project();
            model.addAttribute("newProject", newProjectReseted);
            model.addAttribute("projectHasCreated", true);
        }
        return "project/add";
    }

    @RequestMapping({"/{id}/exigences/nouveau"})
    public String addRequirement(@PathVariable Long id, Model model) {
        model.addAttribute("requirementHasCreated", false);
        Project targetedProject = projectBusinessService.findOneBy(id);
        Requirement newRequirement = new Requirement();
        newRequirement.setProject(targetedProject);
        List<RequirementType> requirementTypeList = new ArrayList<RequirementType>(Arrays.asList(RequirementType.values()));
        RequirementType requirementTypeFunc = RequirementType.FUNC;
        List<RequirementPrecisionType> requirementPrecisionTypeList = new ArrayList<RequirementPrecisionType>(Arrays.asList(RequirementPrecisionType.values()));

        model.addAttribute("requirementPrecisionTypeList", requirementPrecisionTypeList);
        model.addAttribute("requirementTypeList", requirementTypeList);
        model.addAttribute("newRequirement", newRequirement);
        model.addAttribute("requirementTypeFunc", requirementTypeFunc);
        model.addAttribute("project", targetedProject);


        return "requirement/add";
    }

    @RequestMapping({"/exigences/sauvegarder"})
    public String saveRequirement(@ModelAttribute("newRequirement") @Valid Requirement newRequirement, BindingResult result, Model model) {
        model.addAttribute("requirementHasCreated", false);
        Project targetedProject = projectBusinessService.findOneBy(newRequirement.getProject().getId());
        if (!result.hasErrors()) {
            newRequirement.setProject(targetedProject);
//            projectBusinessService.save(newProject);
            requirementBusinessService.save(newRequirement);
            Requirement newRequirementReseted = new Requirement();
            newRequirementReseted.setProject(targetedProject);
            model.addAttribute("newRequirement", newRequirementReseted);
            model.addAttribute("requirementHasCreated", true);
        }

        List<RequirementType> requirementTypeList = new ArrayList<RequirementType>(Arrays.asList(RequirementType.values()));
        RequirementType requirementTypeFunc = RequirementType.FUNC;
        List<RequirementPrecisionType> requirementPrecisionTypeList = new ArrayList<RequirementPrecisionType>(Arrays.asList(RequirementPrecisionType.values()));

        model.addAttribute("requirementPrecisionTypeList", requirementPrecisionTypeList);
        model.addAttribute("requirementTypeList", requirementTypeList);
        model.addAttribute("requirementTypeFunc", requirementTypeFunc);
        model.addAttribute("project", targetedProject);

        return "requirement/add";
    }

    @RequestMapping({"/{id}/taches/nouveau"})
    public String addTask(@PathVariable Long id, Model model) {
        model.addAttribute("taskHasCreated", false);
        Project targetedProject = projectBusinessService.findOneBy(id);
        List<UserResource> userResources = userResourceBusinessService.findAll();
//        UserResource manager = userResourceBusinessService.findByTrigramme("STJ");
        TaskBusinessService.TaskForm newTask = new TaskBusinessService.TaskForm();
//        newTask.getTask().setManager(manager);
        newTask.getTask().setRequiredTask(new Task());
        List<Jalon> jalons = jalonBusinessService.getAllNotFinishedJalonBy(targetedProject);
        List<Task> tasks = new ArrayList<fr.esimed.projet.entities.Task>();
        if (jalons.size() > 0) {
            tasks = taskBusinessService.findAllNotFinishedBy(jalons.get(0));
        }
        List<Requirement> requirements = requirementBusinessService.findAllBy(targetedProject);

        model.addAttribute("project", targetedProject);
        model.addAttribute("jalons", jalons);
        model.addAttribute("tasks", tasks);
        model.addAttribute("requirements", requirements);
        model.addAttribute("newTask", newTask);
        model.addAttribute("userResources", userResources);

        return "task/add";
    }

    @RequestMapping({"/{id}/taches/sauvegarder"})
    public String saveTask(@PathVariable Long id, @ModelAttribute("newTask") @Valid TaskBusinessService.TaskForm newTask, BindingResult result, Model model) {
        model.addAttribute("taskHasCreated", false);
        Project targetedProject = projectBusinessService.findOneBy(id);
        List<UserResource> userResources = userResourceBusinessService.findAll();
        List<Jalon> jalons = jalonBusinessService.getAllNotFinishedJalonBy(targetedProject);
        List<Requirement> requirements = requirementBusinessService.findAllBy(targetedProject);
        List<Task> tasks = new ArrayList<fr.esimed.projet.entities.Task>();
        if (jalons.size() > 0) {
            tasks = taskBusinessService.findAllNotFinishedBy(jalons.get(0));
        }

        if (!result.hasErrors()) {
            newTask.getTask().setManager(userResourceBusinessService.findById(newTask.getTask().getManager().getId()));
            newTask.getTask().setJalon(jalonBusinessService.findOneBy(newTask.getTask().getJalon().getId()));
            if (newTask.getTask().getRequiredTask().getId() != null) {
                newTask.getTask().setRequiredTask(taskBusinessService.findOneBy(newTask.getTask().getRequiredTask().getId()));
            } else {
                newTask.getTask().setRequiredTask(null);
            }

            taskBusinessService.save(newTask.getTask());

            Requirement currentRequirement = null;
            for (String requirementId : newTask.getRequirementsIds().split(",")) {
                currentRequirement = requirementBusinessService.findOneBy(Long.parseLong(requirementId));
                currentRequirement.addTask(newTask.getTask());
                requirementBusinessService.merge(currentRequirement);
            }

            TaskBusinessService.TaskForm newTaskReseted = new TaskBusinessService.TaskForm();
            newTaskReseted.getTask().setRequiredTask(new Task());
            model.addAttribute("newTask", newTaskReseted);
            model.addAttribute("taskHasCreated", true);
        }
        model.addAttribute("project", targetedProject);
        model.addAttribute("jalons", jalons);
        model.addAttribute("tasks", tasks);
        model.addAttribute("requirements", requirements);
        model.addAttribute("userResources", userResources);

        return "task/add";
    }

    @RequestMapping({"/{id}/jalons/nouveau"})
    public String addJalon(@PathVariable Long id, Model model) {
        model.addAttribute("jalonHasCreated", false);
        List<UserResource> userResources = userResourceBusinessService.findAll();
        Project targetedProject = projectBusinessService.findOneBy(id);
        UserResource manager = userResourceBusinessService.findByTrigramme("STJ");
        Jalon newJalon = new Jalon();
        newJalon.setProject(targetedProject);

        model.addAttribute("userResources", userResources);
        model.addAttribute("newJalon", newJalon);
        model.addAttribute("project", targetedProject);

        return "jalon/add";
    }

    @RequestMapping({"/jalons/sauvegarder"})
    public String saveJalon(@ModelAttribute("newJalon") @Valid Jalon newJalon, BindingResult result, Model model) {
        model.addAttribute("jalonHasCreated", false);
        Project targetedProject = projectBusinessService.findOneBy(newJalon.getProject().getId());
        List<UserResource> userResources = userResourceBusinessService.findAll();

        if (!result.hasErrors()) {
            newJalon.setProject(targetedProject);
            newJalon.setManager(userResourceBusinessService.findById(newJalon.getManager().getId()));
            jalonBusinessService.save(newJalon);
            Jalon newJalonReseted = new Jalon();
            newJalonReseted.setProject(targetedProject);
            model.addAttribute("newJalon", newJalonReseted);
            model.addAttribute("jalonHasCreated", true);
        }
        model.addAttribute("project", targetedProject);
        model.addAttribute("userResources", userResources);

        return "jalon/add";
    }

    @RequestMapping({"/{id}/tache/{taskId}/demarrer"})
    public String startTask(@PathVariable Long id, @PathVariable Long taskId, Model model) {
        Task task = taskBusinessService.findOneBy(taskId);
        if (task.getRequiredTask() != null && !task.getRequiredTask().getFinished()) {
            model.addAttribute("taskRequiredError", task.getRequiredTask());
            model.addAttribute("hasTaskRequiredError", true);
        } else {
            model.addAttribute("taskRequiredError", null);
            model.addAttribute("hasTaskRequiredError", false);
            task.setStarted(true);
            task.setRealBeginDate(new Date());
            taskBusinessService.merge(task);
        }

        loadProjectDetails(id, model);

        return "project/details";
    }

    @RequestMapping({"/{id}/tache/{taskId}/terminer"})
    public String finishTask(@PathVariable Long id, @PathVariable Long taskId, Model model) {
        Task task = taskBusinessService.findOneBy(taskId);
        task.setFinished(true);
        taskBusinessService.merge(task);

        Jalon jalon = task.getJalon();
        if(jalonBusinessService.isFinished(jalon)){
            jalon.setRealDeliveryDate(new Date());
        }
        jalonBusinessService.merge(jalon);

        return details(id, model);
    }

    @RequestMapping(value = {"/jalon/{id}/taches"}, method = RequestMethod.GET)
    public
    @ResponseBody
    String getAllTaskByJalon(@PathVariable("id") Long id, Model model) {

        class TaskSerializer implements JsonSerializer<Task> {
            public JsonElement serialize(Task src, Type typeOfSrc, JsonSerializationContext context) {

                JsonObject object = new JsonObject();
                String label = src.getLabel();
                object.addProperty("label", label);

                Long id = src.getId();
                object.addProperty("id", id);

                return object;
            }
        }


        Gson gson = new GsonBuilder()
                .registerTypeAdapter(Task.class, new TaskSerializer()).setPrettyPrinting().create();
        List<Task> tasks = taskBusinessService.findAllBy(jalonBusinessService.findOneBy(id));

        String json = gson.toJson(tasks);

        return json;
    }

    private void loadProjectDetails(Long id, Model model) {
        Boolean isBlankProject = false;
        Project project = projectBusinessService.findOneBy(id);
        List<Requirement> requirements = new ArrayList<Requirement>();
        List<TaskBusinessService.TaskDetailled> taskDetailleds = new ArrayList<TaskBusinessService.TaskDetailled>();
        List<Jalon> jalons = new ArrayList<Jalon>();
        List<JalonBusinessService.JalonWithProgressState> jalonWithProgressStates = new ArrayList<JalonBusinessService.JalonWithProgressState>();
        Integer progressPercentageOfProjectByJalon = 0;
        Integer progressPercentageOfCurrentJalon = 0;
        Integer progressPercentageOfProjectByRequirement = 0;
        Date theoricalEndDateOfProject = new Date();
        if (project != null) {
            requirements = requirementBusinessService.findAllBy(project);
            taskDetailleds = taskBusinessService.getListOfTaskDetailledFrom(requirements, project);
            jalons = jalonService.findAllBy(project);
            jalonWithProgressStates = jalonBusinessService.getListOfJalonWithProgressStateBy(project);
            progressPercentageOfProjectByJalon = projectBusinessService.getProgressPercentageOf(project);
            progressPercentageOfCurrentJalon = jalonBusinessService.getProgressPercentageOf(jalonBusinessService.findCurrentBy(project));
            progressPercentageOfProjectByRequirement = projectBusinessService.getProgressPercentageGlobalByExigenceOf(project);
            theoricalEndDateOfProject = projectBusinessService.getTheoricalEndDateOf(project);
            if (jalons.size() == 0 || requirements.size() == 0) {
                isBlankProject = true;
            }

        }

        model.addAttribute("project", project);
        model.addAttribute("requirements", requirements);
        model.addAttribute("taskDetailleds", taskDetailleds);
        model.addAttribute("jalons", jalons);
        model.addAttribute("jalonWithProgressStates", jalonWithProgressStates);
        model.addAttribute("progressPercentageOfProjectByJalon", progressPercentageOfProjectByJalon);
        model.addAttribute("progressPercentageOfCurrentJalon", progressPercentageOfCurrentJalon);
        model.addAttribute("progressPercentageOfProjectByRequirement", progressPercentageOfProjectByRequirement);
        model.addAttribute("theoricalEndDateOfProject", theoricalEndDateOfProject);
        model.addAttribute("isBlankProject", isBlankProject);
    }

}
