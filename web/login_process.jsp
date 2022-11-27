<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.dao.FormChecker" %>
<html>
<%
    FormChecker checker = FormChecker.getInstance();
    String email = request.getParameter("email_id");
    if (checker.test(email)) {
%>
<script>
    alert("로그인에 성공하였습니다.")
</script>
<%
    response.sendRedirect("main.jsp");
} else {
%>
<script>
    alert("이메일 또는 비밀번호를 잘못 입력했습니다."
        + "입력하신 내용을 다시 확인해주세요.")
</script>
<%
        response.sendRedirect("login.jsp");
    }
%>
</html>
