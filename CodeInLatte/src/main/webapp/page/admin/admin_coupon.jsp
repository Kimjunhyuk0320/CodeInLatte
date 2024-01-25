<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>���� ���� - ������ ���</title>
	<jsp:include page="/layout/link.jsp" />
</head>
<body>
<jsp:include page="/layout/header.jsp" />

	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">���� ����</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">���� ���</p>
		</div>
	</div>
	
	<!-- ���� ��� �Է� ȭ�� -->
	<div class="container">
		<!-- [NEW] enctype �߰� -->
		<form name="product" action="./admin_coupon_pro.jsp" onsubmit="" method="post" enctype="multipart/form-data">
			
			<!-- [NEW] ���� �Է� �߰� -->
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">���� ��ȣ</label>
				<input type="text" class="form-control col-md-10" name="CouponNo">
			</div>
			
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">���� �̹���</label>
				<input type="file" class="form-control col-md-10" name="CouponImg">
			</div>	
		
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">������</label>
				<input type="text" class="form-control col-md-10" name="CouponName">
			</div>
			
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">���� ������</label>
				<input type="text" class="form-control col-md-10" name="CouponDate">
			</div>
			
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">���� ��ȿ�Ⱓ</label>
				<input type="text" class="form-control col-md-10" name="CouponDueDate">
			</div>
			
			<div class="col-md-10 d-flex align-items-center">
					<div class="radio-box d-flex">
						<div class="radio-item mx-5">
						  <input type="radio" class="form-check-input" name="couponCheck" value="0" id="condition-NotCompleted">
						  <label for="condition-NotCompleted">�̻��</label>
						</div>
						<div class="radio-item mx-5">
						  <input type="radio" class="form-check-input" name="couponCheck" value="1" id="condition-Completed">
						  <label for="condition-Completed">��� �Ϸ�</label>
						</div>			  
					</div>
				</div>
			
			<div class="d-flex justify-content-between mt-5 mb-5">
<!--			<a href="./admin_coupon.jsp" class="btn btn-lg btn-secondary">���� ����</a> -->
				<input type="submit" class="btn btn-lg btn-primary" value="���" />
			</div>
		
		</form> 
	
	</div>
	
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>