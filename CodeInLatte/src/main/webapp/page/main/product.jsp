<%@page import="cafe.dto.Product"%>
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
<!-- 상품 정보 영역 -->
	<jsp:useBean id="productDAO" class="cafe.dao.ProductRepository" />
	
	<%
		String root = request.getContextPath();
		String productNo = request.getParameter("id");
		Product product = productDAO.select(productNo);
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
<%-- 			<img alt="이미지" src="img?file=<%= product.getFile()  %>" style="width: 100%;"> --%>
				<!-- [NEW] 썸네일 이미지 요청하기 추가 -->
				<img alt="이미지" src="<%= root %>/img?id=<%= product.getProductNo()  %>" class="w-100 p-2">
			</div>
		
			<div class="col-md-6">
			<table class="table">
			 		<colgroup>
			 			<col width="120px" />
			 			<col />
			 		</colgroup>
			 		<tr>
			 			<td><%= product.getProductName() %></td>
			 		</tr>
			 		<tr>
			 			<td><%= product.getProductCat() %></td>
			 		</tr>
			 		<tr>
			 			<td><%= product.getProductPrice()  %></td>
			 		</tr>
			 		<tr>
			 			<td><%= product.getProductCon() %></td>
			 		</tr>
				</table>

				<div class="mt-4">
					<form name="addForm" action="./cart_pro.jsp" method="post">
						<input type="hidden" name="id" value="<%= product.getProductNo() %>" />
						<div class="btn-box d-flex justify-content-end ">
<!--  							[NEW] 장바구니 버튼 추가 --> 
							<a href="javascript:;" class="btn btn-lg btn-success mx-3" onclick="addToCart()">ADD TO CART</a>
							
<!--  							페이지 이동 막기 :  href="javascript:;"			 --> 
							<a href="./payment.jsp" class="btn btn-lg btn-warning mx-3">단일주문</a>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>
	<script>
		// 장바구니 추가
		function addToCart() {
			if( confirm("상품을 장바구니에 추가하시겠습니까?") ) {
				document.addForm.submit();
			} else {
				document.addFrom.reset();
			}
		}
	</script>
<jsp:include page="/layout/footer.jsp" />
<jsp:include page="/layout/script.jsp"/>
</body>
</html>