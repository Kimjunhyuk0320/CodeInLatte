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
			product = productDAO.getProductById(productId);
		}
	%>
	<jsp:include page="/layout/admin_header.jsp" />
	<section class="py-5 text-center container">
    	<div class="row py-lg-5">
      		<div class="col-lg-6 col-md-8 mx-auto">
        	<h1 class="fw-light">Album example</h1>
        <p class="lead text-body-secondary">Something short and leading about the collection below—its contents, the creator, etc. Make it short and sweet, but not too short so folks don’t simply skip over it entirely.</p>
        <p>
          <a href="#" class="btn btn-primary my-2">Main call to action</a>
          <a href="#" class="btn btn-secondary my-2">Secondary action</a>
        </p>
      </div>
    </div>
  	</section>
	<!-- 상품 수정 화면 -->
	<div class="container">
		<form name="product" action="product_update_pro.jsp" onsubmit="return checkProduct()" method="post" enctype="multipart/form-data">
			
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">상품 코드</label>
				<input type="hidden" class="form-control col-md-10" name="productId" value="<%= product.getProductId() %>">
				<input type="text" class="form-control col-md-10" name="" disabled value="<%= product.getProductId() %>">
			</div>
			
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">상품명</label>
				<input type="text" class="form-control col-md-10" name="name" value="<%= product.getName() %>">
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
				<input type="number" class="form-control col-md-10" name="unitPrice" value="<%= product.getUnitPrice() %>">
			</div>
			<div class="input-group mb-3 row">
				<label class="input-group-text w-100" id="">상세 정보</label>
				<textarea class="form-control" name="description" 
						  style="height: 200px !important;"><%= product.getDescription() %></textarea>
			</div>

			
			<div class="d-flex justify-content-between mt-5 mb-5">
				<a href="./products.jsp" class="btn btn-lg btn-secondary">목록</a>
				<input type="submit" class="btn btn-lg btn-primary" value="등록" />
			</div>
		
		</form> 
	
	</div>
			
			<div class="d-flex justify-content-between mt-5 mb-5">
				<a href="admin_products.jsp" class="btn btn-lg btn-secondary">상품목록</a>
				<a href="product_delete_pro.jsp?id=<%= product.getProductId() %>" class="btn btn-danger mx-1">삭제</a>
				<input type="submit" class="btn btn-lg btn-primary" value="상품수정" />
			</div>		
		</form> 
	
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>