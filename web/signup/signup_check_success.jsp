<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="signup_header.jsp" %>
<script type="text/javascript">

    function check_signupForm() {
        const form = document.signupForm;
        let pwd = form.pwd;
        let repwd = form.repwd;
        let uname = form.uname;
        let email_id = document.getElementById("email_id");
        let pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;

        if (pwd.value == "") {
            alert("비밀번호를 입력하세요.");
            pwd.focus();
        } else if (!pwdCheck.test(pwd.value)) {
            alert("비밀번호는 8~25자리 이상의 [영문자+숫자+특수문자] 조합으로 사용해야 합니다.");
            pwd.focus();
        } else if (repwd.value !== pwd.value) {
            alert("비밀번호가 일치하지 않습니다.");
            repwd.focus();
        } else if (uname.value == "") {
            alert("닉네임을 입력하세요.");
            uname.focus();
        } else {
            form.method = "post";
            form.action = "../signup/signup_process.jsp?email_id=" + email_id.value;
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
                            <div class="form-outline form-white mb-3" style="pointer-events : none;">
                                <label class="col-form-label script">
                                    <fmt:message key="email" bundle="${resourceBundle}"/>
                                </label>
                                <% String email_id = request.getParameter("email_id"); %>
                                <input type="text" id="email_id" name="email_id" class="form-control form-control-sm"
                                       value=<%=email_id%> disabled/>

                                <p class="m-3" style="font-size: small; color: blue">
                                    <fmt:message key="isAvail" bundle="${resourceBundle}"/>
                                </p>
                            </div>

                            <div class="form-outline form-white mb-3">
                                <label class="col-form-label script">
                                    <fmt:message key="password" bundle="${resourceBundle}"/>
                                </label>
                                <input type="password" name="pwd" class="form-control form-control-sm"/>
                            </div>

                            <div class="form-outline form-white mb-3">
                                <label class="col-form-label script" for="repwd">
                                    <fmt:message key="passwordCheck" bundle="${resourceBundle}"/>
                                </label>
                                <input type="password" name="repwd" id="repwd" class="form-control form-control-sm"/>
                            </div>

                            <div class="form-outline form-white mb-3">
                                <label class="col-form-label script" for="uname">
                                    <fmt:message key="userName" bundle="${resourceBundle}"/>
                                </label>
                                <input type="text" name="uname" id="uname" class="form-control form-control-sm"/>
                            </div>

                            <button class="btn btn-outline-dark btn-lg px-5 script" type="button"
                                    onclick="check_signupForm()">
                                Sign Up
                            </button>
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