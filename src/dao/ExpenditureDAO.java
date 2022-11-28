package dao;

import dto.Expenditure;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ExpenditureDAO {
    private static ExpenditureDAO instance;

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
            String sql = "insert into expenditure values(?,?,?,?,?,?,?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, expenditure.getExpend_id());
            pstmt.setInt(2, expenditure.getAmount());
            pstmt.setDate(3, expenditure.getExpend_date());
            pstmt.setString(4, expenditure.getImg());
            pstmt.setString(5, expenditure.getCategory());
            pstmt.setString(6, expenditure.getDescription());
            pstmt.setString(7, expenditure.getTag());

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
                    "where expend_id=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(2, expenditure.getAmount());
            pstmt.setDate(3, expenditure.getExpend_date());
            pstmt.setString(4, expenditure.getImg());
            pstmt.setString(5, expenditure.getCategory());
            pstmt.setString(6, expenditure.getDescription());
            pstmt.setString(7, expenditure.getTag());
            pstmt.setInt(1, expenditure.getExpend_id());

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

    // 부서의 전체 리스트
    public List<Expenditure> listExpenditure() throws SQLException {
        List<Expenditure> list = new ArrayList<Expenditure>();
        Statement stmt = null;
        Connection conn = null;
        try {
            conn = DBUtill.getConnection();
            stmt = conn.createStatement();
            String sql = "select * from expenditure order by expend_id";
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Expenditure expenditure =
                        new Expenditure(rs.getInt(1), rs.getInt(2), rs.getDate(3),
                                rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
                list.add(expenditure);
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            if(conn != null)
                conn.close();
        }
        return list;
    }

    // 부서 하나 검색
    public Expenditure searchExpenditure(String expend_id) throws SQLException {
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
                        new Expenditure(rs.getInt(1), rs.getInt(2), rs.getDate(3),
                                rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            if(conn != null)
                conn.close();
        }
        return expenditure;
    }
}
