<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <!-- 다국어 처리 필요 9 -->
    <title>Sign Up - My Minimal Account Book</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
    <link href="../resources/css/styles.css?after" rel="stylesheet"/>
</head>
<!-- js 파일로 분리하면 인식이 안돼서 직접 삽입함-->
<script type="text/javascript">
    function check_email() {
        const form = document.signupForm;
        let email_id = form.email_id;
        let emailCheck = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;

        if (email_id.value == "") {
            alert("이메일 주소를 입력하세요.");
            email_id.focus();
        } else if (!emailCheck.test(email_id.value)) {
            alert("이메일 양식이 유효하지 않습니다.\n" +
                "[email@domain] 형식으로 입력해주세요.");
            email_id.focus();
        } else {
            form.method = "post";
            form.action = "../signup/email_check.jsp";
            form.submit();
        }
    }
</script>
<body style="background-image: url(../resources/assets/img/register_background.jpg);
background-size: cover;" onLoad="document.signupForm.email_id.focus()">

<form name="signupForm">
    <div class="container py-5 h-100 stop-dragging" style="z-index: 2;">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                <div class="card bg-white text-black" style="border-radius: 1rem; z-index: 2;">
                    <div class="card-body p-5 text-center">
                        <div class="mb-md-3 mt-md-4 pb-5">
                            <!-- 다국어 처리 필요 1 -->
                            <h2 class="fw-bold mb-4 text-uppercase index">Sign Up</h2>

                            <!-- 폼 태그 -->
                            <div class="form-outline form-white mb-4">
                                <label class="col-form-label script">이메일</label>
                                <input type="text" name="email_id" class="form-control form-control-lg mb-2"/>
                                <!-- 다국어 처리 필요 3 -->
                                <button class="btn btn-primary btn-sm px-2 fw-light script" type="button"
                                        onclick="check_email()">
                                    이메일 중복 확인
                                </button>
                            </div>
                            <div style="pointer-events : none;">
                                <div class="form-outline form-white mb-4">
                                    <label class="col-form-label script">비밀번호</label>
                                    <input type="password" name="pwd" class="form-control form-control-lg" disabled/>
                                    <!-- 다국어 처리 필요 4 -->
                                </div>

                                <div class="form-outline form-white mb-4">
                                    <label class="col-form-label script" for="repwd">비밀번호 확인</label>
                                    <input type="password" name="repwd" id="repwd" class="form-control form-control-lg"
                                           disabled/>
                                    <!-- 다국어 처리 필요 5 -->
                                </div>

                                <div class="form-outline form-white mb-4">
                                    <label class="col-form-label script" for="uname">닉네임</label>
                                    <input type="text" name="uname" id="uname" class="form-control form-control-lg"
                                           disabled/>
                                    <!-- 다국어 처리 필요 6 -->
                                </div>
                                <!-- 다국어 처리 필요 7 -->
                                <button class="btn btn-outline-dark btn-lg px-5 script" type="button"
                                        onclick="check_signupForm()" disabled>
                                    Sign Up
                                </button>
                            </div>
                        </div>
                        <div>
                            <!-- 다국어 처리 필요 8 -->
                            <p class="mb-0 script-normal">계정이 이미 있으십니까?
                                <!-- 다국어 처리 필요 9 -->
                                <a href="../login/login.jsp" class="text-black-50 fw-bold script-normal">로그인</a>
                            </p>
                            <p class="mb-0 script-normal">
                                <a href="../index.jsp" class="text-black-50 fw-bold script-normal">메인으로</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
</body>
</html>