package utility;

import java.time.YearMonth;
import java.util.Calendar;

public class Calculator {
    //현재 날짜 월요일
    public static String getCurMonday() {
        java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
        Calendar c = Calendar.getInstance();
        c.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
        return formatter.format(c.getTime());
    }

    //현재 날짜 일요일
    public static String getCurSunday() {
        java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
        Calendar c = Calendar.getInstance();
        c.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
        c.add(c.DATE, 7);
        return formatter.format(c.getTime());
    }
    public static String getCurFirstDay() {
        YearMonth ym = YearMonth.now();
        return ym.atDay(1).toString();
    }

    public static String getCurLastDay() {
        YearMonth ym = YearMonth.now();
        return ym.atEndOfMonth().toString();
    }
}
