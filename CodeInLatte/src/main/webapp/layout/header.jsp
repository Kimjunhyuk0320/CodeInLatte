<%@page import="cafe.dto.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	List<Product> cartList = (List<Product>) session.getAttribute("cartList");
	int cartCount = cartList == null ? 0 : cartList.size();
// 	int cartCount = 0;
// 	if(cartList != null) cartCount = cartList.size();
	
	String root = request.getContextPath();
	
// 	String loginId = (String) session.getAttribute("loginId");
%>
 
<!-- Font Awesome CDN  -->
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<nav class="navbar navbar-expand-lg bg-white" style="height: 150px;">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse border-bottom">
    <a class="navbar-brand px-3" href="#"><img src="" alt="로고" /></a>
      	<div class="collapse navbar-collapse d-flex justify-content-end px-3">
	      <ul class="navbar-nav">
	        <li class="nav-item px-2">
	          <a class="nav-link active" aria-current="page" href="<%= root %>/page/start/login.jsp">로그인</a>
	        </li>
	        <li class="nav-item px-2">
	          <a class="nav-link" href="<%= root %>/page/user/join.jsp">회원가입</a>
	        </li>
	        <li class="nav-item px-2">
	          <a class="nav-link" href="<%= root %>/page/coupon/couporn.jsp">Coupon(0)</a>
	        </li>
	        <li class="nav-item px-2">
	          <a class="nav-link" href="cart.jsp"><i class="fa fa-shopping-cart fs-5"></i>(<%= cartCount %>)</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="#"><i class="fa fa-user-o fs-5"></i></a>
	        </li>
	      </ul>
      	</div>
    </div>
  </div>
</nav>