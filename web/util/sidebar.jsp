<%@ page import="dao.UserDAO" %>
<%@ page import="dto.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta charset="utf-8"/>
<html>
<body>
<%
    String root = "resources/assets/profile/";
    String id = session.getAttribute("email_id").toString();
    User u = UserDAO.getInstance().searchUser(id);
    String imgPath = root + u.getProfile_img();
    System.out.println("\nprofile image path = " + imgPath);
%>
<style>
    .circle-img {
        object-fit: cover;
        object-position: top; /*정사각형이 아니라 직사각형일 경우 원 안에 보여지게 할 중심 이미지의 위치를 지정*/
        border-radius: 50%; /*사각형의 모서리 둥근 정도를 지정하는 속성인데 50%를 지정하면 완전한 원이 됨*/
        position: relative;
        display: block;
        width : 11rem;
        height: 11rem;
    }
</style>
<div id="wrapper">
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="../main.jsp"
           style="margin-top: 1rem">
            <div class="sidebar-brand-icon srotate-n-15">
                <img src="/resources/assets/logo.png" style="max-width: 45px; height: auto;">
            </div>
            <div class="sidebar-brand-text mx-2" style="font-size: 12px">My Minimal<br>Account Book</div>
        </a>

        <li class="nav-item active pb-lg-5">
            <div class="mb-3 mt-5" style="margin-left: 1.4rem">
                <img src="<%=imgPath%>" class="circle-img">
            </div>
            <div class="border-left-danger ml-3">
                <h3 style="font-weight: bold; color: white; padding-left: 0.8rem;"><%=u.getUname()%></h3>
                <p style="color: lightgray; font-size: 12px; padding-left: 0.8rem;"><%=u.getEmail_id()%></p>
            </div>
        </li>

        <li class="nav-item active">
            <a class="nav-link" href="../main.jsp">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>Dashboard</span></a>
        </li>

        <hr class="sidebar-divider">

        <li class="nav-item">
            <a class="nav-link" href="../tables.jsp">
                <i class="fas fa-fw fa-table"></i>
                <span>Tables</span></a>
        </li>

        <hr class="sidebar-divider d-none d-md-block">

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
</div>
<%@include file="js_info.jsp"%>
</body>
</html>