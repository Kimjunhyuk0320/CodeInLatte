<%@page import="java.text.DecimalFormat"%>
<%@page import="cafe.dao.UserRepository"%>
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
		DecimalFormat df = new DecimalFormat("###,###");
		String root = request.getContextPath();
		String userId = (String) session.getAttribute("loginId");
		String productNo = request.getParameter("productNo");
		Product product = productDAO.select(productNo);
		int uNo = 0;
		String userNo = "";
		
		if(userId == null) {
			userNo = "Guest";
		} else {
		UserRepository userDAO = new UserRepository();
		uNo = userDAO.getUserById(userId).getUserNo();	
		userNo = String.valueOf(uNo);
		}
		
		String cartCnt = "";
	%>
	<div class="container puduct_inner">
		<h2>MENU</h2>
		<div class="detail_product_box row">
			<div class="datail_product_img_box col-md-6">
				<div class="datail_margin_box">
					<img alt="이미지" src="<%= root %>/img?id=<%= product.getProductNo()  %>" class="w-100 p-2">
				</div>
			</div>
		
			<div class="detail_product_con col-md-6">
				<div class="px-5">
					<div class="detail_product_con_name">
						<h2><%= product.getProductName() %></h2>
					</div>
					<div class="detail_product_con_category">
						<p><%= product.getProductCat() %></p>
					</div>
					<div class="detail_product_con_price">
						<p>₩<%= df.format( product.getProductPrice() ) %></p>
					</div>
					<div class="detail_product_con_content">
						<p><%= product.getProductCon() %></p>
					</div>
					<div class="text-end"><a>더보기></a></div>
				</div>
				<form name="addForm" action="./cart_pro.jsp" method="post" class="px-5">
					<div class="cnt_box mt-4 d-flex justify-content-end quantity_box">
						<div class="input_box d-flex poroduct_quantity_box">
							<button class="minus">-</button>
							<input type="number" id="quantityInput" name="quantity" value="1"  min="1" max="999"/>
							<input type="hidden" id="quantityOutput" name="quantity" value="1"  min="1" max="999"/>
							<button class="plus">+</button>
						</div>
					<input type="hidden" name="productNo" value="<%= product.getProductNo() %>" />
						<a href="javascript:;" class="addcart btn btn-lg btn-outline-dark px-5" onclick="addToCart()">ADD TO CART</a>
					</div>
					<div class="btn-box d-flex justify-content-end ">
					
							<a href="#" class="btn btn-lg btn-dark w-100 mt-2 px-5" onclick="return cartCnt()">즉시주문</a>
							
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="w-100 position-absolute bottom-0 back_btn_box">
		<a href="<%= root %>/page/main/main_cat1.jsp" class="btn btn-lg btn-dark mx-5">상품페이지</a>
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
		function cartCnt() {
			let cartCnt = document.getElementById('quantityInput').value;
			document.getElementById('quantityOutput').value = cartCnt;
			
			let userNo = '<%= userNo %>';
			let productNo = '<%= productNo %>';
			
			let url = "./payment.jsp?userNo=" + encodeURIComponent(userNo) 
            + "&&productNo=" + encodeURIComponent(productNo)
            + "&&quantity=" + encodeURIComponent(cartCnt);
    
		    // 페이지 이동
		    window.location.href = url;
		
		    return false;  // form 제출 중지
			
			alert(cartCnt);
			return true;
		}
	</script>
<jsp:include page="/layout/footer.jsp" />
<jsp:include page="/layout/script.jsp"/>
</body>
</html>