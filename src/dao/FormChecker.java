package dao;

public class FormChecker {
    private static FormChecker checker;
    private FormChecker() {
        // init();
    }

    public static FormChecker getInstance(){
        if(checker == null){
            checker = new FormChecker();
        }
        return checker;
    }

    private void init() { //DB 연결 메소드
    }

    public boolean test (String email){
        if(email.equals("test@test.test"))
            return true;
        return false;
    }

    public boolean isExistEmail (String email){
        /*
        Connection con;
        StringBuilder sql;
        int cnt=0;
        try{
            //아이디 중복 확인
           sql.append(" SELECT count(id) as cnt ");
           sql.append(" FROM member ");
           sql.append(" WHERE id = ? ");

           PreparedStatement pstmt=con.prepareStatemnt(sql.toString());
           pstmt.setString(1, id);

            ResultSet rs=pstmt.executeQuery();
            if(rs.next()){
        	    cnt=rs.getInt("cnt");
            }
        }catch(Exception e){
     	    System.out.println("아이디 중복 확인 실패 : " + e);
        }//try end
        */
            return false;
        }
    }
