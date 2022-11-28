<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.UserManager" %>
<html>
<%
  UserManager userMgr = UserManager.getInstance();
  String email_id = request.getParameter("email_id");

  if (userMgr.isExistUser(email_id)) {
    response.sendRedirect("signup_check_failed.jsp");
  } else {
    response.sendRedirect("signup_check_success.jsp?email_id="+email_id);
  }
%>
</html>
