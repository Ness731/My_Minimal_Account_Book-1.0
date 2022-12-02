<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.ExpenditureDAO" %>
<meta charset="utf-8">
<%
    ExpenditureDAO expDao = ExpenditureDAO.getInstance();
    String expend_id = request.getParameter("expend_id");

    try {
        expDao.deleteExpenditure(expend_id);
    } catch (Exception e) {
        response.sendRedirect("../main_error.jsp");
    } finally {
        response.sendRedirect("../tables.jsp");
    }
%>