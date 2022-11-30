<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<%@include file="util/main_header.jsp" %>
<title>My Minimal Account Book - Main</title>
<body id="page-top">
<div id="wrapper">
    <!-- Content Wrapper -->
    <%@ include file="util/sidebar.jsp" %>
    <div id="content-wrapper" class="d-flex flex-column">
        <!-- Main Content -->
        <div id="content">
            <!-- Begin Page Content -->
            <div class="container-fluid" style="padding-top: 2.3rem">
                <div class="row">
                    <div class="col-xl-3 mb-4">
                        <div class="card shadow mb-2">
                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">소비 기록 추가하기</h6>
                            </div>
                            <div class="card-body">
                                <jsp:include page="util/insertData.jsp" flush="false"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-9 col-lg-12">
                        <div class="row">
                            <jsp:include page="cards.jsp"/>
                        </div>
                        <!-- Area Chart -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">소비 그래프</h6>
                            </div>

                            <div class="card-body">
                                <div class="chart-area" style="height: 16.2rem;">
                                    <canvas id="myAreaChart"></canvas>
                                </div>
                                <hr>
                                지난 6개월 간의 나의 소비를 그래프로 확인해보세요.
                            </div>
                        </div>
                        <!-- 목표 달성 그래프 -->
                        <jsp:include page="util/goal_graph.jsp"/>

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