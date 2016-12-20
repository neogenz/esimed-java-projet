package fr.esimed.projet.businessServices;

import fr.esimed.projet.entities.Jalon;
import fr.esimed.projet.entities.Project;
import fr.esimed.projet.entities.Requirement;
import fr.esimed.projet.entities.Task;
import fr.esimed.projet.services.DateService;
import fr.esimed.projet.services.JalonService;
import fr.esimed.projet.services.TaskService;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by maximedesogus on 29/11/2016.
 */
@Service
@Scope("singleton")
public class TaskBusinessService {
    @Inject
    TaskService taskService;

    @Inject
    JalonBusinessService jalonBusinessService;

    @Inject
    DateService dateService;

    public List<Task> findAllBy(Project project) {
        return taskService.findAllBy(project);
    }

    public List<TaskDetailled> getListOfTaskDetailledFrom(List<Requirement> requirements, Project project) {
        List<TaskDetailled> tasksDetailleds = new ArrayList<TaskDetailled>();
        Jalon currentJalon = jalonBusinessService.findCurrentBy(project);
        TaskDetailled current = null;
        Boolean thisTaskAlreadyExist = false;

        for (Requirement requirement : requirements) {
            for (Task task : requirement.getTasks()) {

                for (TaskDetailled taskDetailled : tasksDetailleds) {
                    if (taskDetailled.getTask().equals(task)) {
                        thisTaskAlreadyExist = true;
                        taskDetailled.addRequirement(requirement);
                    }
                }
                if (!thisTaskAlreadyExist) {
                    current = new TaskDetailled();
                    current.setTask(task);
                    current.addRequirement(requirement);
                    if(current.getTask().getJalon().equals(currentJalon)){
                        current.setInCurrentJalon(true);
                    }
                    tasksDetailleds.add(current);
                }

                thisTaskAlreadyExist = false;
            }

        }

        return tasksDetailleds;
    }


    public List<Task> findAllBy(Jalon jalon) {
        return taskService.findAllBy(jalon);
    }

    public List<Task> findAllNotFinishedBy(Jalon jalon) {
        List<Task> allTasks = taskService.findAllBy(jalon);
        List<Task> notFinishedTasks = new ArrayList<Task>();
        for (Task task : allTasks) {
            if (!task.getFinished()) {
                notFinishedTasks.add(task);
            }
        }
        return notFinishedTasks;
    }

    public Boolean oneTaskIsStartedOrFinishedIn(Jalon jalon) {
        List<Task> tasks = this.findAllBy(jalon);
        for (Task task : tasks) {
            if (task.getFinished() || task.getStarted()) {
                return true;
            }
        }
        return false;
    }

    public List<Task> findAllDescBy(Jalon jalon) {
        return taskService.findAllDescBy(jalon);
    }

    public Task getLastTaskToDoBy(Jalon jalon) {
        List<Task> tasks = taskService.findAllDescBy(jalon);
        if (tasks.size() == 0) {
            return null;
        }
        Task lastTask = tasks.get(0);
        Date dateOfLastTask = lastTask.getTheoreticalBeginDate();
        for (Task task : tasks) {
            if (task.getStarted()) {
                if (dateService.addDaysTo(task.getRealBeginDate(), task.getLoad()).after(task.getRealBeginDate())) {
                    lastTask = task;
                }
            } else {
                if (dateService.addDaysTo(task.getTheoreticalBeginDate(), task.getLoad()).after(dateOfLastTask)) {
                    lastTask = task;
                }
            }
        }

        return lastTask;
    }

    public Task findOneBy(Long id) {
        return taskService.findOne(id);
    }


    public class TaskDetailled {

        private Task task;

        private List<Requirement> requirementParent;

        private Boolean isInCurrentJalon;

        public TaskDetailled() {
            this.requirementParent = new ArrayList<Requirement>();
            this.isInCurrentJalon = false;
        }

        public Task getTask() {
            return task;
        }

        public void setTask(Task task) {
            this.task = task;
        }

        public List<Requirement> getRequirementParent() {
            return requirementParent;
        }

        public void setRequirementParent(List<Requirement> requirementParent) {
            this.requirementParent = requirementParent;
        }

        public void addRequirement(Requirement requirement) {
            this.requirementParent.add(requirement);
        }

        public Boolean getInCurrentJalon() {
            return isInCurrentJalon;
        }

        public void setInCurrentJalon(Boolean inCurrentJalon) {
            isInCurrentJalon = inCurrentJalon;
        }
    }

    public static class TaskForm {

        private Task task;

        private String requirementsIds;

        public TaskForm() {
            this.task = new Task();
        }

        public Task getTask() {
            return task;
        }

        public void setTask(Task task) {
            this.task = task;
        }

        public String getRequirementsIds() {
            return requirementsIds;
        }

        public void setRequirementsIds(String requirementsIds) {
            this.requirementsIds = requirementsIds;
        }
    }

    public void save(Task task) {
        taskService.save(task);
    }

    public void merge(Task task) {
        taskService.merge(task);
    }
}
