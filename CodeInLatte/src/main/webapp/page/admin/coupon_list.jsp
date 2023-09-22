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

	<h3 class="text-center">쿠폰 목록</h3>
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
				for(int i = 0 ; i < couponList.size() ; i++) {
					Admin admin = couponList.get(i);
			%>
				<tr>
					<td><%= admin.getCouponNo() %></td>			
					<td><%= admin.getCouponName()%></td>			
					<td><%= admin.getCouponDate() %></td>			
					<td><%= admin.getCouponImg() %></td>			
					<td><%= admin.getUserNo() %></td>			
					<td><%= admin.getCouponCheck() %></td>			
					<td><a href="" class="btn btn-danger">삭제</a></td>			
				</tr>
				<%
					}
				%>
			</tbody>
			<tfoot>
				<%
					if( couponList.isEmpty() ) {
				%>
				<tr>
					<td colspan="6">발행된 쿠폰이 없습니다.</td>	
				</tr>
				<% } else { %>
				<tr>
					<td></td>
					<td></td>
					<td>총 발행된 쿠폰 수</td>
					<td><%= couponList.size() %></td>
					<td></td>
				</tr>
				<%
					}
				%>
			</tfoot>
		</table>
	</div>
	
	<!-- 버튼 영역 -->
	<div class="d-flex justify-content-between mt-5 mb-5">
		<div class="item">
			<a href="javascript: history.back()" class="btn btn-lg btn-success">이전</a>
		</div>  
	</div>
		
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>