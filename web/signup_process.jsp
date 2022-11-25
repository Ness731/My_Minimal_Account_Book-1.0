<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    dao.FormChecker checker = dao.FormChecker.getInstance();
    String email = request.getParameter("email_id");
    if (checker.test(email)) {
        response.sendRedirect("signup02.jsp?email_id=" + email);
    } else {
        response.sendRedirect("signup01.jsp");
    }
%>
</html>