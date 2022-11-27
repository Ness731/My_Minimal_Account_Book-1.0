package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtill {
    static String url = "jdbc:mysql://localhost:3306/jspProject";
    static String user = "root";
    static String password = "wjdwn848wlswn!";
    private DBUtill instance;

    private DBUtill(){
    }
    public DBUtill getInstance(){
        if(instance == null)
            instance = new DBUtill();
        return instance;
    }

    public static Connection getConnection() throws Exception {
            Connection conn = null;
            conn = DriverManager.getConnection(url, user, password);
            return conn;
        }
}
