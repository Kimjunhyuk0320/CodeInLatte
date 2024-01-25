<%@page import="cafe.dao.CouponRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cafe.dao.CouponRepository"%>
<%@ page import="cafe.dto.Coupon"%> 
<%@ page import="java.util.List"%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>쿠폰 목록 불러오기</title>
	<jsp:include page="/layout/link.jsp" />
</head>
<body>
	<jsp:include page="/layout/admin_header.jsp" />

	<%
		CouponRepository couponDAO = new CouponRepository();
		List<Coupon> couponList = couponDAO.couponlist();		
	%>
	
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
			          <li><a href="<%= root %>/page/admin/product_add.jsp" class="nav-link link-body-emphasis">상품 등록</a></li>
				      <li><a href="<%= root %>/page/admin/admin_products.jsp" class="nav-link link-body-emphasis">상품 수정</a></li>
				      <li><a href="<%= root %>/page/admin/order_list.jsp" class="nav-link link-body-emphasis">주문 목록 조회</a></li>
				      <li><a href="<%= root %>/page/admin/coupon_list.jsp" class="nav-link active">쿠폰 목록 조회</a></li>
			      <% } %>
			    </ul>
			    <hr>
			 </div>
		</div>
	
	<!-- 콘텐츠 -->
	<div class="col-md-9 ms-sm-auto col-lg-10 p-0 m-0">
			<div class="px-4 py-3 my-3 text-center">
			<br>
				<h1 class="display-5 fw-bold text-body-emphasis">쿠폰 목록 조회</h1>
			</div>
			
			<!-- 콘텐츠 내용-->
			<div class="container shop m-auto mb-5">
				<div class="btn-box d-grid gap-2">
					<div id="layoutSidenav_content">
					
	<!-- 쿠폰 목록 -->
		<div class="container">
     	<div id="layoutSidenav_content">
        <main>
            <div class="container-fluid">
                
                <div class="card mb-4">
                    <div class="card-body">
                        전체 쿠폰 발급 정보를 보여주는 목록입니다. 
                    </div>
                </div>
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fa fa-table me-1"></i>
                        DataTable CuponList
                    </div>
                    <div class="card-body">
                        <table class="table text-center" id="datatablesSimple">
                   <thead>
					<tr>
						<th>쿠폰번호</th>
						<th>쿠폰명</th>
						<th>쿠폰 발행일</th>
						<th>회원번호</th>
						<th>쿠폰 사용 여부</th>
						<th>비고</th>
					</tr>
				</thead>
			<tbody>

			<%
				String couponName = "";
				for(int i = 0 ; i < couponList.size() ; i++) {
					Coupon coupon = couponList.get(i);
					
					if(coupon.getCouponCheck()==0){
						couponName = "사용가능";
					} else {
						couponName = "사용불가";
					}
			%>
				<tr>
					<td><%= coupon.getCouponNo() %></td>			
					<td><%= coupon.getCouponName()%></td>			
					<td><%= coupon.getCouponDate() %></td>					
					<td><%= coupon.getUserNo() %></td>	
					<td><%= couponName %></td>			
					<td><a href="#" class="btn btn-danger">삭제</a></td>			
				</tr>
				<%
					}
				%>
			</tbody>
			<tfoot>
				<%
					if( couponList.isEmpty() ) {
				%>
				<tr>
					<td colspan="6">발행된 쿠폰이 없습니다.</td>	
				</tr>
				<% } else { %>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td>총 발행된 쿠폰 수</td>
					<td><%= couponList.size() %></td>
				</tr>
				<%
					}
				%>
			</tfoot>
		                 </table>
		             </div>
		         </div>
		     </div>
		 </main>
	 </div>
	 </div>
	</div>
				</div>
			</div>
		</div>

	<jsp:include page="/layout/footer.jsp" />
		</div>
	<jsp:include page="/layout/script.jsp" />
</body>
</html>