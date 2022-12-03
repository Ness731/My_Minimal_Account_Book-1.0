<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.UserManager" %>
<!DOCTYPE html>
<meta charset="UTF-8">
<html lang="en">
<%
    request.setCharacterEncoding("utf-8"); // 한글 깨짐 방지
    UserManager userMgr = UserManager.getInstance();
    String email_id = request.getParameter("email_id");
    String pwd = request.getParameter("pwd");
    String uname = request.getParameter("uname");

    if (userMgr.signUp(email_id, pwd, uname)) {
        session.setAttribute("email_id", email_id);
        session.setAttribute("pwd", pwd);
        response.sendRedirect("../welcome.jsp");
    } else {
        response.sendRedirect("../index_error.jsp");
    }
%>
</html>