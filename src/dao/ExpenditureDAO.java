package dao;

import dto.Expenditure;
import utility.Calculator;

import java.sql.*;
import java.time.LocalDate;
import java.time.YearMonth;
import java.util.*;

public class ExpenditureDAO {
    private static ExpenditureDAO instance;
    String[] category = {"food", "hobby", "shopping", "living", "medical", "transpt", "finance", "other"};

    private ExpenditureDAO() {
    }

    public static ExpenditureDAO getInstance() {
        if (instance == null)
            instance = new ExpenditureDAO();
        return instance;
    }

    public int insertExpenditure(Expenditure expenditure) throws SQLException {
        int resultCnt = 0;
        Connection conn = null;

        try {
            conn = DBUtill.getConnection();
            String sql = "insert into expenditure values(?,?,?,?,?,?,?,?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, expenditure.getExpend_id());
            pstmt.setString(2, expenditure.getEmail_id());
            pstmt.setInt(3, expenditure.getAmount());
            pstmt.setDate(4, expenditure.getExpend_date());
            pstmt.setString(5, expenditure.getImg());
            pstmt.setString(6, expenditure.getCategory());
            pstmt.setString(7, expenditure.getDescription());
            pstmt.setString(8, expenditure.getTagString());

            resultCnt = pstmt.executeUpdate();

            pstmt.close();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null)
                conn.close();
        }
        return resultCnt;
    }

    public int deleteExpenditure(String expend_id) throws SQLException {
        int resultCnt = 0;
        Connection conn = null;
        try {
            conn = DBUtill.getConnection();
            String sql = "delete from expenditure where expend_id=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, expend_id);
            resultCnt = pstmt.executeUpdate();
            pstmt.close();
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        } finally {
            if (conn != null)
                conn.close();
        }
        return resultCnt;
    }

    public int deleteAllExpenditure(String email_id) throws SQLException {
        int resultCnt = 0;
        Connection conn = null;
        try {
            conn = DBUtill.getConnection();
            String sql = "delete from expenditure where email_id=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email_id);
            resultCnt = pstmt.executeUpdate();
            pstmt.close();
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        } finally {
            if (conn != null)
                conn.close();
        }
        return resultCnt;
    }

    public List<Expenditure> orderByDateDesc(String email_id) throws SQLException {
        String sql = "select * from expenditure  where email_id like \"" + email_id + "\" order by expend_date desc";
        return getExpList(sql);
    }

    public List<Expenditure> orderByDateAsc(String email_id) throws SQLException {
        String sql = "select * from expenditure  where email_id like \"" + email_id + "\" order by expend_date asc";
        return getExpList(sql);
    }

    public List<Expenditure> orderByAmountDesc(String email_id) throws SQLException {
        String sql = "select * from expenditure  where email_id like \"" + email_id + "\" order by amount desc";
        return getExpList(sql);
    }

    public List<Expenditure> orderByAmountAsc(String email_id) throws SQLException {
        String sql = "select * from expenditure  where email_id like \"" + email_id + "\" order by amount asc";
        return getExpList(sql);
    }

    public List<Expenditure> orderByCategory(String category, String email_id) throws SQLException {
        String sql = "select * from expenditure where category like \"" + category + "\" and email_id like \"" + email_id + "\"";
        return getExpList(sql);
    }

    public int generateExpId(String email_id) throws SQLException {
        String sql = "select * from expenditure  where email_id like \"" + email_id + "\" order by expend_id desc limit 1";
        return getIntValue(sql) + 1;
    }

    public int getSumOfWeeklyExp(String email_id) throws SQLException {
        String start = Calculator.getCurMonday();
        String end = Calculator.getCurSunday();
        String sql = "select sum(amount) from expenditure where expend_date between \"" + start + "\" and \"" + end + "\" and email_id like \"" + email_id + "\"";
        return getIntValue(sql);
    }

    public int getSumOfMonthlyExp(String email_id) throws SQLException {
        String start = Calculator.getCurFirstDay();
        String end = Calculator.getCurLastDay();
        String sql = "select sum(amount) from expenditure where expend_date between \"" + start + "\" and \"" + end + "\" and email_id like \"" + email_id + "\"";
        return getIntValue(sql);
    }

    public int[] getSumOfAllMonthlyExp(String email_id) throws SQLException {
        int[] sumArr = new int[12];
        for (int i = 0; i < sumArr.length; i++) {
            String start = Calculator.getFirstDay(i + 1);
            String end = Calculator.getLastDay(i + 1);
            String sql = "select sum(amount) from expenditure where expend_date between \"" + start + "\" and \"" + end + "\" and email_id like \"" + email_id + "\"";
            sumArr[i] = getIntValue(sql);
        }
        return sumArr;
    }

    public int getMonthlySavingRate(String email_id) throws SQLException {
        int currMonth = LocalDate.now().getMonthValue();
        int pre, crr;
        String preStart, preEnd;
        // 1. 지난주 소비
        if (currMonth == 1) {
            preStart = Calculator.getFirstDay(12);
            preEnd = Calculator.getLastDay(12);
        } else {
            preStart = Calculator.getFirstDay(currMonth - 1);
            preEnd = Calculator.getLastDay(currMonth - 1);
        }
        String preSql = "select sum(amount) from expenditure where expend_date between \"" + preStart + "\" and \"" + preEnd + "\" and email_id like \"" + email_id + "\"";
        pre = getIntValue(preSql);

        // 2. 이번달 소비
        crr = getSumOfMonthlyExp(email_id);

        return Calculator.getSavingRate(pre, crr);
    }

    public int getWeeklySavingRate(String email_id) throws SQLException {
        int pre, crr;
        // 1. 지난주 소비
        String preStart = Calculator.getPreWeekMonday();
        String preEnd = Calculator.getPreWeekSunday();
        String presql = "select sum(amount) from expenditure where expend_date between \"" + preStart + "\" and \"" + preEnd + "\" and email_id like \"" + email_id + "\"";
        pre = getIntValue(presql);
        // 2. 이번주 소비
        crr = getSumOfWeeklyExp(email_id);

        return Calculator.getSavingRate(pre, crr);
    }

    public int getRecordCnt(String email_id) throws SQLException {
        String sql = "select count(*) from expenditure where email_id like \"" + email_id + "\"";
        return getIntValue(sql);
    }

    public int getTodayRecordCnt(String email_id) throws SQLException {
        java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
        Calendar c = Calendar.getInstance();
        String sql = "select count(*) from expenditure where expend_date like \"" + formatter.format(c.getTime()) + "\" and email_id like \"" + email_id + "\"";
        return getIntValue(sql);
    }

    public List<Expenditure> getExpList(String query) throws SQLException {
        List<Expenditure> list = new ArrayList<Expenditure>();
        Statement stmt = null;
        Connection conn = null;
        try {
            conn = DBUtill.getConnection();
            stmt = conn.createStatement();
            String sql = query;
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Expenditure expenditure =
                        new Expenditure(rs.getInt(1), rs.getString(2), rs.getInt(3),
                                rs.getDate(4), rs.getString(5), rs.getString(6),
                                rs.getString(7), rs.getString(8));
                list.add(expenditure);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null)
                conn.close();
        }
        return list;
    }

    public int getIntValue(String query) throws SQLException {
        int value = 0;
        Statement stmt = null;
        Connection conn = null;
        try {
            conn = DBUtill.getConnection();
            stmt = conn.createStatement();
            String sql = query;
            System.out.println(sql);
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next()) {
                value = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null)
                conn.close();
        }
        return value;
    }

    private boolean isCategory(String input) {
        System.out.println("입력값: " + input);
        for (String c : category)
            if (input.equals(c))
                return true;
        return false;
    }

    public LinkedHashMap<String, Integer> getRangking(String email_id) throws SQLException {
        LinkedHashMap<String, Integer> rankList = new LinkedHashMap<String, Integer>(); // Map<카테고리, 개수>

        String sql = "select * from expenditure where email_id like \"" + email_id + "\""; //전체 리스트 가져오기
        List<Expenditure> expList = getExpList(sql);

        for (Expenditure ex : expList) {
            if (rankList.containsKey(ex.getCategory())) { // 맵에 존재하지 않는다면 1로 값 초기화
                System.out.println("이름: " + ex.getCategory() + "개수: " + rankList.get(ex.getCategory()));
                rankList.replace(ex.getCategory(), rankList.get(ex.getCategory()) + 1);
            } else {
                rankList.put(ex.getCategory(), 1); // 존재한다면 해당 카테고리의 개수를 1 증가
            }
        }
        return rankList;
    }
}
