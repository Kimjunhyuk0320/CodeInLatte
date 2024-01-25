<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
	<%
		String root = request.getContextPath();
		String loginId = (String) session.getAttribute("loginId");
	
		boolean login = false;
		if( loginId != null && !loginId.isEmpty() ) {
			login = true;
		}
	%>	
	
	<!-- 사이드바 -->
		<div class="sidebar border border-right col-md-3 col-lg-2 p-0 bg-body-tertiary">
			<div class="d-flex flex-column flex-shrink-0 p-3 bg-body-tertiary">
			    <ul class="nav nav-pills flex-column mb-auto">
			      <!-- 로그인 시 -->
			      <% if( login ) { %>
			  <li><a href="<%= root %>/page/admin/admin_main.jsp" class="nav-link active">관리자 메인페이지</a></li>
	          <li><a href="<%= root %>/page/admin/product_add.jsp" class="nav-link link-body-emphasis">상품 등록</a></li>
		      <li><a href="<%= root %>/page/admin/admin_products.jsp" class="nav-link link-body-emphasis">상품 수정</a></li>
		      <li><a href="<%= root %>/page/admin/order_list.jsp" class="nav-link link-body-emphasis">주문내역</a></li>
		      <li><a href="<%= root %>/page/admin/coupon_list.jsp" class="nav-link link-body-emphasis">쿠폰내역</a></li>
			      <% } %>

			    </ul>
			    <hr>
			  </div>
		</div>
