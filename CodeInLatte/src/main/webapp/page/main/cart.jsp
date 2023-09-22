<%@page import="java.util.ArrayList"%>
<%@page import="cafe.dto.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    
<% 	
	String root = request.getContextPath();

	// 장바구니 목록을 세션에서 가져오기
	List<Product> cartList = (List<Product>) session.getAttribute("cartList");
	if(cartList == null) cartList = new ArrayList<Product>();
	
	// 세션ID : 고유한 식별 정보 긴 문자열로 표현
// 	String cartId = session.getId();
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<jsp:include page="/layout/link.jsp" />
</head>
<body>
<jsp:include page="/layout/header.jsp" />
<!-- 장바구니 영역 -->
	<div class="container">
	<!-- 장바구니 목록 -->
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
				int sum = 0;
				for(int i = 0; i < cartList.size(); i++) {
					Product product = cartList.get(i);
					int total = product.getProductPrice() * product.getQuantity();
					sum += total;
			%>
			<tr>
				<td><%= product.getProductName() %></td>
				<td><%= product.getProductPrice() %></td>
				<td><%= product.getQuantity() %></td>
				<td><%= total %></td>
				<td><a href="removeCart.jsp?id=<%= product.getProductNo() %>" class="btn btn-danger">삭제</a></td>
			</tr>
			<%
				}
			%>
		</tbody>
		<tfoot>
		<%
			if(!cartList.isEmpty()) {
		%>
			<tr>
				<td></td>
				<td></td>
				<td>총액</td>
				<td><%= sum %></td>
				<td></td>
			</tr>
		<%
			} else {
		%>
			<tr>
				<td colspan="5">추가된 상품이 없습니다.</td>
			</tr>
		<%
			} 
		%>
		</tfoot>
	</table>
	
	<!-- 버튼 영역 -->
		<div class="d-flex justify-content-between align-items-center p-3">
			<a href="removeCart.jsp?cartId=" class="btn btn-lg btn-danger">삭제하기</a>
			<a href="ship.jsp?cartId=" class="btn btn-lg btn-primary">주문하기</a>
		</div>
	</div>
<jsp:include page="/layout/footer.jsp" />
<jsp:include page="/layout/script.jsp"/>
</body>
</html>