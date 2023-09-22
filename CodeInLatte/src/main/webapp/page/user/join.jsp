<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<jsp:include page="/layout/link.jsp" />
</head>
<body>
	<jsp:include page="/layout/header.jsp" />      
	<% String root = request.getContextPath(); %>

	<jsp:include page="/layout/header.jsp" />
	<div class="px-4 py-5 my-2 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">회원 가입</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">회원가입 페이지 입니다.</p>
			<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
			</div>
		</div>
	</div>




	<!-- 회원 가입 영역 -->
	<div class="container mb-5">
		<form action="join_pro.jsp" name="joinForm" method="post" >
		
	<!-- required 필수값 지정 -->
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">아이디</label>
				<input type="text" class="form-control col-md-10" 
					   name="id" placeholder="아이디 *" required>
			</div>
			
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">비밀번호</label>
				<input type="password" class="form-control col-md-10" 
					   name="pw" placeholder="비밀번호 *" required>
			</div>
			
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">비밀번호 확인</label>
				<input type="password" class="form-control col-md-10" 
					   name="pw_confirm" placeholder="비밀번호 확인 *" required>
			</div>
			
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">이름</label>
				<input type="text" class="form-control col-md-10" 
					   name="name" placeholder="이름" required>
			</div>

			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">생년월일</label> 
				<input type="text" class="form-control col-md-10" 
						name="birth" placeholder="생년월일">
			</div>

				<div class="input-group mb-3 row">
					<label class="input-group-text col-md-2" id="">전화번호</label> 
					<input type="text" class="form-control col-md-10" 
					name="tel" placeholder="전화번호">
				</div>

				<div class="input-group mb-3 row">
					<label class="input-group-text col-md-2" id="">주소</label> 
					<input type="text" class="form-control col-md-10" 
						name="address" placeholder="주소">
				</div>


				<div class="d-flex justify-content-center mt-5 mb-5">
					<input type="submit" class="btn btn-lg btn-primary mx-3" value="가입" />
					<a href="javascript: history.back()"
						class="btn btn-lg btn-secondary mx-3">취소</a>
				</div>
		</form>
	
	</div>
	
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>








