<%@page import="cafe.dto.Order"%>
<%@page import="cafe.dao.OrderRepository"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
<head>
	<meta charset="UTF-8">
	<title>전체 사용자 주문 내역 목록 불러오기</title>
	<jsp:include page="/layout/link.jsp" />
</head>
<body>
	<jsp:include page="/layout/admin_header.jsp" />
	<%
		OrderRepository orderDAO = new OrderRepository();
		List<Order> orderList = orderDAO.orderlist();
	%>
	<%
		String root = request.getContextPath();
		String loginId = (String) session.getAttribute("loginId");
	
		boolean login = false;
		if( loginId != null && !loginId.isEmpty() ) {
			login = true;
		}
%>	
	<div class="row m-0 mypage">
		<!-- 사이드바 -->
		<div class="sidebar border border-right col-md-3 col-lg-2 p-0 bg-body-tertiary">
			<div class="d-flex flex-column flex-shrink-0 p-3 bg-body-tertiary">
			    <ul class="nav nav-pills flex-column mb-auto">
			      <!-- 로그인 시 -->
			      <% if( login ) { %>
					  <li><a href="<%= root %>/page/admin/admin_main.jsp" class="nav-link link-body-emphasis">관리자 메인페이지</a></li>
			          <li><a href="<%= root %>/page/admin/product_add.jsp" class="nav-link link-body-emphasis">상품 등록</a></li>
				      <li><a href="<%= root %>/page/admin/admin_products.jsp" class="nav-link link-body-emphasis">상품 수정</a></li>
				      <li><a href="<%= root %>/page/admin/order_list.jsp" class="nav-link active">주문 목록 조회</a></li>
				      <li><a href="<%= root %>/page/admin/coupon_list.jsp" class="nav-link link-body-emphasis">쿠폰 목록 조회</a></li>
			      <% } %>
			    </ul>
			    <hr>
			 </div>
		</div>
	
	<!-- 콘텐츠 -->
	<div class="col-md-9 ms-sm-auto col-lg-10 p-0 m-0">
			<div class="px-4 py-3 my-3 text-center">
			<br>
				<h1 class="display-5 fw-bold text-body-emphasis">주문 목록 조회</h1>
			</div>
			
			<!-- 콘텐츠 내용-->
			<div class="container shop m-auto mb-5">
				<div class="btn-box d-grid gap-2">
					<div id="layoutSidenav_content">
	<!-- 주문 목록 -->
		<div class="container">
     	<div id="layoutSidenav_content">
        <main>
            <div class="container-fluid">
               
                <div class="card mb-4">
                    <div class="card-body">
                        전체 사용자의 주문 정보를 보여주는 목록입니다. 
                    </div>
                </div>
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fa fa-table me-1"></i>
                        DataTable OrderList
                    </div>
                    <div class="card-body">
                        <table class="table text-center" id="datatablesSimple">
                            <thead>
                                <tr>
									<th>결제번호</th>
									<th>상품명</th>
									<th>수량</th>
									<th>연락처</th>
									<th>주문번호</th>
									<th>주문일자</th>
									<th>합계</th>
									<th>비고</th>
									<th></th>
                                </tr>
                            </thead>
                            <tbody>
                          <%
                          	int sum = 0;
        					for(int i = 0 ; i < orderList.size() ; i++) {
        					Order order = orderList.get(i);
        					int orderPrice = order.getOrderPrice();
          					sum += orderPrice;
						  %>
							<tr>
								<td><%= order.getOrderNo() %></td>			
								<td><%= order.getOrderName()%></td>			
								<td><%= order.getOrderCnt()%></td>			
								<td><%= order.getUserTel() %></td>			
								<td><%= order.getOrderNumber() %></td>
								<td><%= order.getOrderDate() %></td>			
								<td><%= order.getOrderPrice() * order.getOrderCnt() %></td>
								<td><a href="#" class="btn btn-danger">삭제</a></td>			
							</tr>
						 <%
							}
						 %>
                            </tbody>
                            <tfoot>
						<%
							if( orderList.isEmpty() ) {
						%>
							<tr>
								<td colspan="6">주문 목록이 없습니다.</td>	
							</tr>
						<% } else { %>
							<tr>
								<td></td>
								<td>총 주문 수</td>
								<td><%= orderList.size() %></td>
								<td></td>
								<td></td>
								<td>총 매출</td>
								<td><%= sum %></td>
								<td></td>
								<td></td>
							</tr>
						<%
							}
						%>
							</tfoot>
		                 </table>
		             </div>
		         </div>
		     </div>
		 </main>
	 </div>
	 </div>
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />

</body>
</html>