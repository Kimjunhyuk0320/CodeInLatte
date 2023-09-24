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
<%
	// 결제하기에선 넘어 온 유저번호
	String userNo = request.getParameter("userno");

	String userTel = request.getParameter("usertel");
	String[] productNames = request.getParameterValues("productName");
	String[] productPrice = request.getParameterValues("productPrice");
	String[] cartCnt = request.getParameterValues("cartCnt");
	
	AdminRepository adminDAO = new AdminRepository();
	ProductRepository productDAO = new ProductRepository();
	

	out.println("사용자 전화번호 : " + userTel);
	if (productNames != null) {
	    for (int i = 0; i < productNames.length; i++) {
	    	adminDAO.productOrder(userTel, productNames[i], cartCnt[i], productPrice[i]);
	    	
	    	
	        out.println("상품명 " + i + ": " + productNames[i]);
	        out.println("주문수량 " + i + ": " + cartCnt[i]);
	        out.println("상품금액 " + i + ": " + productPrice[i]);
	        out.println("<br>");
	    }
	}
	
	session.setAttribute("cartList", null);
	productDAO.cartDelete(userNo);
	response.sendRedirect("./cart.jsp");
%>

<jsp:include page="/layout/footer.jsp" />
<jsp:include page="/layout/script.jsp"/>
</body>
</html>