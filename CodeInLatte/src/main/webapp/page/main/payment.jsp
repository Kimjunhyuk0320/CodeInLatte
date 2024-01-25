<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
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
	DecimalFormat df = new DecimalFormat("###,###");
	String root = request.getContextPath();
	String userNo = request.getParameter("userNo");
	
	// 초기화
	List<Product> cartList = null;
	List<Product> paymentsList = null;
	List<User> userList = null;
	Product product = null;
	String usertel = "";
	String productNo = "";
	String cartCnt = "";
	int total_sum = 0;
	int total_cnt = 0;
	
	// 회원 비회원 구분
	if(!userNo.equals("Guest")) {
		paymentsList = productDAO.payMents(userNo);			
		userList = userDAO.cartUserSelect(userNo);
		cartCnt = request.getParameter("quantity");
		productNo = request.getParameter("productNo");
		
		if(paymentsList.size() == 0) {
			paymentsList = new ArrayList<Product>();
			product = productDAO.select(productNo);
			
			paymentsList.add(product);
		} 
	} else {
		cartList = (List<Product>) session.getAttribute("cartList");
		productNo = request.getParameter("productNo");
		cartCnt = request.getParameter("quantity");
		if(cartList == null) {
			cartList = new ArrayList<Product>();
			product = productDAO.select(productNo);
			cartList.add(product);		
		}
	}
	
%>	
<div class="container">
	<form method="post" action="payment_pro.jsp" >
	<%
	 if(!userNo.equals("Guest")) {
	
		for(int i = 0; i < userList.size(); i++) {
			User user = userList.get(i);
	%>
			<input type="hidden" name="userno" value="<%= user.getUserNo() %>" />
			<input type="hidden" name="usertel" value="<%= user.getUserTel() %>" />
	<%
		}
	 } else {
	%>
		<input type="hidden" name="userno" value="Guest" />
		<input type="hidden" name="usertel" id="userTel" value="<%= usertel %>" />
	<%
	 }
	%>
		<div class="row gy-4">
		<%
		if(!userNo.equals("Guest")) {
			for(int i = 0; i < paymentsList.size(); i++) {
				Product payments = paymentsList.get(i);
				int pNo = payments.getProductNo();
				product = productDAO.select(String.valueOf(pNo));
		%>
		<div class="col-md-6 col-xl-4 col-xxl-3">
			<div class="card p-3">
			
				<div class="img-content ">
					<!-- [New] 이미지 썸네일 추가 -->
					<img alt="이미지" src="<%= root %>/img?id=<%= product.getProductNo() %>" class="w-100 p-2">					
				</div>
				
				<div class="content">
					<h3><%= product.getProductName() %></h3>
					<p>₩<%= df.format( product.getProductPrice() ) %></p>
					<%
					if(payments.getCartCnt() == 0) {
					out.print(product.getProductPrice() * Integer.parseInt(cartCnt));
					int cnt = Integer.parseInt(cartCnt);
					int sum = product.getProductPrice()*cnt;
					total_sum += sum;
					total_cnt += cnt;
					%>
					<p>수량 : <%= cartCnt %></p>
					<input type="hidden" name="cartCnt" value="<%= cartCnt %>">
					<div class="d-flex justify-content-center w-100">
						<p class="price">₩<%= df.format( product.getProductPrice()*cnt ) %></p>
					</div>					
					<%
					} else {
					int sum = product.getProductPrice()*payments.getCartCnt();
					total_sum += sum;
					total_cnt += payments.getCartCnt();
					%>
					<p>수량 : <%= payments.getCartCnt() %></p>
					<input type="hidden" name="cartCnt" value="<%= payments.getCartCnt() %>">
					<div class="d-flex justify-content-center w-100">
						<p class="price">₩<%= df.format( product.getProductPrice()*payments.getCartCnt() ) %></p>
					</div>					
					<%
					}
					%>
					<input type="hidden" name="productName" value="<%= product.getProductName() %>">
					<input type="hidden" name="productPrice" value="<%= product.getProductPrice() %>">
				</div>
			</div>
		</div>
		<%
			}
		} else {
			for(int i = 0; i < cartList.size(); i++) {
				Product payments = cartList.get(i);
				int sum = payments.getProductPrice();
				total_sum += sum;
		%>
		<div class="col-md-6 col-xl-4 col-xxl-3">
			<div class="card p-3">
				<!-- 이미지 영역 -->
				<div class="img-content ">
					<!-- [New] 이미지 썸네일 추가 -->
					<img alt="이미지" src="<%= root %>/img?id=<%= payments.getProductNo() %>" class="w-100 p-2">					
				</div>
				<!-- 컨텐츠 영역 -->
				<div class="content">
					<h3><%= payments.getProductName() %></h3>
					<p>₩<%= df.format(payments.getProductPrice()) %></p>
					<%
					if(payments.getCartCnt() == 0) {
						int cnt = Integer.parseInt(cartCnt);
						total_cnt += cnt;
					%>
					<p>수량 : <%= cartCnt %></p>
					<input type="hidden" name="cartCnt" value="<%= cartCnt %>">
					<%
					} else {
						int cnt = payments.getCartCnt();
						total_cnt += cnt;
					%>
					<p>수량 : <%= payments.getCartCnt() %></p>
					<input type="hidden" name="cartCnt" value="<%= payments.getCartCnt() %>">
					<%
					}
					%>
					<input type="hidden" name="productName" value="<%= payments.getProductName() %>">
					<input type="hidden" name="productPrice" value="<%= payments.getProductPrice() %>">
					<div class="d-flex justify-content-center w-100">
						<p class="price">₩<%= df.format( payments.getProductPrice() ) %></p>
					</div>					
				</div>
			</div>
		</div>
		<%
			}
		}
		%>
		</div>
		<table class="table table-striped table-hover table-bordered text-center mt-5">
		<thead>
			<tr class="table-dark">
				<th>총 수량</th>
				<th>총 가격</th>
			</tr>		
		</thead>
		<tbody>
			<tr>
				<td><%= total_cnt %></td>
				<td>₩<%=df.format( total_sum ) %></td>
			</tr>
		</tbody>
		<tfoot>
		</tfoot>
	</table>
	<div>
	<%
		if(!userNo.equals("Guest")) {
	%>
		<input type="submit" class="btn btn-lg btn-outline-dark w-100" value="결제하기">
	<%
		} else {
	%>
		<input type="submit" class="btn btn-lg btn-outline-dark w-100" onclick="return telInput()" value="결제하기">
	<%
		}
	%>
		<a href="javascript: history.back()" class="btn btn-lg btn-outline-danger w-100 mt-1">취소</a>
	</div>
	</form>
	</div>
	<script>
		function telInput() {
			let usertel= prompt("비회원 주문을 위한 전화번호를 입력해 주세요.");
			if(usertel) {
				document.getElementById('userTel').value = usertel;
				return true;
			} else {
				alert("비회원 주문을 위해선 전화번호가 필요합니다.");
				return false;
			}
		}
	</script>
<jsp:include page="/layout/footer.jsp"/>
<jsp:include page="/layout/script.jsp"/>
</body>
</html>
