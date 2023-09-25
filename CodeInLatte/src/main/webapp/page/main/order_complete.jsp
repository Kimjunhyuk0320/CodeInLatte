<%@page import="java.util.UUID"%>
<%@page import="cafe.dto.User"%>
<%@page import="java.util.List"%>
<%@page import="cafe.dao.UserRepository"%>
<%@page import="cafe.dao.ProductRepository"%>
<%@page import="cafe.dao.AdminRepository"%>
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
<div>
<% 

	String usertel = request.getParameter("usertel");
	AdminRepository adminDAO = new AdminRepository();
	
	String orderCompleteNo = adminDAO.orderCompleteSelect(usertel).getOrderNumber();
	
%>
	<h3>주문번호</h3>
	<h4><%= orderCompleteNo %></h4>
	<h1>결제완료</h1>
</div>
<jsp:include page="/layout/footer.jsp" />
<jsp:include page="/layout/script.jsp"/>
</body>
</html>