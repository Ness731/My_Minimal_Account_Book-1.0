package dao;

import dto.User;

import java.sql.SQLException;

public class UserManager {
    private static UserManager userMgr;
    private UserDAO userDao = UserDAO.getInstance();

    private UserManager() {
        // init();
    }

    public static UserManager getInstance() {
        if (userMgr == null) {
            userMgr = new UserManager();
        }
        return userMgr;
    }

    //이미 가입된 유저라면 true, 새로운 유저라면 false
    public boolean isExistUser(String email_id) throws SQLException {
        if (userDao.searchUser(email_id) != null)
            return true;
        return false;
    }

    //로그인 성공시 true
    public boolean login(String email_id, String pwd) throws SQLException {
        User user = userDao.searchUser(email_id);
        if (user != null)
            if (user.getPwd().equals(pwd))
                return true;
        return false;
    }

    //회원가입 성공시 true
    public boolean signUp(String email_id, String pwd, String uname) throws SQLException {
        User user = new User(email_id, pwd, uname);
        // 이메일이 계속 null로 뜬다. 아마 파라미터 넘어오는 과정이 문제인듯?
        System.out.println("이메일: " + email_id + "비번: " + pwd + "이름: " + uname);
        return userDao.insertUser(user);
    }

    //탈퇴 성공시 true
    public boolean withdrawal(String email_id) throws SQLException {
        if(userDao.deleteUser(email_id) == 0)
            return true;
        return false;
    }
}
