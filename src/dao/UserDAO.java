package dao;

import dto.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
    private static UserDAO instance;

    private UserDAO() {
    }

    public static UserDAO getInstance() {
        if (instance == null)
            instance = new UserDAO();
        return instance;
    }

    public boolean insertUser(User user) throws SQLException {
        System.out.println("***User ID = "+user.getEmail_id());
        Connection conn = null;
        try {
            conn = DBUtill.getConnection();
            String sql = "insert into user values(?,?,?,?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getEmail_id());
            pstmt.setString(2, user.getPwd());
            pstmt.setString(3, user.getUname());
            pstmt.setString(4, user.getProfile_img());

            pstmt.executeUpdate();
            pstmt.close();

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            if (conn != null)
                conn.close();
        }
        return true;
    }

    public int updateUser(User user) throws SQLException {
        int resultCnt = 0;
        Connection conn = null;

        try {
            conn = DBUtill.getConnection();
            String sql = "update user set pwd=?, uname=?, profile_img=? where email_id=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getPwd());
            pstmt.setString(2, user.getUname());
            pstmt.setString(3, user.getProfile_img());
            pstmt.setString(4, user.getEmail_id());

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

    public int changePwd(String newPwd, String email_id) throws SQLException {
        int resultCnt = 0;
        Connection conn = null;

        try {
            conn = DBUtill.getConnection();
            String sql = "update user set pwd=? where email_id=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, newPwd);
            pstmt.setString(2, email_id);

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

    public int deleteUser(String email_id) throws SQLException {
        int resultCnt = 0;
        Connection conn = null;

        try {
            conn = DBUtill.getConnection();
            String sql = "delete from user where email_id=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email_id);

            // sql ??????
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

    // ?????? ?????? ?????????
    public List<User> listUser() throws SQLException {
        List<User> list = new ArrayList<User>();
        Statement stmt = null;
        Connection conn = null;

        try {
            conn = DBUtill.getConnection();
            stmt = conn.createStatement();
            String sql = "select * from User order by email_id";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                User user = new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
                list.add(user);
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            if (conn != null)
                conn.close();
        }

        return list;
    }

    // ?????? ?????? ??????
    public User searchUser(String email_id) throws SQLException {
        User user = null;
        Statement stmt = null;
        Connection conn = null;

        try {
            conn = DBUtill.getConnection();
            stmt = conn.createStatement();

            String sql = "select * from user where email_id = \"" + email_id + "\"";
            System.out.print(sql);
            ResultSet rs = stmt.executeQuery(sql);

            if (rs.next()) {
                user = new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            if (conn != null)
                conn.close();
        }
        return user;
    }

    public void withdrawalUser(String email_id) throws SQLException {
        ExpenditureDAO.getInstance().deleteAllExpenditure(email_id);
        deleteUser(email_id);
    }
}
