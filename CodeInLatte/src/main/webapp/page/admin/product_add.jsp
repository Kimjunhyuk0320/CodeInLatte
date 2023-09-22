<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 상품 추가</title>
	<jsp:include page="/layout/link.jsp" />
</head>
<body>
	<jsp:include page="/layout/admin_header.jsp" />
	
	<!-- 상품 등록 입력 화면 -->
	<div class="container">
		<form name="product" action="product_add_pro.jsp" onsubmit="return checkProduct()" method="post" enctype="multipart/form-data">
			
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">상품명</label>
				<input type="text" class="form-control col-md-10" name="name">
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
				<input type="number" class="form-control col-md-10" name="unitPrice">
			</div>
			<div class="input-group mb-3 row">
				<label class="input-group-text w-100" id="">상세 정보</label>
				<textarea class="form-control" name="description" 
						  style="height: 200px !important;"></textarea>
			</div>

			
			<div class="d-flex justify-content-between mt-5 mb-5">
				<a href="admin_products.jsp" class="btn btn-lg btn-secondary">상품목록</a>
				<input type="submit" class="btn btn-lg btn-primary" value="상품등록" />
			</div>
		
		</form> 
	
	</div>
			
	
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>