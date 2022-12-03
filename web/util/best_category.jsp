<%@ page import="dao.ExpenditureDAO" %>
<%@ page import="java.util.LinkedHashMap" %>
<%@ page import="utility.Calculator" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.UserDAO" %>
<%@ page import="dto.User" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="main_header.jsp" %>
<meta charset="utf-8">
<style>
    .card-image {
        position: relative;
        float: left;
        width: 140px;
    }

    .best_name {
        font-size: 3.2rem;
        font-weight: bold;
        color: #0e76a8;
    }
</style>
<body>
<%
    User u = UserDAO.getInstance().searchUser(session.getAttribute("email_id").toString());
    String root = "resources/assets/img/";
    String[] category = {"food", "hobby", "shopping", "living", "medical", "transpt", "finance", "other"};
    String[] kr = {"식비", "취미", "쇼핑", "리빙", "의료", "교통", "금융", "기타"};
    HashMap<String, String> category_kr = new HashMap<>();
    for(int i=0; i<category.length; i++){
        category_kr.put(category[i], kr[i]);
    }
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
<div class="col-md-6 mb-4" style="flex: auto; width: 41%;">
    <!-- Project Card Example -->
    <div class="card shadow">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">베스트 카테고리</h6>
        </div>

        <div class="card-body">
            <%if (best_cnt.equals("0")) {%>
            <div class="col">
                    <div class="mb-4">아직 데이터가 충분히 쌓여있지 않아요. 🤔</div>
                    <div style="position: relative; top:50%; left: 32%;">
                        <img src="<%=root + "no_data.png"%>" class="card-image mb-3">
                    </div>
            </div>
            <%} else {%>
            <div class="col ml-1 mr-1">
                <div class="mb-4"><%=u.getUname()%>님이 가장 많이 소비한 카테고리예요. 🔍</div>
                <div style="position: relative; top:50%; left: 17%;" class="mr-auto pb-5">
                    <img src="<%=root + best_name +".png"%>" class="card-image">
                    <div class="row">
                        <div class="best_name ml-4 mt-3">
                            <%=category_kr.get(best_name)%>
                        </div>
                    </div>
                    <div class="row">
                        <div class="ml-4" style="font-size: 1.2rem; margin-top: -13px;">(합계:<%=best_cnt%>)</div>
                    </div>
                </div>
            </div>
            <%}%>
        </div>
    </div>
</div>
</div>
</body>
</html>
