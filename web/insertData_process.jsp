<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %> <!-- request 대신 -->
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %> <!-- 파일이름 중복을 피할 수 있도록 -->
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    MultipartRequest multi = new MultipartRequest(request, "C:\\Users\\82107\\IdeaProjects\\JSP_webProject\\web\\resources\\assets\\userImg", 1024*1024*1024, "utf-8", new DefaultFileRenamePolicy());

    String expend_date = multi.getParameter("expend_date");
    String category = multi.getParameter("category");
    String amount = multi.getParameter("amount");
    String description = multi.getParameter("description");
    Enumeration files = multi.getFileNames();
    String file = (String) files.nextElement();
    String filename = multi.getFilesystemName(file);
%>
<P>소비일자 = <%=expend_date%>
<P>금액 = <%=amount%>
<P>설명 = <%=description%>
<P>카테고리 = <%=category%>
<P>파일이름 = <%=filename%>
</body>
</html>
