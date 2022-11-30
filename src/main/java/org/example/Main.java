package org.example;

import dao.ExpenditureDAO;
import dto.Expenditure;

import java.sql.Date;
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) throws Exception {
        // DAO Test
        ExpenditureDAO test = ExpenditureDAO.getInstance();

        Date date = new Date((2021 - 1900), 11, 28);
        ArrayList<String> tag = new ArrayList<String>();
        tag.add("#muckbang");
        tag.add("#cola");
        tag.add("#pizza");

        Expenditure expend = new Expenditure(2, "wjdwlswn848@naver.com", 5000, date, "", "", "", tag);
        test.insertExpenditure(expend);
    }
}