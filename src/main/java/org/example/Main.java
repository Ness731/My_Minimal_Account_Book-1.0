package org.example;

import dao.ExpenditureDAO;
import dto.Expenditure;

import java.sql.Date;
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) throws Exception {
        int[] resultList = ExpenditureDAO.getInstance().getSumOfAllMonthlyExp();
        String arrList = "";
        for(int i=0; i<resultList.length; i++){
            arrList += resultList[i];
            if(i != resultList.length-1)
                arrList += ",";
        }
        System.out.println(arrList);
    }
}