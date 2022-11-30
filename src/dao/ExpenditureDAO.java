package dao;

import dto.Expenditure;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ExpenditureDAO {
    private static ExpenditureDAO instance;
    String[] category = {"food", "hobby", "shopping", "living", "medical", "transpt", "finance", "other"};
    private ExpenditureDAO(){
    }
    public static ExpenditureDAO getInstance(){
        if(instance == null)
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
            if(conn != null)
                conn.close();
        }
        return resultCnt;
    }

    public int updateExpenditure(Expenditure expenditure) throws SQLException {
        int resultCnt = 0;
        Connection conn = null;
        try {
            conn = DBUtill.getConnection();
            String sql = "update expenditure set amount=?, expend_date=?, img=?, " +
                    "category=?, description=?, tag=? " +
                    "where expend_id=? and email_id=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, expenditure.getAmount());
            pstmt.setDate(2, expenditure.getExpend_date());
            pstmt.setString(3, expenditure.getImg());
            pstmt.setString(4, expenditure.getCategory());
            pstmt.setString(5, expenditure.getDescription());
            pstmt.setString(6, expenditure.getTagString());
            pstmt.setInt(7, expenditure.getExpend_id());
            pstmt.setString(8, expenditure.getEmail_id());

            resultCnt = pstmt.executeUpdate();

            pstmt.close();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(conn != null)
                conn.close();
        }
        return resultCnt;

    }

    public int deleteExpenditure(String email_id) throws SQLException {
        int resultCnt = 0;
        Connection conn = null;
        try {
            conn = DBUtill.getConnection();
            String sql = "delete from expenditure where expend_id=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email_id);
            resultCnt = pstmt.executeUpdate();
            pstmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(conn != null)
                conn.close();
        }
        return resultCnt;
    }

    public List<Expenditure> orderByDateDesc() throws SQLException {
        String sql = "select * from expenditure order by expend_date desc";
        return getExpList(sql);
    }

    public List<Expenditure> orderByDateAsc() throws SQLException {
        String sql = "select * from expenditure order by expend_date asc";
        return getExpList(sql);
    }

    public List<Expenditure> orderByAmountDesc() throws SQLException {
        String sql = "select * from expenditure order by amount desc";
        return getExpList(sql);
    }

    public List<Expenditure> orderByAmountAsc() throws SQLException {
        String sql = "select * from expenditure order by amount asc";
        return getExpList(sql);
    }

    public List<Expenditure> orderByCategory(String category) throws SQLException {
        String sql = "select * from expenditure where category like \""+category+"\"";
        return getExpList(sql);
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
            if(conn != null)
                conn.close();
        }
        return list;
    }

    // 소비 하나 검색
    public Expenditure searchExpenditureById(String expend_id) throws SQLException {
        Expenditure expenditure = null;
        Statement stmt = null;
        Connection conn = null;
        try {
            conn = DBUtill.getConnection();
            stmt = conn.createStatement();
            String sql = "select * from expenditure where expend_id = \"" + expend_id + "\"";
            System.out.print(sql);
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next()) {
                expenditure =
                        new Expenditure(rs.getInt(1), rs.getString(2), rs.getInt(3),
                                rs.getDate(4), rs.getString(5), rs.getString(6),
                                rs.getString(7), rs.getString(8));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(conn != null)
                conn.close();
        }
        return expenditure;
    }

    public int generateExpId() throws SQLException {
        int expId = 0;
        Statement stmt = null;
        Connection conn = null;
        try {
            conn = DBUtill.getConnection();
            stmt = conn.createStatement();
            String sql = "select * from expenditure order by expend_id desc limit 1";
            System.out.println(sql);
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next()) {
                expId = rs.getInt(1); // 가장 최신 데이터의 expend_id를 가져옴
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(conn != null)
                conn.close();
        }
        return expId + 1; //데이터가 아무것도 없다면 1을 반환
    }

    private boolean isCategory(String input) {
        System.out.println("입력값: "+input);
        for(String c : category)
            if(input.equals(c))
                return true;
        return false;
    }
}
