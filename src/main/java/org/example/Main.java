package org.example;

import dao.ExpenditureDAO;
import dto.Expenditure;

import java.sql.Date;
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) throws Exception {
        // DAO Test
        ExpenditureDAO test = ExpenditureDAO.getInstance();
        Expenditure expend;
        /*
        Date date = new Date(2021, 11, 28);
        ArrayList<String> tag = new ArrayList<String>();
        tag.add("#muckbang");
        tag.add("#cola");
        tag.add("#pizza");
        ArrayList<String> ar = expend.getTagArray();
        for(String s : ar) {
            System.out.println(s);
        }
        */
        expend = test.searchExpenditure("1");
        expend.setAmount(9999);
        test.updateExpenditure(expend);
        //test.deleteExpenditure("test@test.test");
    }
}