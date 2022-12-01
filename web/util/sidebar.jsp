<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta charset="utf-8"/>

<html>
<body>
<!-- Sidebar -->
<div id="wrapper">
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="../main.jsp"
           style="margin-top: 1rem">
            <div class="sidebar-brand-icon srotate-n-15">
                <img src="resources/assets/logo.png" style="max-width: 45px; height: auto;">
            </div>
            <div class="sidebar-brand-text mx-2" style="font-size: 12px">My Minimal<br>Account Book</div>
        </a>
        <!-- 프로필사진 **수정요망** -->
        <li class="nav-item active">
            <img src="resources/assets/img/undraw_profile.svg"
                 style="max-width: 200px; height: auto; display:block; margin:auto; margin-top: 1rem; margin-bottom: 1rem">
        </li>

        <!-- Nav Item - Dashboard -->
        <li class="nav-item active">
            <a class="nav-link" href="../main.jsp">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>Dashboard</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Nav Item - Charts -->
        <li class="nav-item">
            <a class="nav-link" href="../charts.jsp">
                <i class="fas fa-fw fa-chart-line"></i>
                <span>Charts</span></a>

            <!-- Nav Item - Tables -->
        <li class="nav-item">
            <a class="nav-link" href="../tables.jsp">
                <i class="fas fa-fw fa-table"></i>
                <span>Tables</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block">


        <!-- Nav Item - User Information -->
        <li class="nav-item">
            <a class="nav-link" href="../profile.jsp">
                <i class="fas fa-user"></i>
                Profile
            </a>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="#" data-toggle="modal" data-target="#logoutModal">
                <i class="fas fa-sign-out-alt"></i>
                Logout
            </a>
        </li>

        <li class="nav-item" style="position: fixed; bottom: 10px; left: 0px;">
            <div class="container my-auto">
                <div class="copyright text-center my-auto" style="color: lightgrey; font-size: 15px">
                    <span style="">Copyright &copy<br>My Minimal Account Book</span>
                </div>
            </div>
        </li>
    </ul>
    <!-- End of Sidebar -->
</div>
<%@include file="js_info.jsp"%>
</body>
</html>