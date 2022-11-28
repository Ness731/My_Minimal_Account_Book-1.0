package org.example;

import dao.ExpenditureDAO;
import dto.Expenditure;

import java.sql.Date;

public class Main {
    public static void main(String[] args) throws Exception {
        // DAO Test
        ExpenditureDAO test = ExpenditureDAO.getInstance();
        Date date = new Date(2021, 11, 28);
        Expenditure expend = new Expenditure(
                1, 20000, date, "web/resources/assets/img/calendar.jpg",
                "eat", "yumyum", "muckbang"
        );
        test.insertExpenditure(expend);
        //expend.setCategory("testName");
        //test.updateExpenditure(expend);
        //test.deleteExpenditure("test@test.test");
    }
}