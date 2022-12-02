package org.example;

import dao.ExpenditureDAO;
import dto.Expenditure;
import utility.Calculator;

import java.sql.Date;
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) throws Exception {
        String result = ExpenditureDAO.getInstance().getRangking("wjdwlswn848@naver.com").toString();
        String result2 = Calculator.getBestCategory(ExpenditureDAO.getInstance().getRangking("wjdwlswn848@naver.com")).toString();
        System.out.println(result);
        System.out.println(result2);
    }
}