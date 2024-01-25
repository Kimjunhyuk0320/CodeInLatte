<%@page import="cafe.dto.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="productDAO" class="cafe.dao.ProductRepository" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/layout/link.jsp" />

</head>
<body>
<jsp:include page="/layout/admin_header.jsp" />

		<%
			String root = request.getContextPath();
			List<Product> productList = productDAO.list(); 
		%>
		
		<%
		String loginId = (String) session.getAttribute("loginId");
	
		boolean login = false;
		if( loginId != null && !loginId.isEmpty() ) {
			login = true;
		}
%>	
	<div class="row m-0 mypage">
		<!-- 사이드바 -->
		<div class="sidebar border border-right col-md-3 col-lg-2 p-0 bg-body-tertiary">
			<div class="d-flex flex-column flex-shrink-0 p-3 bg-body-tertiary">
			    <ul class="nav nav-pills flex-column mb-auto">
			      <!-- 로그인 시 -->
			      <% if( login ) { %>
					  <li><a href="<%= root %>/page/admin/admin_main.jsp" class="nav-link link-body-emphasis">관리자 메인페이지</a></li>
			          <li><a href="<%= root %>/page/admin/product_add.jsp" class="nav-link link-body-emphasis">상품 등록</a></li>
				      <li><a href="<%= root %>/page/admin/admin_products.jsp" class="nav-link active">상품 수정</a></li>
				      <li><a href="<%= root %>/page/admin/order_list.jsp" class="nav-link link-body-emphasis">주문내역</a></li>
				      <li><a href="<%= root %>/page/admin/coupon_list.jsp" class="nav-link link-body-emphasis">쿠폰내역</a></li>
			      <% } %>
			    </ul>
			    <hr>
			 </div>
		</div>
	
	<!-- 콘텐츠 -->
	<div class="col-md-9 ms-sm-auto col-lg-10 p-0 m-0">
			<div class="px-4 py-3 my-3 text-center">
				<br>
				<h1 class="display-5 fw-bold text-body-emphasis">상품 수정/삭제 목록</h1>
			</div>
			
			<!-- 콘텐츠 내용-->
			<div class="container shop m-auto mb-5">
				<div class="btn-box d-grid gap-2">
					<div id="layoutSidenav_content">
	<div class="container mb-5 ">
		<div class="row gy-4">
			<%
				for(int i = 0 ; i < productList.size() ; i++) {
					Product product = productList.get(i);
			%>
				<div class="col-md-6 col-xl-4 col-xxl-3">  
					<div class="card p-3" style="width:300px; height:400px;">
						<!-- 이미지 영역 -->
						<div class="img-content"  style="height:250px;">
							<img src="<%= root %>/img?id=<%= product.getProductNo() %>" class="w-100 p-2 h-100"  />
						</div>
						<!-- 컨텐츠 영역 -->
						<div class="content">
							<p style="font-size:20px; "><%= product.getProductName() %></p>
							<p  style="font-size:15px; color:#949090; line-height:0px;"><%= product.getProductCat() %></p>  
							<div class="d-flex justify-content-between">
							
								<div>
									<p class="text-end price" style="color:#544837; ">₩ <%= product.getProductPrice() %></p>						
								</div>
								<div>								
									<a href="product_delete_pro.jsp?id=<%= product.getProductNo() %>"
											   class="btn btn-danger mx-1">삭제</a>
									<a href="product_update.jsp?id=<%= product.getProductNo() %>"
											   class="btn btn-dark mx-1">수정</a>
								</div>
							</div>
						
						</div>						
					</div>
				</div>
			<%
				}
			%>
		</div>
	</div>

	</div></div></div></div></div>
	
	
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>