<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<%@include file="main_header.jsp" %>
<div class="row">
  <div class="dropdown no-arrow mb-0">
    <button class="btn btn-secondary dropdown-toggle ml-3" type="button"
            id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
            aria-expanded="false"
            style="background-color: #0e76a8; border-color: #0e76a8; width: 7rem">날짜순</button>
    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
      <a class="dropdown-item" href="../tables.jsp?std=date_desc">최신순</a>
      <a class="dropdown-item" href="../tables.jsp?std=date_asc">오래된순</a>
    </div>
  </div>

  <div class="dropdown no-arrow mb-0">
    <button class="btn btn-secondary dropdown-toggle ml-3" type="button"
            id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
            aria-expanded="false"
            style="background: #6b35bb; border-color: #6b35bb; width: 7rem">금액순</button>
    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
      <a class="dropdown-item" href="../tables.jsp?std=amount_desc">높은 금액순</a>
      <a class="dropdown-item" href="../tables.jsp?std=amount_asc">낮은 금액순</a>
    </div>
  </div>

  <div class="dropdown no-arrow mb-0">
    <button class="btn btn-secondary dropdown-toggle ml-3" type="button"
            id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
            aria-expanded="false"
            style="background: #be43c7; border-color: #be43c7; width: 7rem">카테고리별</button>
    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
      <a class="dropdown-item" href="../tables.jsp?std=food" >식비</a>
      <a class="dropdown-item" href="../tables.jsp?std=hobby" >취미</a>
      <a class="dropdown-item" href="../tables.jsp?std=shopping">쇼핑</a>
      <a class="dropdown-item" href="../tables.jsp?std=living">생활/주거</a>
      <a class="dropdown-item" href="../tables.jsp?std=medical">의료/피트니스</a>
      <a class="dropdown-item" href="../tables.jsp?std=transpt">교통/자동차</a>
      <a class="dropdown-item" href="../tables.jsp?std=finance">금융/세금</a>
      <a class="dropdown-item" href="../tables.jsp?std=other">기타</a>
    </div>
  </div>
  <%@include file="js_info.jsp" %>
</div>