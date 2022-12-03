<%@ page import="dao.UserDAO" %>
<%@ page import="dto.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<title>My Minimal Account Book - Admin</title>
<%@include file="util/main_header.jsp" %>

<script type="text/javascript">
    function confirm_delete() {
        const exp_id = document.getElementById("delete_btn").value;
        console.log(exp_id);
        var pt = prompt("삭제된 유저는 복구할 수 없습니다. 삭제를 원하시면 'delete'를 입력해주세요.");
        if (pt == "delete") {
            location.href = "../util/delete_user.jsp?email_id=" + exp_id.toString();
            return;
        } else {
            alert("확인 문구가 일치하지 않습니다.");
            return;
        }
    }
</script>
<body id="page-top">
<div id="wrapper">
    <ul class="navbar-nav bg-gradient-dark sidebar sidebar-dark accordion" id="accordionSidebar">
        <a class="sidebar-brand d-flex align-items-center justify-content-center mt-3 mb-3" href="admin.jsp">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-laugh-wink"></i>
            </div>
            <div class="sidebar-brand-text mx-3">Admin Mode</div>
        </a>
        <hr class="sidebar-divider my-0 mb-2">

        <li class="nav-item">
            <a class="nav-link" href="admin.jsp">
                <i class="fas fa-fw fa-solar-panel"></i>
                <span style="font-size: medium">User Management</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="index.jsp">
                <i class="fas fa-sign-out-alt"></i>
                <span style="font-size: medium">Logout</span>
            </a>
        </li>
    </ul>

    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
            <div class="container-fluid">
                <p class="pt-5 mb-4 ml-4 text-gray-800" style="font-weight:bold; font-size: 35px">🔐 회원 관리</p>
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="80%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>Email</th>
                                    <th>Password</th>
                                    <th>Name</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>Email</th>
                                    <th>Password</th>
                                    <th>Name</th>
                                    <th></th>
                                </tr>
                                </tfoot>
                                <tbody>

                                <% List<User> userList = UserDAO.getInstance().listUser();
                                    for (User u : userList) {%>
                                <tr>
                                    <td><%=u.getEmail_id()%>
                                    </td>
                                    <td><%=u.getPwd()%>
                                    </td>
                                    <td><%=u.getUname()%>
                                    </td>
                                    <td>
                                        <button class="btn btn-sm script" type="button" onclick="confirm_delete()"
                                                id="delete_btn" value="<%=u.getEmail_id()%>"
                                                style="width:5rem; color:white; background-color: #6a6f73">
                                            유저삭제
                                        </button>
                                    </td>
                                </tr>
                                <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright &copy; My Minimal AccountBook</span>
                </div>
            </div>
        </footer>
    </div>
</div>
</body>

</html>