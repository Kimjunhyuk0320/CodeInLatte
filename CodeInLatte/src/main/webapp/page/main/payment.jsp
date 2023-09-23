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
	
	List<Product> paymentsList = productDAO.payMents(userNo);
	
	List<User> userList = userDAO.cartUserSelect(userNo);
	
	out.print(paymentsList.size());
	out.print(userList.size());
%>
	<form method="post" action="order_complete.jsp">
	<%
		for(int i = 0; i < userList.size(); i++) {
			User user = userList.get(i);
	%>
		<p><%= user.getUserNo() %></p>
		<p><%= user.getUserName() %></p>
		<p><%= user.getUserTel() %></p>
		<input type="hidden" name="usertel" value="<%= user.getUserTel() %>" />
		<p><%= user.getUserStamp() %></p>
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