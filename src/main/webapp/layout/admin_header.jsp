<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String root = request.getContextPath();
	String loginId = (String) session.getAttribute("loginId");
	
	boolean login = false;
	if( loginId != null && !loginId.isEmpty() ) {
		login = true;
	}
%>

<nav class="navbar bg-dark navbar-expand-lg bg-body-tertiary" data-bs-theme="dark">
  <div class="container-fluid">
      <span style="text-center"><a class="navbar-brand px-3" href="#"><img src="<%= root %>/static/img/white_logo.png" alt="로고" class="w-50 h-50" /></a></span>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
       <ul class="navbar-nav d-flex align-items-center px-3">
       <!-- 비회원 -->
       	<%
       		if( loginId == null || loginId.equals("") ) {
       	%>
        <li class="nav-item"><a class="nav-link" aria-current="page" href="<%= root %>/start/admin_login.jsp">로그인</a></li>
        <%
       		} else {
        %>
        <ul class="navbar-nav">
	        <li class="nav-item px-2"><a class="nav-link link-secondary" href="<%= root %>/page/admin/product_add.jsp">상품등록</a></li>
	        <li class="nav-item px-2"><a class="nav-link link-secondary" href="<%= root %>/page/admin/admin_products.jsp">상품수정</a></li>
	        <li class="nav-item px-2"><a class="nav-link link-secondary" href="<%= root %>/page/admin/order_list.jsp">주문 목록 조회</a></li>
	        <li class="nav-item px-2"><a class="nav-link link-secondary" href="<%= root %>/page/admin/coupon_list.jsp">쿠폰 목록 조회</a></li>
     	 </ul>
         
        <li class="nav-item">
        <div class="dropdown">
	      <a href="#" class="d-flex align-items-center link-body-emphasis text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
	        <img src="https://github.com/mdo.png" alt="" width="32" height="32" class="rounded-circle me-2">
	        <strong><%= loginId %></strong>
	      </a>
	      <ul class="dropdown-menu text-small shadow">
	        <li><a class="dropdown-item" href="<%= root %>/page/admin/admin_main.jsp">관리자 메인화면</a></li>
	        <li><a class="dropdown-item" href="<%= root %>/page/admin/product_add.jsp">상품등록</a></li>
	        <li><a class="dropdown-item" href="<%= root %>/page/admin/admin_products.jsp">상품수정</a></li>
	        <li><a class="dropdown-item" href="<%= root %>/page/admin/order_list.jsp">주문 목록 조회</a></li>
	        <li><a class="dropdown-item" href="<%= root %>/page/admin/coupon_list.jsp">쿠폰 목록 조회</a></li>
	        <li><hr class="dropdown-divider"></li>
	        <li><a class="dropdown-item" href="<%= root %>/page/start/logout.jsp">로그아웃</a></li>
	      </ul>
	    </div>
        </li>
        
        <%
        	}
        %>

      </ul>

    </div>
  </div>
</nav>