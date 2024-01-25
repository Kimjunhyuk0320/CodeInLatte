
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>쿠폰 정보 수정</title>
	<jsp:include page="/layout/link.jsp" />
</head>
<body>  
	<% 
		String root = request.getContextPath(); 
	%>
	<jsp:include page="/layout/header.jsp" />

	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">쿠폰 관리</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">쿠폰 정보 수정</p>
		</div>
	</div>
	
	<!-- 쿠폰 수정 입력 화면 -->
	<div class="container">
		<!-- [NEW] enctype 추가 -->
		<form name="product" action="./admin_coupon_pro.jsp" onsubmit="" method="post" enctype="multipart/form-data">
			
			<!-- [NEW] 파일 입력 추가 -->
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">쿠폰 번호</label>
				<input type="text" class="form-control col-md-10" name="CouponNo">
			</div>
			
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">쿠폰 이미지</label>
				<input type="file" class="form-control col-md-10" name="CouponImg">
			</div>	
		
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">쿠폰명</label>
				<input type="text" class="form-control col-md-10" name="CouponName">
			</div>
			
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">쿠폰 발행일</label>
				<input type="text" class="form-control col-md-10" name="CouponDate">
			</div>
			
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">쿠폰 유효기간</label>
				<input type="text" class="form-control col-md-10" name="CouponDueDate">
			</div>
			
			<div class="col-md-10 d-flex align-items-center">
					<div class="radio-box d-flex">
						<div class="radio-item mx-5">
						  <input type="radio" class="form-check-input" name="couponCheck" value="0" id="condition-NotCompleted">
						  <label for="condition-NotCompleted">미사용</label>
						</div>
						<div class="radio-item mx-5">
						  <input type="radio" class="form-check-input" name="couponCheck" value="1" id="condition-Completed">
						  <label for="condition-Completed">사용 완료</label>
						</div>			  
					</div>
				</div>
			
			<div class="d-flex justify-content-between mt-5 mb-5">
<!--			<a href="./admin_coupon.jsp" class="btn btn-lg btn-secondary">쿠폰 관리</a> -->
				<input type="submit" class="btn btn-lg btn-primary" value="등록" />
			</div>
		
		</form> 
	
	</div>
	
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>





