<%@page import="cafe.dao.ProductRepository"%>
<%@page import="cafe.dto.User"%>
<%@page import="cafe.dao.UserRepository"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cafe.dto.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 	
	String root = request.getContextPath();

	String productNo = request.getParameter("productNo");
	// 세션으로 유저 넘버 받아오기
	// 현재 임시로 값 받기
	String userId = (String) session.getAttribute("loginId");
	String userNo = "";
	String userTel = "";
	List<Product> userCartList = null;
	List<Product> cartList = null;
	ProductRepository productDAO = null;
	if(userId != null) {
		// 장바구니 목록을 세션에서 가져오기
		cartList = (List<Product>) session.getAttribute("cartList");
		if(cartList == null) cartList = new ArrayList<Product>();
		
		UserRepository userDAO = new UserRepository();
		int uNo = userDAO.getUserById(userId).getUserNo();
		userNo = String.valueOf(uNo);
		userTel = userDAO.getUserById(userId).getUserTel();
		
		productDAO = new ProductRepository();
		userCartList = productDAO.payMents(userNo);
		
	} else {
		// 장바구니 목록을 세션에서 가져오기
		cartList = (List<Product>) session.getAttribute("cartList");
		if(cartList == null) cartList = new ArrayList<Product>();
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CodeInLatte</title>
	<jsp:include page="/layout/link.jsp" />
</head>
<body>
<jsp:include page="/layout/header.jsp" />
<!-- 장바구니 영역 -->
	<div class="container">
	
	<h2 class="w-100 text-center">Shopping Cart</h2>
	<div class="cart_box d-flex justify-content-between w-100">
		<div class="left_box col-md-6">
			<ul>
			<%
			int sum = 0;
			if(userId == null) {
			%>
			<%
				for(int i = 0; i < cartList.size(); i++) {
					Product product = cartList.get(i);
					int total = product.getProductPrice() * product.getQuantity();
					sum += total;
			%>
				<li class="product_box d-flex">
					<div class="img_box"><img src="<%= root %>/img?id=<%= product.getProductNo() %>" alt="이미지" width=300 /></div>
					<div class="name_price_box">
						<h5><%= product.getProductName() %></h5>
						<p><%= product.getProductPrice() %></p>
						<p>SUBTOTAL</p>
					</div>
					<div class="cnt_box">
						<div>
							<button><</button>
							<input type="number" value="<%= product.getQuantity() %>"/>
							<button>></button>
						</div>
						<div class="button_box">
							<p><%= total %></p>
						</div>
					</div>
					<div>
						<a href="cart_remove.jsp?removeid=<%= product.getProductNo() %>" ><i class="fa fa-close"></i></a>
					</div>
				</li>
			<%
				}
			} else {
				
			}
				for(int i = 0; i < userCartList.size(); i++) {
					Product product = userCartList.get(i);
					Product userProduct = productDAO.select(String.valueOf(product.getProductNo()));
					int total = userProduct.getProductPrice() * product.getCartCnt();
					sum += total;
			%>
				<li class="product_box d-flex border-bottom">
						<div class="img_box"><img src="<%= root %>/img?id=<%= product.getProductNo() %>" alt="이미지"/></div>
						<div class="name_price_box position-relative">
							<h5 class="px-4 lh-1 pt-4"><%= userProduct.getProductName() %></h5>
							<p class="px-4"><%= userProduct.getProductPrice() %></p>
							<p class="px-4 position-absolute bottom-0">SUBTOTAL</p>
						</div>
						<div class="cnt_box">
							<div>
								<button><</button>
								<input type="number" value="<%= product.getCartCnt() %>" class="form-control w-50"/>
								<button>></button>
							</div>
							<div class="button_box">
								<p><%= total %></p>
							</div>
						</div>
						<div>
							<a href="cart_remove.jsp?removeid=<%= product.getProductNo() %>" ><i class="fa fa-close"></i></a>
						</div>
					</li>
				<%	
			}
			%>
			</ul>
		</div>
		<div class="right_box">
			<h3>Cart Totals</h3>
			<hr>
			<ul>
				<li>Total</li>
			<%
				if(!cartList.isEmpty()) {
			%>
				<li><%= sum %></li>
			<%
				} else {
			%>
				<li>0</li>
			<%
				} 
			%>
			</ul>
			<%
			if(userId != null) {	
			%>
			<!-- 버튼 영역 -->
				<div class="d-flex justify-content-between align-items-center p-3">
					<a href="cart_remove.jsp?removeall=<%= productNo %>" class="btn btn-lg btn-danger">삭제하기</a>
					<a href="./main_cat1.jsp" class="btn btn-lg btn-success">상품페이지</a>
					<a href="payment.jsp?userNo=<%= userNo %>" class="btn btn-lg btn-primary">주문하기</a>
				</div>
			<%
			} else { 
			%>
			<!-- 버튼 영역 -->
				<div class="d-flex justify-content-between align-items-center p-3">
					<a href="cart_remove.jsp?removeall=<%= productNo %>" class="btn btn-lg btn-danger">삭제하기</a>
					<a href="./main_cat1.jsp" class="btn btn-lg btn-success">상품페이지</a>
					<a href="payment.jsp?userNo=Guest" class="btn btn-lg btn-primary">주문하기</a>
				</div>
			<%
			}
			%>
		</div>
	</div>
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
// 		 else {
				
			
// 				for(int i = 0; i < userCartList.size(); i++) {
// 					Product product = userCartList.get(i);
// 					Product userProduct = productDAO.select(String.valueOf(product.getProductNo()));
// 					int total = userProduct.getProductPrice() * product.getCartCnt();
// 					sum += total;
			%>
<!-- 			<tr> -->
<%-- 				<td><%= userProduct.getProductName() %></td> --%>
<%-- 				<td><%= userProduct.getProductPrice() %></td> --%>
<%-- 				<td><%= product.getCartCnt() %></td> --%>
<%-- 				<td><%= total %></td> --%>
<%-- 				<td><a href="cart_remove.jsp?removeid=<%= userProduct.getProductNo() %>" class="btn btn-danger">삭제</a></td> --%>
<!-- 			</tr> -->
			<%	
// 				}
// 			}
			%>
			
		</tbody>
		<tfoot>
		<%
// 			if(!cartList.isEmpty()) {
		%>
<!-- 			<tr> -->
<!-- 				<td></td> -->
<!-- 				<td></td> -->
<!-- 				<td>총액</td> -->
<%-- 				<td><%= sum %></td> --%>
<!-- 				<td></td> -->
<!-- 			</tr> -->
		<%
// 			} else {
		%>
<!-- 			<tr> -->
<!-- 				<td colspan="5">추가된 상품이 없습니다.</td> -->
<!-- 			</tr> -->
		<%
// 			} 
		%>
		</tfoot>
	</table>
	<%
// 	if(userId != null) {	
	%>
	<!-- 버튼 영역 -->
<!-- 		<div class="d-flex justify-content-between align-items-center p-3"> -->
<%-- 			<a href="cart_remove.jsp?removeall=<%= productNo %>" class="btn btn-lg btn-danger">삭제하기</a> --%>
<!-- 			<a href="./main_cat1.jsp" class="btn btn-lg btn-success">상품페이지</a> -->
<%-- 			<a href="payment.jsp?userNo=<%= userNo %>" class="btn btn-lg btn-primary">주문하기</a> --%>
<!-- 		</div> -->
	<%
// 	} else { 
	%>
	<!-- 버튼 영역 -->
<!-- 		<div class="d-flex justify-content-between align-items-center p-3"> -->
<%-- 			<a href="cart_remove.jsp?removeall=<%= productNo %>" class="btn btn-lg btn-danger">삭제하기</a> --%>
<!-- 			<a href="./main_cat1.jsp" class="btn btn-lg btn-success">상품페이지</a> -->
<!-- 			<a href="payment.jsp?userNo=Guest" class="btn btn-lg btn-primary">주문하기</a> -->
<!-- 		</div> -->
	<%
// 	}
	%>
	</div>
<jsp:include page="/layout/footer.jsp" />
<jsp:include page="/layout/script.jsp"/>
</body>
</html>