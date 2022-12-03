package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtill {
    static String user = "";
    static String password = "";
    static String url = "";
    private DBUtill instance;

    private DBUtill(){
    }
    public DBUtill getInstance(){
        if(instance == null)
            instance = new DBUtill();
        return instance;
    }

    public static Connection getConnection() {
        Connection con = null;
        //1. 드라이버 로딩
        try {
            Class.forName("com.mysql.jdbc.Driver");
        }catch (Exception e) {
            e.printStackTrace();
        }
        //2. 연결
        try {
            con = DriverManager.getConnection(url, user, password);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}