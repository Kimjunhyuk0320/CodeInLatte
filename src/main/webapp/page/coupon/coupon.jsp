<%@page import="org.apache.*"%>
<%@page import="cafe.dao.CouponRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="cafe.dto.Admin" %>
<%@ page import="cafe.dto.Coupon" %>
<%@ page import="cafe.dto.User" %>
<%@ page import="cafe.dto.Product" %>
<jsp:useBean id="couponDAO" class="cafe.dao.CouponRepository"/>
<jsp:useBean id="userDAO" class="cafe.dao.UserRepository"/>
<jsp:useBean id="adminDAO" class="cafe.dao.AdminRepository"/>
<jsp:useBean id="productDAO" class="cafe.dao.ProductRepository"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>쿠폰화면</title>
	<jsp:include page="/layout/link.jsp" />
</head>
<body>
	<jsp:include page="/layout/header.jsp" />
	<% 
		String root = request.getContextPath();
	
		String couponNo = request.getParameter("couponNo");
		String userId = (String) session.getAttribute("loginId");
// 		out.print("userId : " + userId + " ");
// 		out.print("couponNo : " + couponNo + " ");
		
		String userTel = userDAO.getUserById(userId).getUserTel();
// 		out.print("userTel : " + userTel + " ");
		int userNo = userDAO.getUserById(userId).getUserNo();
		
		int stampCount = userDAO.getUserByTel(userTel).getUserStamp();
				
		List<Coupon> couponlist = couponDAO.couponCompletelist(userDAO.getUserByTel(userTel).getUserNo());
		
		Coupon coupon = null;
		coupon = couponDAO.nonCompleCoupon(userNo, 0);
		int noncompl = coupon.getCount();
// 		out.print(noncompl);
		coupon = couponDAO.nonCompleCoupon(userNo, 1);
		int compl = coupon.getCount();
// 		out.print(compl);
	%>
		<h3 class="text-center">쿠폰 화면</h3>
	
		<!-- 스탬프 -->

		<h3>스탬프 정보(<%= stampCount %>)</h3>
		<hr>
		
	<div class="container stamp" >
		<h2> <img alt="로고이미지" src="<%= root %>/static/img/logo.png">  </h2>
		<div>
			<div class="stamp_box_bak">
				<div class="img_box">
					<img alt="이미지" src="<%= root %>/static/img/stamp_white.png"/>
				</div>
				<div class="img_box">
					<img alt="이미지" src="<%= root %>/static/img/stamp_white.png"/>
				</div>
				<div class="img_box">
					<img alt="이미지" src="<%= root %>/static/img/stamp_white.png"/>
				</div>
				<div class="img_box">
					<img alt="이미지" src="<%= root %>/static/img/stamp_white.png"/>
				</div>
				<div class="img_box">
					<img alt="이미지" src="<%= root %>/static/img/stamp_white.png"/>
				</div>
				<div class="img_box">
					<img alt="이미지" src="<%= root %>/static/img/stamp_white.png"/>
				</div>
				<div class="img_box">
					<img alt="이미지" src="<%= root %>/static/img/stamp_white.png"/>
				</div>
				<div class="img_box">
					<img alt="이미지" src="<%= root %>/static/img/stamp_white.png"/>
				</div>
				<div class="img_box">
					<img alt="이미지" src="<%= root %>/static/img/stamp_white.png"/>
				</div>
				<div class="img_box">
					<img alt="이미지" src="<%= root %>/static/img/stamp_white.png"/>
				</div>
			</div>
		</div>
		<div class="stamp_box">
	<%
		for(int i=0 ; i < stampCount; i++){
	%>
			<div class="img_box">
				<img alt="이미지" src="<%= root %>/static/img/stamp_color.png"/>
			</div>
	<%
		}
	%>
		</div>
	</div>
	
	<br>
	<!-- 보유 쿠폰 -->
	<h3>보유 쿠폰 (<%= noncompl %>)</h3>
	<hr>
		
			<div class="container over_auto">
				<div class="d-flex justify-content-around border-bottom my-3 w-100 text-center"> 
					<div class="py-3 w-100 bg-dark bg-gradient text-white" name="completedCount"><a href="./coupon.jsp" class="d-block">사용 가능 쿠폰(<%= noncompl %>)</a></div>
					<div class="py-3 w-100 " name="couponCount"><a href="./coupon_complete.jsp" class="d-block">사용 완료 쿠폰(<%= compl %>)</a></div>
				</div>
			</div>
<!-- 		<form action="coupon_pro.jsp" method="post"> -->
	<div class="d-flex">
	<%
		for(int i = 0; i < couponlist.size(); i++){
			coupon = couponlist.get(i);
			
			
			if(coupon.getCouponCheck() == 0) {
				
			
	%>		
		<div class="coupon_box mx-1">
			<div class="coupon_img">
				<img alt="쿠폰이미지" src="<%= coupon.getCouponImg() %>">
			</div>
			<div class="coupon_con">
				<ul>
					<li><span>Coupon No. </span><%= coupon.getCouponNo() %></li>
					<li><h3><%= coupon.getCouponName() %></h3></li>
					<li><span>유효기간 : </span> <%= coupon.getCouponDueDate() %></li>
				</ul>
			</div>
			<div class="coupon_use">
				<a href="./coupon_complete.jsp?couponNo=<%= coupon.getCouponNo() %>&&usertel=<%= userTel %>" class="btn btn-outline-dark" onclick="return usedCoupon()">사용하기</a>
			</div>
		</div>
	<%
			}
		}
	%>
	</div>
<!-- 	</form> -->
	
		<div class="d-flex justify-content-center mt-5 mb-5">
			<a href="javascript: history.back()" class="btn btn-lg btn-secondary mx-3">back</a>
		</div>
		
	<script>
	// 쿠폰 사용하기
	function usedCoupon() {
		if( confirm("쿠폰을 사용하시겠습니까?") ) {
			return true;
		} else {
			return false;
		}
	}
	</script>
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
	
</body>
</html>