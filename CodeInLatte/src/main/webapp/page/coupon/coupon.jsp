<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="cafe.dto.User"%>
<%@page import="cafe.dto.Admin"%>
<%@page import="cafe.dao.AdminRepository"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>쿠폰화면</title>
	<jsp:include page="/layout/link.jsp" />
</head>
<body>
	<jsp:include page="/layout/admin_header.jsp" />
	
	<%
	String root = request.getContextPath();
	AdminRepository adminDAO = new AdminRepository();
	Admin coupon = new Admin();
	//List<Admin> couponList = adminDAO.list();	

	// 사용자의 userNo를 가져와서 
	String userNo = (String) session.getAttribute("userNo");
	int coupon_No = coupon.getCouponNo();
	int stampCount = 0;
	
	if( userNo == null ){
		break;
	}
	
	if(userNo==coupon_No){
		stampCount = coupon.getCouponNo();	
	}
	/////////////////////머리가 안돌아간다아아아아
	

	
//	int couponNo = Integer.parseInt(request.getParameter("couponNo"));
	int couponNo = 1;
//	int stampCount = Integer.parseInt(request.getParameter("userStamp"));

	int couponCount = stampCount/10;
	
//	int couponDueDate = coupon_date; // 시간을 365일 을 더해야함.
	String couponDueDate = "2033-09-22";

	stampCount = stampCount%10;

	%>
	<h3 class="text-center">쿠폰 화면</h3>
	<h3 class="text-center">Coupon</h3>

	<!-- 스탬프 -->
	<h3>스탬프 정보(<%= stampCount %>)</h3>
	<hr>
	<%
		for(int i=0 ; i < stampCount; i++){
	%>
	<div class="container">
		<div class="row gy-4">
				<div class="col-md-6 col-xl-4">
					<div class="card p-3">
						<!-- 이미지 영역 -->
						<div class="img-content">
 							<img alt="이미지" src="#"/>
						</div>
							
					</div>
				</div>
		</div>
	</div>
	<%
		}
	%>
	
	<br>
	
	<!-- 보유 쿠폰 -->
	<h3>보유 쿠폰 (<%= couponCount %>)</h3>
	<hr>
	
	<% 
		for(int i = 0; i < couponCount; i++){
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h3> 아메리카노 1잔 무료 이용 쿠폰 </h3>
				<p>쿠폰명 : <%= request.getParameter("CouponName") %> </p>
				<p>쿠폰 유효기간 : <%= couponDueDate  %></p>
				<p>
					<a href="./coupon/coupon_pro.jsp?couponNo=<%= couponNo %>" class="btn btn-info">쿠폰 사용하기</a>
				</p>
			</div>
		</div>
	</div>
	<%
		}
	%>
	
	<div class="d-flex justify-content-center mt-5 mb-5">
		<a href="javascript: history.back()" class="btn btn-lg btn-secondary mx-3">back</a>
	</div>	
	
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>