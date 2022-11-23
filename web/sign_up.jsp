<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <!-- 다국어 처리 필요 9 -->
    <title>Sign Up - My Minimal Account Book</title>
    <link rel="icon" type="image/x-icon" href="resources/assets/favicon.png"/>
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
    <link href="resources/css/styles.css?after" rel="stylesheet"/>
</head>
<body style="background-image: url(resources/assets/img/register_background.jpg); background-size: cover;">
<div class="container py-5 h-100 stop-dragging" style="z-index: 2;">
    <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-12 col-md-8 col-lg-6 col-xl-5">
            <div class="card bg-white text-black" style="border-radius: 1rem; z-index: 2;">
                <div class="card-body p-5 text-center">
                    <div class="mb-md-5 mt-md-4 pb-5">
                        <!-- 다국어 처리 필요 1 -->
                        <h2 class="fw-bold mb-2 text-uppercase index">Sign Up</h2>
                        <!-- 다국어 처리 필요 2 -->
                        <p class="text-black-50 mb-5 script">이메일과 비밀번호를 입력하세요</p>
                        <div class="form-outline form-white mb-4">
                            <input type="email" id="typeEmailX" class="form-control form-control-lg"/>
                            <!-- 다국어 처리 필요 3 -->
                            <label class="col-form-label script" for="typeEmailX">이메일</label>
                        </div>
                        <div class="form-outline form-white mb-4">
                            <input type="password" id="typePasswordX" class="form-control form-control-lg"/>
                            <!-- 다국어 처리 필요 4 -->
                            <label class="col-form-label script" for="typePasswordX">비밀번호</label>
                        </div>
                        <!-- 다국어 처리 필요 5 -->
                        <p class="small mb-5 pb-lg-2 script-normal"><a class="text-black-50" href="#!">비밀번호를 잊으셨습니까?</a></p>
                        <!-- 다국어 처리 필요 6 -->
                        <button class="btn btn-outline-dark btn-lg px-5 script" type="submit">Sign Up</button>
                    </div>
                    <div>
                        <!-- 다국어 처리 필요 7 -->
                        <p class="mb-0 script-normal">계정이 이미 있으십니까?
                            <!-- 다국어 처리 필요 8 -->
                            <a href="login.jsp" class="text-black-50 fw-bold script-normal">로그인</a>
                        </p>

                        <p class="mb-0 script-normal">
                            <a href="index.jsp" class="text-black-50 fw-bold script-normal">메인으로</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>