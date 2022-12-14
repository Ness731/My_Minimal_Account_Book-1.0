package utility;

import java.time.YearMonth;
import java.util.Calendar;
import java.util.LinkedHashMap;
import java.util.Map;

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
        c.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
        return formatter.format(c.getTime());
    }

    public static String getPreWeekSunday() {
        java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
        Calendar c = Calendar.getInstance();
        c.add(Calendar.DATE, -6);
        c.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
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
        if (pre == 0)
            return 0;
        System.out.println("pre:" + pre + " crr:" + crr);

        double pre_ = pre;
        double crr_ = crr;
        double rate = ((crr_ - pre_) / pre_) * -100;
        System.out.println("rate: " + rate);

        if (rate < 0)
            return 0;
        if (rate > 100)
            return 100;
        return (int) rate;
    }

    public static LinkedHashMap<String, Integer> getBestCategory(LinkedHashMap<String, Integer> rankList) {
        String best = "";
        int max = 0, curr = 0;
        for (Map.Entry entry : rankList.entrySet()) {
            curr = Integer.parseInt(entry.getValue().toString());
            if (Integer.parseInt(entry.getValue().toString()) > max) { // 현재 카테고리의 개수가 이전 최댓값보다 크다면
                best = entry.getKey().toString();
                max = curr;
            }
        }
        LinkedHashMap<String, Integer> result = new LinkedHashMap<String, Integer>();
        result.put(best, max);
        return result;
    }
}
