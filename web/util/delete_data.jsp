<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.ExpenditureDAO" %>
<meta charset="utf-8">
<%
    ExpenditureDAO expDao = ExpenditureDAO.getInstance();
    String expend_id = request.getParameter("expend_id");
    String expend_date = request.getParameter("expend_date");

    System.out.println("***소비일자= " + expend_date);
    try {
        expDao.deleteExpenditure(expend_id, expend_date);
    } catch (Exception e) {
        response.sendRedirect("../main_error.jsp");
    } finally {
        response.sendRedirect("../tables.jsp");
    }
%>