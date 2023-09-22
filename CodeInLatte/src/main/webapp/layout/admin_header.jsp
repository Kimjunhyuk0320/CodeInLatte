<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!-- Font Awesome CDN  -->
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<nav class="navbar navbar-expand-lg bg-white" style="height: 150px;">
  <div class="container-fluid">
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="true" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse border-bottom">
	    	<div  class="collapse navbar-collapse d-flex justify-content-start px-3">
	    		<ul class="navbar-nav">
		        	<li class="nav-item px-2">
		          		<a class="navbar-brand px-3" href="admin_main.jsp"><img src="" alt="로고" /></a>
		        	</li>
			        <li class="nav-item px-2">
			           <a class="nav-link link-secondary" href="product_add.jsp">상품등록</a>
			        </li>
			        <li class="nav-item px-2">
			          <a class="nav-link link-secondary" href="admin_products.jsp">상품수정</a>
			        </li>
			        <li class="nav-item px-2">
			          <a class="nav-link link-secondary" href="order_list.jsp">주문내역</a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link link-secondary" href="coupon_list.jsp">쿠폰내역</a>
			        </li>
		      </ul>
	    	</div>
	    		
	      	<div class="collapse navbar-collapse d-flex justify-content-end px-3">
		      <ul class="navbar-nav">
		        <li class="nav-item px-2">
		          <a class="nav-link active" aria-current="page" href="/start/admin_login.jsp">로그인</a>
		        </li>
		      </ul>
	      	</div>
	    </div>
	</div>
</nav>