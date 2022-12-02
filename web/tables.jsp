<%@ page import="dto.Expenditure" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.ExpenditureDAO" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<%@include file="util/main_header.jsp" %>
<title>My Minimal Account Book - Tables</title>
<script type="text/javascript">
    function confirm_delete() {
        const exp_id = document.getElementById("delete_btn").value;
        console.log(exp_id);
        var pt = prompt("삭제된 기록은 복구할 수 없습니다. 삭제를 원하시면 'delete'를 입력해주세요.");
        if (pt == "delete") {
            location.href="../util/delete_data.jsp?expend_id="+exp_id.toString();
            return;
        } else {
            alert("확인 문구가 일치하지 않습니다.");
            return;
        }
    }
</script>
<body id="page-top">
<div id="wrapper">
    <jsp:include page="util/sidebar.jsp"/>
    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
            <jsp:include page="util/topbar.jsp"/>
            <!-- Begin Page Content -->
            <div class="container-fluid">
                <!-- Page Heading -->
                <p class="pt-2 mb-3 text-gray-800" style="font-weight:bold; font-size: 35px">📑 소비 테이블</p>
                <p class="mb-4 ml-3">나의 소비 내역을 다양한 기준으로 살펴볼 수 있어요.</p>
                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <jsp:include page="util/table_menu.jsp"/>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive pt-3">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <%
                                    ExpenditureDAO expDAO = ExpenditureDAO.getInstance();
                                    String std = request.getParameter("std");
                                    String emid = session.getAttribute("email_id").toString();
                                    List<Expenditure> expList = expDAO.orderByDateDesc(emid); //default value
                                    if (std != null) {
                                        switch (std) {
                                            case "date_desc":
                                                expList = expDAO.orderByDateDesc(emid);
                                                break;
                                            case "date_asc":
                                                expList = expDAO.orderByDateAsc(emid);
                                                break;
                                            case "amount_desc":
                                                expList = expDAO.orderByAmountDesc(emid);
                                                break;
                                            case "amount_asc":
                                                expList = expDAO.orderByAmountAsc(emid);
                                                break;
                                            case "food":
                                            case "hobby":
                                            case "shopping":
                                            case "living":
                                            case "medical":
                                            case "transpt":
                                            case "finance":
                                            case "other":
                                                expList = expDAO.orderByCategory(std, emid);
                                                break;
                                            default:
                                                expList = expDAO.orderByDateDesc(emid);
                                                break;
                                        }
                                    }
                                    if (expList.isEmpty()) {
                                %>
                                <tr>
                                    <td align="center">
                                        <h4 class="pt-5 pb-2">소비 내역이 없지만, 오히려 좋아요! 👍</h4>
                                        <img src="resources/assets/img/empty.png" width="200" class="pb-5">
                                    </td>
                                </tr>
                                <%} else {%>
                                <tr>
                                    <th>카테고리</th>
                                    <th>소비일자</th>
                                    <th>금액</th>
                                    <th>설명</th>
                                    <th>해시태그</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    DecimalFormat decFormat = new DecimalFormat("###,###");
                                    for (Expenditure exp : expList) {
                                //<a href="util/delete_data.jsp?expend_id=">
                                %>
                                <tr>
                                    <td><%=exp.getCategory()%></td>
                                    <td><%=exp.getExpend_date()%></td>
                                    <td><%=decFormat.format(exp.getAmount())%></td>
                                    <td><%=exp.getDescription()%></td>
                                    <td><%=exp.getTagString().substring(1, exp.getTagString().length()-1)%></td>
                                    <td>
                                        <button class="btn btn-sm script" type="button" onclick="confirm_delete()"
                                                value="<%=exp.getExpend_id()%>" id="delete_btn"
                                                style="width:3rem; color:white; background-color: #c74352">
                                            삭제
                                        </button>
                                    </td>
                                </tr>
                                <% } %>
                                </tbody>
                            </table>
                        </div>
                        <%}%>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<%@ include file="util/scroll_to_top_button.jsp" %>
<%@ include file="util/logout_modal.jsp" %>
<%@ include file="util/js_info.jsp" %>
</body>
</html>