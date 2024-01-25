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
	<h3 class="text-center" style="margin-top:20px; ">상품 상세 수정</h3>
	<!-- 상품 수정 화면 -->
	<div class="container-fluid h-100 form"
		style="background-color: #F9F9F9; padding: 20px; width: 70%;  padding-bottom: 70px;  padding-top: 70px; margin-top: 40px;">
		<form name="product" action="product_update_pro.jsp" onsubmit="return checkProduct()" method="post" enctype="multipart/form-data">
			
			<div class="input-group mb-3 row border-bottom">
				<h4 class="form-label" id="" style="color: #6E6E6E">상품코드</h4>
				<input type="hidden" class="form-control col-md-10" name="productId" value="<%= product.getProductNo() %>">
				<input type="text" class="form-control col-md-10"style="background-color:#F9F9F9; border-width: 0;" name="" disabled value="<%= product.getProductNo() %>">
			</div>
			
			<div class="input-group mb-3 row border-bottom">
				<h4 class="form-label" id="" style="color: #6E6E6E">상품명</h4>
				<input type="text" class="form-control"  style="background-color:#F9F9F9; border-width: 0;" name="name" value="<%= product.getProductName() %>">
			</div>
			
			<div class="input-group mb-3 row border-bottom" style="margin-top: 40px;">
				<h4  class="form-label" id="" style="color: #6E6E6E">상품 이미지</h4>
				<input type="file" class="form-control col-md-10" name="file" style="background-color:#F9F9F9;border-width: 0;" value="<%= product.getProductImg() %>">
			</div>	
		
			<div class="input-group mb-3 row border-bottom" style="margin-top: 40px;">
				<h4  class="form-label" id="" style="color: #6E6E6E">카테고리</h4>
				<select name="category" class="form-select h-100" style="background-color:#F9F9F9; border-width: 0;">
					<option value="caffeine">카페인</option>
					<option value="decaffeine">디카페인</option>
					<option value="beverage">음료</option>
				</select>
			</div>
			
			<div class="input-group mb-3 row border-bottom" style="margin-top: 40px;">
				<h4  class="form-label" id="" style="color: #6E6E6E">가격</h4>
				<input type="number" class="form-control" style="background-color:#F9F9F9; border-width: 0;" name="unitPrice" value="<%= product.getProductPrice() %>">
			</div>
			<div class="input-group mb-3 row" style="margin-top: 40px;">
				<h4  class="form-label" id="" style="color: #6E6E6E">상세 정보</h4>
				<textarea class="form-control" name="description" 
						  style="height: 300px !important; background-color:#F9F9F9;" ><%= product.getProductCon() %></textarea>
			</div>


			
			<div class="d-flex justify-content-between mt-5 mb-5">
				<a href="product_delete_pro.jsp?id=<%= product.getProductNo() %>" style="width:200px; height:60px; "class="btn btn-danger"><h5 style="line-height:47px;">삭제</h5></a>
				<input type="submit" class="btn btn-lg btn btn-dark" value="상품수정" style="width:200px; height:60px; margin-right:25px;"/>
			</div>
		
		</form> 
	
	</div>
			
	<div>
				<a href="admin_products.jsp" class="btn btn-outline-dark" style="margin-left:100px; margin-top:60px; margin-bottom:60px; width:120px; height:40px;">Back</a>	
	</div>	
	
	
	
	
	
	
	
	
	
	
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>