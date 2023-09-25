<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="cafe.dto.User"%>
<%@page import="cafe.dao.UserRepository"%>
<%@page import="java.util.List"%>
<%@page import="cafe.dto.Product"%>
<%@page import="cafe.dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productDAO" class="cafe.dao.ProductRepository" />
<jsp:useBean id="userDAO" class="cafe.dao.UserRepository" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>CodeInLatte</title>
	<jsp:include page="/layout/link.jsp" />
</head>
<body>
<jsp:include page="/layout/header.jsp" />
<%
	String userNo = request.getParameter("userNo");
	List<Product> cartList = null;
	List<Product> paymentsList = null;
	List<User> userList = null;
	String usertel = "";
	out.print(userNo);
	if(!userNo.equals("Guest")) {
		paymentsList = productDAO.payMents(userNo);
		
		userList = userDAO.cartUserSelect(userNo);
		
// 		out.print(paymentsList.size());
// 		out.print(userList.size());
	} else {
		cartList = (List<Product>) session.getAttribute("cartList");
		out.print(cartList);
		out.print(cartList.size());
// 		String cartId = session.getId();
		
// 		String userName = "";
// 		String userTel = "";
// 		String productName = "";
// 		String productPrice = "";
// 		String cartCnt = "";
		
// 		Cookie[] cookies = request.getCookies();
// 		if( cookies != null ) {
// 			for(int i = 0; i < cookies.length; i++) {
// 				Cookie cookie = cookies[i];
// 				String cookieName = cookie.getName();
// 				String cookieValue = URLDecoder.decode( cookie.getValue(), "UTF-8" );
// 				switch(cookieName) {
// 					case "userName" 		: userName = cookieValue;
// 					case "userTel" 			: userTel = cookieValue;
// 					case "productName" 		: productName = cookieValue;
// 					case "productPrice" 	: productPrice = cookieValue;
// 					case "cartCnt" 			: cartCnt = cookieValue;
// 				}
// 			}
// 		}
		usertel = "01000000000";
		
	}
	
%>
	<form method="post" action="payment_pro.jsp">
	<%
	 if(!userNo.equals("Guest")) {
	
		for(int i = 0; i < userList.size(); i++) {
			User user = userList.get(i);
	%>
		<p><%= user.getUserNo() %></p>
		<input type="hidden" name="userno" value="<%= user.getUserNo() %>" />
		<p><%= user.getUserName() %></p>
		<p><%= user.getUserTel() %></p>
		<input type="hidden" name="usertel" value="<%= user.getUserTel() %>" />
		<p><%= user.getUserStamp() %></p>
	<%
		}
	 } else {
	%>
		<p>1</p>
		<input type="hidden" name="userno" value="Guest" />
		<p>3</p>
		<p>4</p>
		<input type="hidden" name="usertel" value="<%= usertel %>" />
		<p>6</p>
	<%
	 }
	%>
		<div>
			
		</div>
		
		<table class="table table-striped table-hover table-bordered text-center">
		<thead>
			<tr class="table-primary">
				<th>상품</th>
				<th>가격</th>
				<th>수량</th>
				<th>소계</th>
				<th>비고</th>
			</tr>		
		</thead>
		<tbody>
	<%
	if(!userNo.equals("Guest")) {
		for(int i = 0; i < paymentsList.size(); i++) {
			Product payments = paymentsList.get(i);
			int pNo = payments.getProductNo();
			
			Product product = productDAO.select(String.valueOf(pNo));
	%>
			
			<tr>
				<td><%= product.getProductName() %></td>
				<td><%= product.getProductPrice() %></td>
				<td><%= payments.getCartCnt() %></td>
			</tr>
			<input type="hidden" name="productName" value="<%= product.getProductName() %>">
			<input type="hidden" name="productPrice" value="<%= product.getProductPrice() %>">
			<input type="hidden" name="cartCnt" value="<%= payments.getCartCnt() %>">
	<%
		}
	} else {
		for(int i = 0; i < cartList.size(); i++) {
			Product payments = cartList.get(i);
			out.print(payments.getProductNo());
		
	%>
			<tr>
				<td><%= payments.getProductName() %></td>
				<td><%= payments.getProductPrice() %></td>
				<td><%= payments.getQuantity() %></td>
			</tr>
			<input type="hidden" name="productName" value="<%= payments.getProductName() %>">
			<input type="hidden" name="productPrice" value="<%= payments.getProductPrice() %>">
			<input type="hidden" name="cartCnt" value="<%= payments.getQuantity() %>">
	<%
		}
	}
	%>
		</tbody>
		<tfoot>
		</tfoot>
	</table>
		<input type="submit" class="btn btn-success" value="결제하기">
	</form>
<jsp:include page="/layout/footer.jsp" />
<jsp:include page="/layout/script.jsp"/>
</body>
</html>