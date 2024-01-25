<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="cafe.dto.Coupon"%>
<%@page import="cafe.dto.User"%>
<%@page import="cafe.dto.Admin"%>
<%@page import="cafe.dto.Product"%>
<jsp:useBean id="couponDAO" class="cafe.dao.CouponRepository"/>
<jsp:useBean id="userDAO" class="cafe.dao.UserRepository"/>
<jsp:useBean id="adminDAO" class="cafe.dao.AdminRepository"/>
<jsp:useBean id="productDAO" class="cafe.dao.ProductRepository"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>사용 완료 쿠폰</title>
	<jsp:include page="/layout/link.jsp" />
</head>
<body> 
	<jsp:include page="/layout/header.jsp" />
	<% 
		String root = request.getContextPath();
		String userId = (String) session.getAttribute("loginId");
		String couponNo = request.getParameter("couponNo");
		int userNo = userDAO.getUserById(userId).getUserNo();
// 		String userTel = request.getParameter("usertel");
		
		String userTel = userDAO.getUserById(userId).getUserTel();
		int stampCount = userDAO.getUserByTel(userTel).getUserStamp();
		int completedCount = 0;
		
		List<Coupon> couponlist = null;
		Coupon coupon = null;
		
		coupon = couponDAO.nonCompleCoupon(userNo, 0);
		int noncompl = coupon.getCount();
// 		out.print(noncompl);
		coupon = couponDAO.nonCompleCoupon(userNo, 1);
		int compl = coupon.getCount();
// 		out.print(compl);
		
		if(couponNo != null) {
			couponlist = couponDAO.couponCompletelist(userNo);
			if(completedCount == 0) {
				for(int i = 0; i < couponlist.size(); i++){
					coupon = couponlist.get(i);
					if(coupon.getCouponCheck() == 0) {
						completedCount++;
						int cpn = Integer.parseInt(couponNo);
						couponDAO.couponUpdate(userNo, cpn, completedCount);
					}
				}
			}
		} else {
			couponlist = couponDAO.couponCompletelist(userNo);
		}
// 		out.print("aaaaaaaaaa");
		
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
	<!-- 사용 완료 쿠폰 -->
	<h3>사용 완료 쿠폰 (<%= compl %>)</h3>
	<hr>
	
<!-- 		<form action="coupon_pro.jsp" method="post"> -->
			<div class="container">
				<div class="d-flex justify-content-around border-bottom my-3 w-100 text-center"> 
					<div class="py-3 w-100 " name="completedCount"><a href="./coupon.jsp" class="d-block">사용 가능 쿠폰(<%= noncompl %>)</a></div>
					<div class="py-3 w-100 bg-dark bg-gradient text-white" name="couponCount"><a href="./coupon_complete.jsp" class="d-block">사용 완료 쿠폰(<%= compl %>)</a></div>
				</div>
			</div>
<!-- 		</form> -->
	<div class="d-flex">
	<%
		for(int i = 0; i < couponlist.size(); i++){
			coupon = couponlist.get(i);
			if(coupon.getCouponCheck() == 1) {
	%>
	
	       <<div class="coupon_box mx-1">
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
				<a href="#" class="btn btn-outline-dark" >사용완료</a>
			</div>
		</div>
	<%
			}
		}
	%>
	</div>
		<div class="d-flex justify-content-center mt-5 mb-5">
			<a href="javascript: history.back()" class="btn btn-lg btn-secondary mx-3">back</a>
		</div>	

	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
	
</body>
</html>





