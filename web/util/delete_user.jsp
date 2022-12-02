<%@ page import="dao.UserDAO" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String user_id = request.getParameter("email_id");
  try {
    UserDAO.getInstance().withdrawalUser(user_id);
  } catch (SQLException e) {
    response.sendRedirect("../index_error.jsp");
    throw new RuntimeException(e);
  } finally {
    response.sendRedirect("../admin.jsp");
  }
%>
