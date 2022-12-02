<%@ page import="dao.ExpenditureDAO" %>
<%@ page import="java.util.LinkedHashMap" %>
<%@ page import="utility.Calculator" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="main_header.jsp" %>
<meta charset="utf-8">
<style>
    .card-image {
        position: relative;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 150px;
    }
</style>
<body>
<%
    String root = "resources/assets/img/";
    String[] category = {"food", "hobby", "shopping", "living", "medical", "transpt", "finance", "other"};
    ExpenditureDAO exp = ExpenditureDAO.getInstance();
    LinkedHashMap<String, Integer> rankList = exp.getRangking(session.getAttribute("email_id").toString());
    LinkedHashMap<String, Integer> best = Calculator.getBestCategory(rankList);
    String best_name = "", best_cnt = "";
    ArrayList<String> list_name = new ArrayList<>();
    ArrayList<String> list_cnt = new ArrayList<>();

    for (Map.Entry entry : best.entrySet()) {
        best_name = entry.getKey().toString();
        best_cnt = entry.getValue().toString();
    }

    int i = 0;
    // 데이터에 없는 카테고리 추가
    for (String c : category) {
        if (!rankList.containsKey(c)) {
            rankList.put(c, 0);
        }
    }
    System.out.println("rankList: " + rankList.toString());
%>
<div class="col-xl-4 col-lg-12 ml-3 pl-0">
    <!-- Project Card Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">베스트 카테고리</h6>
        </div>
        <div class="card-body center">
            <%if (best_cnt.equals("0")) {%>
            <div class="row">
                <p style="font-size: 18px; margin-left: 15%">아직 데이터가 충분히 쌓여있지 않아요. 🤔</p>
            </div>
            <div class="row">
                <img src="<%=root + "no_data.png"%>" class="card-image">
            </div>
            <%} else {%>
            <div class="row">
                <div class="col">
                    <p style="font-size: 22px; margin-left: 15%; font-weight: bold; color: #0e76a8"><%=best_name%> (합계:<%=best_cnt%>)</p>
                    <img src="<%=root + best_name +".png"%>" class="card-image">
                </div>
            </div>
            <%}%>
        </div>
    </div>
</div>
</div>
</body>
</html>
