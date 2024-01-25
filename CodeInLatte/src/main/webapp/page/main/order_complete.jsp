<%@page import="java.util.UUID"%>
<%@page import="cafe.dto.User"%>
<%@page import="java.util.List"%>
<%@page import="cafe.dao.UserRepository"%>
<%@page import="cafe.dao.ProductRepository"%>
<%@page import="cafe.dao.AdminRepository"%>
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
<jsp:include page="/layout/header.jsp" />
<% 
	String root = request.getContextPath();
	String usertel = request.getParameter("usertel");
	OrderRepository orderDAO = new OrderRepository();
	
	String orderCompleteNo = orderDAO.orderCompleteSelect(usertel).getOrderNumber();
	
%>
<div class="container w-100">
	<div class="order_compl_box text-center">
		<img src="<%= root %>/static/img/logo.png" />
		<h3 class="mt-3">주문번호</h3>
		<h4><%= orderCompleteNo %></h4>
		<h1>결제완료</h1>
	<a href="<%= root %>/page/main/main_cat1.jsp" class="btn btn-outline-dark">상품목록</a>
	</div>
</div>
<jsp:include page="/layout/footer.jsp" />
<jsp:include page="/layout/script.jsp"/>
</body>
</html>