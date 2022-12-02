<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="dao.ExpenditureDAO" %>
<%@ page import="java.text.DecimalFormat" %>
<body>
<% ExpenditureDAO expDao = ExpenditureDAO.getInstance();
    DecimalFormat decFormat = new DecimalFormat("###,###");
    String emid = session.getAttribute("email_id").toString();
%>

<div class="col-xl-4 col-md-6 mb-4">
    <div class="card border-left-success shadow h-100 py-2">
        <div class="card-body">
            <div class="row no-gutters align-items-center">
                <div class="col mr-2">
                    <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                        이번달 총 소비
                    </div>
                    <div class="h5 mb-0 font-weight-bold text-gray-800"><%=decFormat.format(expDao.getSumOfMonthlyExp(emid))%>원</div>
                </div>
                <div class="col-auto">
                    <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="col-xl-4 col-md-6 mb-4">
    <div class="card border-left-primary shadow h-100 py-2">
        <div class="card-body">
            <div class="row no-gutters align-items-center">
                <div class="col mr-2">
                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                        이번주 총 소비
                    </div>
                    <div class="h5 mb-0 font-weight-bold text-gray-800"><%=decFormat.format(expDao.getSumOfMonthlyExp(emid))%>원</div>
                </div>
                <div class="col-auto">
                    <i class="fas fa-calendar fa-2x text-gray-300"></i>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="col-xl-4 col-md-6 mb-4">
    <div class="card border-left-danger shadow h-100 py-2">
        <div class="card-body">
            <div class="row no-gutters align-items-center">
                <div class="col mr-2">
                    <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">
                        오늘의 소비 횟수
                    </div>
                    <div class="h5 mb-0 font-weight-bold text-gray-800"><%=expDao.getTodayRecordCnt(emid)%>번</div>
                </div>
                <div class="col-auto">
                    <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>