package org.example;

import dao.DBUtill;
import dao.UserDAO;
import dto.User;

import java.sql.Connection;

public class Main {
    public static void main(String[] args) throws Exception {
        // DAO Test
        UserDAO test = UserDAO.getInstance();
        User user = new User("test@test.test","test123","test");
        test.insertUser(user);
        user.setUname("testName");
        test.updateUser(user);
        test.searchUser("test@test.test");
        test.deleteUser("test@test.test");
    }
}