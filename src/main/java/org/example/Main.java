package org.example;

import dao.ExpenditureDAO;
import dto.Expenditure;

import java.sql.Date;
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) throws Exception {
        System.out.println(ExpenditureDAO.getInstance().getTodayRecordCnt());
    }
}