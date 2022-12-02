<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.UserManager" %>
<html>
<%
    UserManager userMgr = UserManager.getInstance();
    String email_id = request.getParameter("email_id");
    String pwd = request.getParameter("pwd");
    if (userMgr.login(email_id, pwd)) {
        session.setAttribute("email_id", email_id);
        session.setAttribute("pwd", pwd);
        response.sendRedirect("../main.jsp");
    } else {
        response.sendRedirect("../login/login_failed.jsp");
    }
%>
</html>
