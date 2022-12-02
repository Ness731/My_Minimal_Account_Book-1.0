<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8"/>
    <!-- Add icon library -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<fmt:requestEncoding value="UTF-8"/>
<fmt:setLocale value='<%= session.getAttribute("language")%>'/>
<fmt:setBundle basename="message" var="resourceBundle"/>

<div>
    <!-- 다국어 처리 필요 6 -->
    <p class="mb-0 script-normal"><fmt:message key="isNotUser" bundle="${resourceBundle}"/>
        <!-- 다국어 처리 필요 7 -->
        <a href="../signup/signup.jsp" class="text-white-50 fw-bold script-normal" style="margin-left: 10px"><fmt:message key="signUp" bundle="${resourceBundle}"/></a>
    </p>

    <p class="mb-0 script-normal" style="margin-top: 1rem">
        <a href="../index.jsp">
            <img src="../resources/assets/logo.png" width="30" height="30">
        </a>
    </p>
</div>