<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta charset="utf-8"/>

<%
  String root = "resources/assets/profile/";
  String id = session.getAttribute("email_id").toString();
  dto.User u = dao.UserDAO.getInstance().searchUser(id);
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
<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
  <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
    <i class="fa fa-bars"></i>
  </button>
  <ul class="navbar-nav ml-auto">

    <!-- Nav Item - Search Dropdown (Visible Only XS) -->
    <li class="nav-item dropdown no-arrow d-sm-none">
      <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
         data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <i class="fas fa-search fa-fw"></i>
      </a>
      <!-- Dropdown - Messages -->
      <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
           aria-labelledby="searchDropdown">
        <form class="form-inline mr-auto w-100 navbar-search">
          <div class="input-group">
            <input type="text" class="form-control bg-light border-0 small"
                   placeholder="Search for..." aria-label="Search"
                   aria-describedby="basic-addon2">
            <div class="input-group-append">
              <button class="btn btn-primary" type="button">
                <i class="fas fa-search fa-sm"></i>
              </button>
            </div>
          </div>
        </form>
      </div>
    </li>

    <div class="topbar-divider d-none d-sm-block"></div>

    <li class="nav-item dropdown no-arrow">
      <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
         data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%=u.getUname()%></span>
        <img src="<%=imgPath%>" class="img-profile circle-img">
      </a>

      <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
           aria-labelledby="userDropdown">
        <a class="dropdown-item" href="../profile.jsp">
          <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
          Profile
        </a>
        <div class="dropdown-divider"></div>
        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
          <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
          Logout
        </a>
      </div>
    </li>
  </ul>
</nav>