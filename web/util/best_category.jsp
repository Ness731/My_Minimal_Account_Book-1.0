<%@ page import="dao.ExpenditureDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="main_header.jsp" %>
<meta charset="utf-8">
<body>
<%
    ExpenditureDAO exp = ExpenditureDAO.getInstance();
    int weekly = exp.getWeeklySavingRate();
    int monthly = exp.getMonthlySavingRate();
    int count = exp.getRecordCnt();
%>
<div class="col-xl-5 col-lg-12 ml-0 pl-0">
    <!-- Project Card Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">베스트 카테고리</h6>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col">
                    <p>카테고리 이름</p>
                    <p>이미지</p>
                </div>
                <p>나머지 순위</p>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>
