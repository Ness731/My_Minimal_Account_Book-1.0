<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.UserManager" %>
<html>
<%
    UserManager userMgr = UserManager.getInstance();
    String email_id = request.getParameter("email_id");
    String pwd = request.getParameter("pwd");
    String uname = request.getParameter("uname");

    if (userMgr.signUp(email_id, pwd, uname)) {
        response.sendRedirect("../welcome.jsp");
    } else {
        response.sendRedirect("../error_page.jsp");
    }
%>
</html>
