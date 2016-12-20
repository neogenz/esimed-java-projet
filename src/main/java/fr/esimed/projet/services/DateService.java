package fr.esimed.projet.services;

//import org.joda.time.Days;
//import org.joda.time.LocalDate;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import java.util.Calendar;
import java.util.Date;

/**
 * Created by maximedesogus on 29/11/2016.
 */
@Service
@Scope("singleton")
public class DateService {
    public Date addDaysTo(final Date date, Integer nbOfDays) {
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        c.add(Calendar.DATE, nbOfDays);
        return c.getTime();
    }

    public Date substractDaysTo(final Date date, Integer nbOfDays) {
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        c.add(Calendar.DATE, -nbOfDays);
        return c.getTime();
    }

    public Integer getDifferenceInDaysBetween(Date dateA, Date dateB) {
        Long diff = dateA.getTime() - dateB.getTime();
        Long diffDays = diff / (24 * 60 * 60 * 1000);
        return diffDays != null ? diffDays.intValue() : null;
//        return Days.daysBetween(
//                new LocalDate(dateA.getTime()),
//                new LocalDate(dateB.getTime())).getDays();
//        LocalDate localDateA = new LocalDate(dateA.getTime());
//        LocalDate localDateB = new LocalDate(dateB.getTime());
//
//        return Days.daysBetween(localDateA, localDateB).getDays();
    }
}
