<%@page import="cafe.dto.Product"%>
<%@page import="cafe.dao.ProductRepository"%>
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
	<%  
		String productId = request.getParameter("id");
		ProductRepository productDAO = new ProductRepository();
		Product product = new Product();
		
		if( productId != null ) {
			product = productDAO.select(productId);
		}
	%>
	<jsp:include page="/layout/admin_header.jsp" />
	
	<!-- 상품 수정 화면 -->
	<div class="container">
		<form name="product" action="product_update_pro.jsp" onsubmit="return checkProduct()" method="post" enctype="multipart/form-data">
			
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">상품 코드</label>
				<input type="hidden" class="form-control col-md-10" name="productId" value="<%= product.getProductNo() %>">
				<input type="text" class="form-control col-md-10" name="" disabled value="<%= product.getProductNo() %>">
			</div>
			
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">상품명</label>
				<input type="text" class="form-control col-md-10" name="name" value="<%= product.getProductName() %>">
			</div>
			
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">상품 이미지</label>
				<input type="file" class="form-control col-md-10" name="file">
			</div>	
		
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">카테고리</label>
				<select name="category" class="form-select h-100">
					<option value="caffeine">카페인</option>
					<option value="decaffeine">디카페인</option>
					<option value="beverage">음료</option>
				</select>
			</div>
			
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">가격</label>
				<input type="number" class="form-control col-md-10" name="unitPrice" value="<%= product.getProductPrice() %>">
			</div>
			<div class="input-group mb-3 row">
				<label class="input-group-text w-100" id="">상세 정보</label>
				<textarea class="form-control" name="description" 
						  style="height: 200px !important;"><%= product.getProductCon() %></textarea>
			</div>

			
			<div class="d-flex justify-content-between mt-5 mb-5">
				<a href="admin_products.jsp" class="btn btn-lg btn-secondary">상품목록</a>
				<a href="product_delete_pro.jsp?id=<%= product.getProductNo() %>" class="btn btn-danger mx-1">삭제</a>
				<input type="submit" class="btn btn-lg btn-primary" value="상품수정" />
			</div>		
		
		</form> 
	
	</div>
			

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>