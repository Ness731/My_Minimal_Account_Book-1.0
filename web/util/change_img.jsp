<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="dao.UserDAO" %>
<%@ page import="dto.User" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="../main_error.jsp" %>
<meta charset="utf-8">
<%
    MultipartRequest multi = new MultipartRequest(request, "C:\\Users\\82107\\IdeaProjects\\JSP_webProject\\web\\resources\\assets\\profile", 1024 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());

    // 1. 파일명
    Enumeration files = multi.getFileNames();
    String file = (String) files.nextElement();
    String filename = multi.getFilesystemName(file);

    // 2. 유저
    UserDAO uDao = UserDAO.getInstance();
    User u = uDao.searchUser(session.getAttribute("email_id").toString());
    u.setProfile_img(filename);
    try {
        uDao.updateUser(u);
    } catch (SQLException e) {
        response.sendRedirect("../main_error.jsp");
        throw new RuntimeException(e);
    } finally {
        response.sendRedirect("../profile.jsp");
    }

%>
