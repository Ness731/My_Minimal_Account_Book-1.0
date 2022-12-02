<%@ page import="dto.User" %>
<%@ page import="dao.UserDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<%@include file="util/main_header.jsp" %>
<title>My Minimal Account Book - Profile</title>
<%
    String rt = "resources/assets/profile/";
    String emid = session.getAttribute("email_id").toString();
    User usr = UserDAO.getInstance().searchUser(emid);
    String impath = rt + usr.getProfile_img();
    System.out.println("\nprofile image path = " + impath);
%>
<style>
    .circle-img_ {
        object-fit: cover;
        object-position: top; /*정사각형이 아니라 직사각형일 경우 원 안에 보여지게 할 중심 이미지의 위치를 지정*/
        border-radius: 50%; /*사각형의 모서리 둥근 정도를 지정하는 속성인데 50%를 지정하면 완전한 원이 됨*/
        position: relative;
        display: block;
        width: 16rem;
        height: 16rem;
    }

    .header {
        font-size: 1.2rem;
        font-weight: bold;
        color: #3e335e;
        padding-left: 1rem;
        height: auto;
        margin-top: 1.5rem;
        margin-bottom: 0.5rem;
    }

    .content {
        font-size: 1rem;
        font-weight: normal;
        color: #1c152f;
        padding-left: 1.5rem;
        padding-right: 1.5rem;
        margin-left: 1.5rem;
        height: auto;
        margin-bottom: 0.5rem;
    }
</style>
<script type="text/javascript">
    function confirm_change() {
        let pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
        const form = document.changePwdForm;
        const original_pwd = form.pwd.value;
        const change = form.pwd_change.value;

        if (change == "") {
            alert("비밀번호를 입력하세요.");
            return;
        }
        if (!pwdCheck.test(change)) {
            alert("비밀번호는 8~25자리 이상의 [영문자+숫자+특수문자] 조합으로 사용해야 합니다.");
            return;
        }
        var pt = prompt("비밀번호 변경을 원하시면 기존의 비밀번호를 입력해주세요.");

        if (original_pwd == pt) {
            form.action = "../util/change_pwd.jsp?pwd_change="+ change;
            form.method = "post";
            form.submit();
        } else {
            alert("비밀번호가 일치하지 않습니다.");
            return;
        }
    }

    function confirm_withdrawal() {
        var pt = prompt("탈퇴를 원하시면 기존의 비밀번호를 입력해주세요. 😢");
        const form = document.changePwdForm;
        const original_pwd = form.pwd.value;

        if (original_pwd == pt) {
            form.action = "../util/withdrawal_process.jsp";
            form.method = "post";
            form.submit();
        } else {
            alert("비밀번호가 일치하지 않습니다.");
            return;
        }
    }
</script>
<body id="page-top">
<div id="wrapper">
    <jsp:include page="util/sidebar.jsp"/>
    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
            <%@ include file="util/topbar.jsp" %>
            <!-- Begin Page Content -->
            <div class="container-fluid">
                <!-- Page Heading -->
                <div class="row" style="padding-top: 4.0rem;padding-left: 5.0rem">
                    <div class="col-xl-3 col-lg-12 ml-0 pl-0 mr-2">
                        <div class="card shadow mb-2">
                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">프로필 사진</h6>
                            </div>
                            <div class="card-body">
                                <div class="mb-5 mt-4" style="display: flex; justify-content: center;">
                                    <img src="<%=impath%>" class="circle-img_">
                                </div>
                                <hr style="width: 95%; color: gray;">

                                <form name="changeImgForm" method="post" action="util/change_img.jsp"
                                      enctype="multipart/form-data" ;>
                                    <div class="pl-3 pb-2 header">📌 프로필 사진 변경</div>
                                    <div class="form-outline form-white mb-4">
                                        <input name="img" type="file" class="form-control-sm form-control-sm pl-3"
                                               style="color: #0e63a8" readonly/>
                                    </div>
                                    <button class="btn btn-primary px-5 script" type="submit"
                                            style="float: right; margin: 1rem">
                                        사진 변경
                                    </button>
                                </form>

                            </div>
                        </div>
                    </div>

                    <div class="col-xl-6 col-lg-12 ml-0 pl-0">
                        <div class="card shadow mb-4">
                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">계정 정보</h6>
                            </div>
                            <div class="card-body pt-1">
                                <div class="flex-column">
                                    <div class="border-left-primary header">이메일</div>
                                    <div class="form-outline pb-2">
                                        <input class="form-control form-control-sm content"
                                               style="width: auto;"
                                               id="email_id" value=<%=usr.getEmail_id()%> disabled></input>
                                    </div>
                                </div>
                                <form name="changePwdForm">
                                    <div class="flex-column">
                                        <div class="flex-row">
                                            <div class="border-left-primary header">비밀번호</div>
                                        </div>
                                        <div class="flex-row">
                                            <div class="form-outline mb-3">
                                                <input class="form-control form-control-sm content"
                                                       style="width: auto;"
                                                       name="pwd" type="password" value=<%=usr.getPwd()%> disabled>
                                            </div>
                                        </div>

                                        <div class="flex-row">
                                            <div class="form-outline mb-3">
                                                <input class="form-control form-control-sm content"
                                                       style="width: auto; float: left;"
                                                       name="pwd_change">
                                            </div>
                                            <button class="content btn btn-sm btn-secondary" type="button"
                                                    onclick="confirm_change()"
                                                    style="float: left; color:white;">
                                                비밀번호 변경
                                            </button>
                                        </div>
                                        <div class="flex-row" style="clear: both">
                                            <p style="font-size: small; color: #6a6f73;" class="pl-3 pt-1">비밀번호는 8~25자리 이상의 [영문자+숫자+특수문자] 형식이어야 합니다.</p>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="card shadow mb-2">
                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">계정 관리</h6>
                            </div>
                            <div class="card-body mt-0 pt-0">
                                <div class="flex-column">
                                    <div class="border-left-primary header">회원 탈퇴</div>
                                    <p style="font-size: small; color: #6a6f73;" class="pl-3 mb-2">회원을 탈퇴할 경우 기존의 데이터는 모두 사라집니다. 신중하게 생각해주세요.</p>
                                    <button class="content btn btn-sm btn-secondary ml-3" type="button"
                                            onclick="confirm_withdrawal()"
                                            style="float: left; color:white; margin-bottom: 0.9rem">
                                        탈퇴하기
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="util/scroll_to_top_button.jsp" %>
<%@ include file="util/logout_modal.jsp" %>
<%@  include file="util/js_info.jsp" %>
</body>
</html>