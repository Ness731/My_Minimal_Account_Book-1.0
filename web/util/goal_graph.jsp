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
<div class="col-xl-8 col-lg-12 ml-0 pl-0">
    <!-- Project Card Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">목표 달성률</h6>
        </div>
        <div class="card-body">
            <h4 class="small font-weight-bold">지난주 대비 소비 10% 줄이기<span class="float-right"><%=weekly%></span></h4>
            <div class="progress mb-4">
                <div class="progress-bar bg-danger" role="progressbar" style="width: <%=weekly%>%"
                     aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
            <h4 class="small font-weight-bold">지난달 대비 소비 10% 줄이기<span class="float-right"><%=monthly%></span></h4>
            <div class="progress mb-4">
                <div class="progress-bar bg-warning" role="progressbar" style="width: <%=monthly%>%"
                     aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
            <h4 class="small font-weight-bold">소비 100번 기록하기<span class="float-right"><%=count%></span></h4>
            <div class="progress mb-4">
                <div class="progress-bar" role="progressbar" style="width: <%=count%>%"
                     aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
