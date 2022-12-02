<%@ page import="dao.UserDAO" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String newPwd = request.getParameter("pwd_change");
    String email_id = session.getAttribute("email_id").toString();

    try {
        UserDAO.getInstance().changePwd(newPwd, email_id);
    } catch (SQLException e) {
        response.sendRedirect("../main_error.jsp");
        throw new RuntimeException(e);
    } finally {
        response.sendRedirect("../profile.jsp");
    }
%>