<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<%@include file="util/main_header.jsp" %>
<title>My Minimal Account Book - Main</title>
<%
    int[] resultList = dao.ExpenditureDAO.getInstance().getSumOfAllMonthlyExp(session.getAttribute("email_id").toString());
    String arrList = "";
    for (int i = 0; i < resultList.length; i++) {
        arrList += resultList[i];
        if (i != resultList.length - 1)
            arrList += ",";
    }
    System.out.println(arrList);

    System.out.println("logined user : " + session.getAttribute("email_id").toString());
%>
<p id="arrayData" style="position: fixed; z-index: -999"><%=arrList%>
</p>

<body id="page-top">
<div id="wrapper">
    <jsp:include page="util/sidebar.jsp"/>
    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
            <div class="container-fluid" style="padding-top: 2.3rem">
                <div class="row">
                    <div class="col-xl-3 mb-4">
                        <div class="card shadow mb-2">
                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">소비 기록 추가하기</h6>
                            </div>
                            <div class="card-body">
                                <jsp:include page="util/insert_data.jsp" flush="false"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-9 col-lg-12">
                        <div class="row">
                            <%@include file="util/cards.jsp" %>
                        </div>
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">나의 소비 곡선</h6>
                            </div>
                            <div class="card-body">
                                <p class="pb-1">지난 1년 간의 나의 소비를 그래프로 확인해보세요. 👀</p>
                                <div class="chart-area" style="height: 16.2rem;">
                                    <canvas id="myAreaChart"></canvas>
                                </div>
                            </div>
                        </div>
                        <div class="row" style="padding-left: 0.8rem">
                            <jsp:include page="util/bar_graph.jsp"/>
                            <jsp:include page="util/best_category.jsp"/>
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