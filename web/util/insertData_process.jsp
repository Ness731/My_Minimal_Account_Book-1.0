<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="dao.ExpenditureDAO" %>
<%@ page import="dto.Expenditure" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.sql.SQLException" %>
<%
    MultipartRequest multi = new MultipartRequest(request, "C:\\Users\\82107\\IdeaProjects\\JSP_webProject\\web\\resources\\assets\\userImg", 1024*1024*1024, "utf-8", new DefaultFileRenamePolicy());
    ExpenditureDAO expDAO = ExpenditureDAO.getInstance();

    Enumeration files = multi.getFileNames();
    String file = (String) files.nextElement();
    String filename = multi.getFilesystemName(file);
    String root = "../resources/assets/userImg/";

    int expend_id = expDAO.generateExpId();
    String email_id = "test id"; //세션정보에서 유저 아이디 가져오기;
    int amount = Integer.valueOf(multi.getParameter("amount"));
    Date expend_date = Date.valueOf(multi.getParameter("expend_date"));
    String img = root + filename;
    String category = multi.getParameter("category");
    String description = multi.getParameter("description");
    String tag = multi.getParameter("tag");

    Expenditure exp = new Expenditure(expend_id, email_id, amount,
            expend_date, img, category, description, tag);

    try {
        expDAO.insertExpenditure(exp);
    } catch (SQLException e) {
        response.sendRedirect("../error_page.jsp");
    } finally {
        response.sendRedirect("../main.jsp");
    }

%>