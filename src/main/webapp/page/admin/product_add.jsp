<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		          <li><a href="<%= root %>/page/admin/product_add.jsp" class="nav-link active">상품 등록</a></li>
			      <li><a href="<%= root %>/page/admin/admin_products.jsp" class="nav-link link-body-emphasis">상품 수정</a></li>
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
				<h1 class="display-5 fw-bold text-body-emphasis">상품 등록</h1>
			</div>
			
	<!-- 콘텐츠 내용-->
	<div class="container shop m-auto mb-5">
		<div class="btn-box d-grid gap-2">
			<div id="layoutSidenav_content">	
		
		<!-- 상품 등록 입력 화면 -->
		<!--  	<h3 class="text-center" style="margin-top:20px;">상품 등록</h3>-->
		<div class="container-fluid h-100 form"
			style="background-color: #F9F9F9; padding: 20px; width: 70%;  padding-bottom: 70px;">
			<form name="product" action="product_add_pro.jsp" method="post" enctype="multipart/form-data">
				
				<div class="input-group mb-3 row border-bottom">
					<h4 class="form-label" id="" style="color: #6E6E6E">상품명</h4>
					<input type="text" class="form-control"  style="background-color:#F9F9F9; border-width: 0;" name="name">
				</div>
				
				<div class="input-group mb-3 row border-bottom" style="margin-top: 40px;">
					<h4  class="form-label" id="" style="color: #6E6E6E">상품 이미지</h4>
					<input type="file" class="form-control col-md-10" name="file" style="background-color:#F9F9F9;border-width: 0;">
				</div>	
			
				<div class="input-group mb-3 row border-bottom" style="margin-top: 40px;">
					<h4  class="form-label" id="" style="color: #6E6E6E">카테고리</h4>
					<select name="category" class="form-select h-100" style="background-color:#F9F9F9; border-width: 0;">
						<option value="caffeine">카페인</option>
						<option value="decaffeine">디카페인</option>
						<option value="beverage">음료</option>
					</select>
				</div>
				
				<div class="input-group mb-3 row border-bottom" style="margin-top: 40px;">
					<h4  class="form-label" id="" style="color: #6E6E6E">가격</h4>
					<input type="number" class="form-control" style="background-color:#F9F9F9; border-width: 0;" name="unitPrice">
				</div>
				<div class="input-group mb-3 row" style="margin-top: 40px;">
					<h4  class="form-label" id="description" style="color: #6E6E6E">상세 정보</h4>
					<textarea class="form-control" name="description" 
							  style="height: 300px !important; background-color:#F9F9F9;"></textarea>
				</div>
				
				<div class="d-flex justify-content-center mt-5 mb-5">
					<input type="submit" class="btn btn-lg btn btn-dark" onclick="return checkProduct()" value="상품등록" style="width:50%; height:60px;"/>
				</div>
			</form> 
			<a href="admin_products.jsp" class="btn btn-outline-dark" style="margin-left:20px; margin-top:10px; width:120px; height:40px;">Back</a>
		</div>
						
			</div>	
		</div>	
	</div>	
</div>
	</div>
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>