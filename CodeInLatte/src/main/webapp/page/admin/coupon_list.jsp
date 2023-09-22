<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cafe.dao.AdminRepository"%>
<%@ page import="cafe.dto.Admin"%>
<%@ page import="java.util.List"%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>쿠폰 목록 불러오기</title>
	<jsp:include page="/layout/link.jsp" />
</head>
<body>
	<jsp:include page="/layout/header.jsp" />
	
	<%
		AdminRepository adminDAO = new AdminRepository();
		List<Admin> couponList = adminDAO.list(); 
	%>

	<!-- 쿠폰 목록 -->
	<div class="cart-box">
			<table class="table table-striped table-hover table-bordered text-center align-middle">
			<thead>
				<tr class="table-primary">
					<th>쿠폰번호</th>
					<th>쿠폰명</th>
					<th>쿠폰 발행일</th>
					<th>쿠폰 이미지</th>
					<th>회원번호</th>
					<th>쿠폰 사용 여부</th>
				</tr>
			</thead>
			<tbody>

				<%
					int sum = 0;
					for(int i = 0 ; i < cartList.size() ; i++) {
						Product product = cartList.get(i);
						int total = product.getUnitPrice() * product.getQuantity();
						sum += total;
				%>
				<tr>
					<td><%= admin.getName() %></td>			
					<td><%= product.getUnitPrice() %></td>			
					<td><%= product.getQuantity() %></td>			
					<td><%= total %></td>			
					<td><a href="" class="btn btn-danger">삭제</a></td>			
				</tr>
				<%
					}
				%>
			</tbody>
			<tfoot>
				<%
					if( cartList.isEmpty() ) {
				%>
				<tr>
					<td colspan="5">추가된 상품이 없습니다.</td>	
				</tr>
				<% } else { %>
				<tr>
					<td></td>
					<td></td>
					<td>총액</td>
					<td><%= sum %></td>
					<td></td>
				</tr>
				<%
					}
				%>
			</tfoot>
		</table>
	</div>  
	
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>