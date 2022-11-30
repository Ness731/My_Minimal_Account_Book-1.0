package org.example;

import dao.ExpenditureDAO;
import dto.Expenditure;

import java.sql.Date;
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) throws Exception {
        // DAO Test
        ExpenditureDAO test = ExpenditureDAO.getInstance();
        System.out.println("생성된 아이디: " + test.generateExpId());
    }
}