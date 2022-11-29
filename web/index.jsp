<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<div class="masthead">
    <div class="masthead-content text-white stop-dragging">
        <div class="container-fluid px-lg-2">
            <!-- 다국어 처리 필요 1 -->
            <h1 class="fs-1 fw-bold mb-4"
                style="font-family: Noto Sans KR, sans-serif; letter-spacing: 1.1px; white-space:nowrap">
                비울수록, 채워진다.
            </h1>
            <!-- 다국어 처리 필요 2 -->
            <p class="fs-3 fw-lighter mb-5"
               style="font-family: Noto Sans KR, sans-serif; letter-spacing: 1px; white-space:nowrap">
                더 나은 소비를 위한 지출 기록장.<br>My Minimal Account Book.
            </p>

            <div class="row input-group-newsletter">
                <div class="col-auto">
                    <!-- 다국어 처리 필요 3 -->
                    <button onclick="location='signup/signup.jsp'" class="btn btn-primary"
                            style="font-family: Noto Sans KR, sans-serif; font-weight: bold;
                            font-size: medium; letter-spacing: 1.3px;"
                            id="signUpButton" type="submit">회원가입
                    </button>

                    <button onclick="location='login/login.jsp'" class="btn btn-outline-light"
                            style="font-family: Noto Sans KR, sans-serif; font-weight: bold;
                            font-size: medium; letter-spacing: 1.3px;"
                            id="loginButton" type="submit">로그인
                    </button>
                </div>
            </div>

        </div>
    </div>
</div>
<div class="social-icons">
    <div class="d-flex flex-row flex-lg-column justify-content-center align-items-center h-100 mt-3 mt-lg-0">
        <a class="btn btn-dark m-3" href="https://github.com/Ness731/JSP_webProject"><i class="fab fa-github"></i></a>
    </div>
</div>
</body>

</html>