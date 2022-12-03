<%@ page isErrorPage="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<%@include file="util/main_header.jsp" %>
<body id="page-top">
<div id="wrapper">
    <%@include file="util/sidebar.jsp" %>
    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
            <div class="container-fluid">
                <div class="text-center" style="padding-top: 20%">
                    <div class="error mx-auto" data-text="Sorry">Sorry</div>
                    <p class="lead text-gray-800 mt-5 mb-3">예기치 못한 오류로 인해 페이지를 로드할 수 없어요.😓</p>
                    <a href="../main.jsp" style="font-size: 18px">
                        <i class="fas fa-home"></i>
                        <span>메인으로 돌아가기</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="util/scroll_to_top_button.jsp" %>
<%@include file="util/logout_modal.jsp" %>
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="js/sb-admin-2.min.js"></script>
</body>

</html>