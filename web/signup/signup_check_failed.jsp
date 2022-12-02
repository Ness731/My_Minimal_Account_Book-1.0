<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="signup_header.jsp" %>
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

<fmt:requestEncoding value="UTF-8"/>
<fmt:setLocale value='<%= session.getAttribute("language")%>'/>
<fmt:setBundle basename="message" var="resourceBundle"/>

<form name="signupForm">
    <div class="container py-5 h-100 stop-dragging" style="z-index: 2;">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                <div class="card bg-white text-black" style="border-radius: 1rem; z-index: 2;">
                    <div class="card-body p-5 text-center">
                        <div class="mb-md-0 mt-md-4 pb-5">
                            <h2 class="fw-bold mb-4 text-uppercase index">Sign Up</h2>

                            <div class="form-outline form-white mb-1">
                                <label class="col-form-label script"><fmt:message key="email" bundle="${resourceBundle}"/></label>
                                <input type="text" name="email_id" class="form-control form-control-sm mb-2"/>
                                <button class="btn btn-primary btn-sm px-2 fw-light script" type="button"
                                        style="margin-bottom: 0.1rem"
                                        onclick="check_email()">
                                    <fmt:message key="emailCheck" bundle="${resourceBundle}"/>
                                </button>
                                <p class="m-1" style="font-size: small; color: indianred"><fmt:message key="isNotAvail" bundle="${resourceBundle}"/></p>
                            </div>
                            <div style="pointer-events : none;">
                                <div class="form-outline form-white mb-3">
                                    <label class="col-form-label script">
                                        <fmt:message key="password" bundle="${resourceBundle}"/>
                                    </label>
                                    <input type="password" name="pwd" class="form-control form-control-sm" disabled/>
                                </div>

                                <div class="form-outline form-white mb-3">
                                    <label class="col-form-label script" for="repwd">
                                        <fmt:message key="passwordCheck" bundle="${resourceBundle}"/>
                                    </label>
                                    <input type="password" name="repwd" id="repwd" class="form-control form-control-sm"
                                           disabled/>
                                </div>

                                <div class="form-outline form-white mb-3">
                                    <label class="col-form-label script" for="uname">
                                        <fmt:message key="userName" bundle="${resourceBundle}"/>
                                    </label>
                                    <input type="text" name="uname" id="uname" class="form-control form-control-sm"
                                           disabled/>
                                </div>
                                <button class="btn btn-outline-dark btn-lg px-5 script" type="button"
                                        onclick="check_signupForm()" disabled>
                                    Sign Up
                                </button>
                            </div>
                        </div>
                        <%@ include file="../signup/signup_footer.jsp" %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
</body>
</html>