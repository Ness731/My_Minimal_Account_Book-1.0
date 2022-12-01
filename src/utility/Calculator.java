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

    public static String getPreWeekMonday() {
        java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
        Calendar c = Calendar.getInstance();
        c.add(Calendar.DATE, -7);
        c.set(Calendar.DAY_OF_WEEK,Calendar.MONDAY);
        return formatter.format(c.getTime());
    }

    public static String getPreWeekSunday() {
        java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
        Calendar c = Calendar.getInstance();
        c.add(Calendar.DATE, -7);
        c.set(Calendar.DAY_OF_WEEK,Calendar.SUNDAY);
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

    public static String getFirstDay(int i) {
        YearMonth ym = YearMonth.of(YearMonth.now().getYear(), i);
        return ym.atDay(1).toString();
    }

    public static String getLastDay(int i) {
        YearMonth ym = YearMonth.of(YearMonth.now().getYear(), i);
        return ym.atEndOfMonth().toString();
    }

    public static int getSavingRate(int pre, int crr) {
        if (pre < crr)
            return 0;
        return (pre - crr) / pre * 100;
    }
}
