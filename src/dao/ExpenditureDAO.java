package dao;

import dto.Expenditure;

public class ExpenditureDAO {
    private ExpenditureDAO instance;

    private ExpenditureDAO(){
    }
    public ExpenditureDAO getInstance(){
        if(instance == null)
            instance = new ExpenditureDAO();
        return instance;
    }
}
