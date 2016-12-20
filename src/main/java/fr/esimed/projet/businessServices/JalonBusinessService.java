package fr.esimed.projet.businessServices;

import fr.esimed.projet.entities.Jalon;
import fr.esimed.projet.entities.Project;
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
public class JalonBusinessService {

    @Inject
    JalonService jalonService;

    @Inject
    TaskBusinessService taskBusinessService;

    @Inject
    DateService dateService;

    public List<Jalon> findAllBy(Project project) {
        return jalonService.findAllBy(project);
    }

    public Boolean isFinished(Jalon jalon) {
        List<Task> tasks = taskBusinessService.findAllBy(jalon);
        if (tasks.size() == 0) {
            return false;
        }
        for (Task task : tasks) {
            if (!task.getFinished()) {
                return false;
            }
        }
        return true;
    }

    public Jalon findCurrentBy(Project project) {

        List<Jalon> jalons = jalonService.findAllDescBy(project);
        List<Jalon> jalonsAsc = jalonService.findAllAscBy(project);

        if (jalons.size() == 0) {
            return null;
        }

        if (noneJalonHaveTaskStartedBy(project)) {
            for (Jalon jalon : jalonsAsc) {
                if (!isFinished(jalon)) {
                    return jalon;
                }
            }
            return null;
        }

        for (Jalon jalon : jalons) {
            if (taskBusinessService.oneTaskIsStartedOrFinishedIn(jalon)) {
                return jalon;
            }
        }


        return jalons.get(jalons.size() - 1);
    }

    public Boolean noneJalonHaveTaskStartedBy(Project project) {
        List<Jalon> jalons = findAllBy(project);
        for (Jalon jalon : jalons) {
            if (haveTaskStarted(jalon)) {
                return false;
            }
        }
        return true;
    }

    public Boolean haveTaskStarted(Jalon jalon) {
        List<Task> tasks = taskBusinessService.findAllBy(jalon);
        for (Task task : tasks) {
            if (task.getStarted() && !task.getFinished()) {
                return true;
            }
        }
        return false;
    }

    /**
     * Calcul le taux d'avancement du projet en pourcentage en fonction de ses tâches terminés.
     *
     * @param jalon
     * @return {Integer} percentage
     */
    public Integer getProgressPercentageOf(Jalon jalon) {
        if (jalon == null) {
            return 0;
        }
        List<Task> tasks = taskBusinessService.findAllBy(jalon);
        Integer nbTotalOfTasks = new Integer(tasks.size());
        Double nbTotalOfTasksFinished = 0D;

        for (Task task : tasks) {
            if (task.getFinished()) {
                nbTotalOfTasksFinished++;
            } else if (task.getStarted()) {
                nbTotalOfTasksFinished += 0.5;
            }
        }

        return new Double((nbTotalOfTasksFinished * 100) / nbTotalOfTasks).intValue();
    }

    public List<JalonWithProgressState> getListOfJalonWithProgressStateBy(Project project) {
        List<JalonWithProgressState> jalonWithProgressStateList = new ArrayList<JalonWithProgressState>();
        JalonWithProgressState jalonWithProgressState = null;
        List<Jalon> jalons = this.findAllBy(project);
        Jalon currentJalon = this.findCurrentBy(project);
        for (Jalon jalon : jalons) {
            jalonWithProgressState = new JalonWithProgressState();
            jalonWithProgressState.setJalon(jalon);
            jalonWithProgressState.setCurrent(jalon.equals(currentJalon));
            jalonWithProgressState.setFinished(this.isFinished(jalon));
            jalonWithProgressState.setProgressPercentage(this.getProgressPercentageOf(jalon));
            jalonWithProgressState.setTheoricalEndDate(this.getEndDateOf(jalon));
            jalonWithProgressStateList.add(jalonWithProgressState);
        }
        return jalonWithProgressStateList;
    }

    public Date getEndDateOf(Jalon jalon) {
        List<Task> tasks = taskBusinessService.findAllDescBy(jalon);
        Task lastTask = taskBusinessService.getLastTaskToDoBy(jalon); // tasks.get(0);
        if (lastTask == null) {
            return null;
        }
        if (lastTask.getStarted()) {
            return dateService.addDaysTo(lastTask.getRealBeginDate(), lastTask.getLoad());
        } else {
            return dateService.addDaysTo(lastTask.getTheoreticalBeginDate(), lastTask.getLoad());
        }
    }

    public List<Jalon> findAllDescBy(Project project) {
        return jalonService.findAllDescBy(project);
    }

    public Jalon findOneBy(Long id) {
        return jalonService.findOne(id);
    }

    public List<Jalon> getAllNotFinishedJalonBy(Project project) {
        List<Jalon> jalons = jalonService.findAllBy(project);
        List<Jalon> jalonsNotFinished = new ArrayList<Jalon>();
        for (Jalon jalon : jalons) {
            if (!this.isFinished(jalon)) {
                jalonsNotFinished.add(jalon);
            }
        }

        return jalonsNotFinished;
    }

    public void save(Jalon jalon) {
        jalonService.save(jalon);
    }

    public void merge(Jalon jalon){
        jalonService.merge(jalon);
    }


    public class JalonWithProgressState {

        public JalonWithProgressState() {
        }

        public JalonWithProgressState(Jalon jalon, Boolean isCurrent) {
            this.jalon = jalon;
            this.isCurrent = isCurrent;
        }

        Jalon jalon;
        Boolean isCurrent;
        Boolean isFinished;
        Integer progressPercentage;
        Date theoricalEndDate;


        public Date getTheoricalEndDate() {
            return theoricalEndDate;
        }

        public void setTheoricalEndDate(Date theoricalEndDate) {
            this.theoricalEndDate = theoricalEndDate;
        }

        public Jalon getJalon() {
            return jalon;
        }

        public void setJalon(Jalon jalon) {
            this.jalon = jalon;
        }

        public Boolean getCurrent() {
            return isCurrent;
        }

        public void setCurrent(Boolean current) {
            isCurrent = current;
        }

        public Boolean getFinished() {
            return isFinished;
        }

        public void setFinished(Boolean finished) {
            isFinished = finished;
        }

        public Integer getProgressPercentage() {
            return progressPercentage;
        }

        public void setProgressPercentage(Integer progressPercentage) {
            this.progressPercentage = progressPercentage;
        }
    }
}
