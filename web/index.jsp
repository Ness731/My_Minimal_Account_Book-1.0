<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>My Minimal Account Book</title>
    <link rel="icon" type="image/x-icon" href="resources/assets/favicon.png"/>
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
    <link href="resources/css/styles.css?after" rel="stylesheet"/>
</head>
<body style="background-image: url(resources/assets/img/register_background.jpg); background-size: cover">

<fmt:requestEncoding value="UTF-8"/>
<fmt:setLocale value='<%= request.getParameter("language")%>'/> <!--큰 따옴표를 쓰면 에러 발생-->
<fmt:setBundle basename="message" var="resourceBundle"/>
<%session.setAttribute("language", request.getParameter("language"));%>

<div class="masthead">
    <div class="masthead-content text-white stop-dragging">
        <div class="container px-lg-2">
            <h1 class="fs-1 fw-bold mb-4"
                style="font-family: Noto Sans KR, sans-serif; letter-spacing: 1.1px;">
                <fmt:message key="title" bundle="${resourceBundle}"/>

            </h1>
            <p class="fs-3 fw-lighter mb-5"
               style="font-family: Noto Sans KR, sans-serif; letter-spacing: 1px; white-space:nowrap">
                <fmt:message key="subtitle" bundle="${resourceBundle}"/>
            </p>

            <div class="row input-group-newsletter">
                <div class="col-auto">
                    <button onclick="location='signup/signup.jsp'" class="btn btn-primary"
                            style="font-family: Noto Sans KR, sans-serif; font-weight: bold;
                            font-size: medium; letter-spacing: 1.3px;"
                            id="signUpButton" type="submit"><fmt:message key="signUp" bundle="${resourceBundle}"/>
                    </button>

                    <button onclick="location='login/login.jsp'" class="btn btn-outline-light"
                            style="font-family: Noto Sans KR, sans-serif; font-weight: bold;
                            font-size: medium; letter-spacing: 1.3px;"
                            id="loginButton" type="submit"><fmt:message key="login" bundle="${resourceBundle}"/>
                    </button>
                </div>
            </div>
            <div class="text-right mt-2">
                <a href="?language=ko" style="color: #ba9de1; margin:0.3rem;">🇰🇷</a><a href="?language=en" style="color: #ba9de1; margin:0.3rem;">🇺🇸</a>
            </div>
        </div>
    </div>
    <a href="admin.jsp" style="color: rgba(255,255,255,0.1); z-index: 999; position: fixed; bottom: 10px; left: 10px;">Admin Mode</a>
</div>
<div class="social-icons" style="margin-right: 3rem">
    <div class="d-flex flex-row flex-lg-column justify-content-center align-items-center h-100 mt-3 mt-lg-0">
        <a class="btn btn-dark m-3" href="https://github.com/Ness731/JSP_webProject"><i class="fab fa-github"></i></a>
    </div>
</div>
</body>
</html>