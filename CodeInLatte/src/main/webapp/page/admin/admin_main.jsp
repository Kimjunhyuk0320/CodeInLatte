<%@page import="cafe.dto.Coupon"%>
<%@page import="cafe.dao.CouponRepository"%>
<%@page import="cafe.dto.Order"%>
<%@page import="java.util.List"%>
<%@page import="cafe.dao.OrderRepository"%>
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
	OrderRepository orderDAO = new OrderRepository();
	List<Order> orderList = orderDAO.orderlist();

	int sum = 0;
	for(int i = 0 ; i < orderList.size() ; i++) {
		Order order = orderList.get(i);
		int orderPrice = order.getOrderPrice();
		sum += orderPrice * order.getOrderCnt();
	}
	CouponRepository couponDAO = new CouponRepository();
	List<Coupon> couponList = couponDAO.couponlist();
	int number = couponList.size();
	String root = request.getContextPath();
%>
	
	<div class="container marketing">
		
		<div class="mt-300 d-flex align-items-center" style="margin-top:50px; margin-bottom:100px;">
	      <div class="col-md-7 text-center" width="500" height="500">
	        <h1 class="featurette-heading fw-normal lh-100">총 매출액</h1>
	        <br>
	        <h2 class="featurette-heading fw-normal lh-100"><%=sum %>원</h2>
	      </div>
	      <div class="col-md-5">
	       <img alt="" src="<%= root %>/static/img/cafe.jpg" width="400" height="400" class="border-black">
	      </div>
		</div>

	<hr class="featurette-divider h-200">
		<div class="mt-300 d-flex align-items-center" style="margin-top:100px; margin-bottom:100px;">
	      <div class="col-md-5">
			<img alt="" src="<%= root %>/static/img/cafe1.jpg" width="400" height="400" class="border-black">
	      </div>
	      <div class="col-md-7 text-center" width="500" height="500">
	        <h1 class="featurette-heading fw-normal lh-100">총 쿠폰 발행 수</h1>
	        <br>
	        <h2 class="featurette-heading fw-normal lh-100"><%= number %>개</h2>
	      </div>
	      </div>
	</div>
	
	
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>