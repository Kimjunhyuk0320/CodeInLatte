<%@page import="cafe.dao.UserRepository"%>
<%@page import="cafe.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>사용자 정보 수정</title>
	<jsp:include page="/layout/link.jsp" />
</head>
<body>
	<jsp:include page="/layout/header.jsp" />   
	<% 
		String root = request.getContextPath();
		String loginId = (String) session.getAttribute("loginId");
		
		if( loginId == null || loginId.equals("") ) {
			response.sendRedirect(root); }
		
		UserRepository userDAO = new UserRepository();
		User loginUser = userDAO.getUserById(loginId);

	%> 
	
	<div class="px-4 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">회원 정보 수정</h1>
	</div>
	<div class="px-4 py-1 my-3 text-center">
		<h4>회원정보 수정 페이지 입니다.</h4>
	</div>
	
	<!-- 회원 수정 영역 -->
	<div class="container-sm m-auto mb-5" style=" max-width: 600px">
		<form action="user_update_pro.jsp" name="updateForm" method="post" >
		
			<div class="input-group mb-3 row">
				<input type="text" class="form-control col-md-10" 
					   name="id" placeholder="아이디 *" readonly
					   value="<%= loginUser.getUserId() %>"
					   style="border: none; border-bottom: 1px solid rgba(0, 0, 0, 0.2); 
					   border-radius: 0;">
			</div>
			
			<div class="input-group mb-3 row">
				<input type="password" class="form-control col-md-10" 
					   name="pw" id="pw" placeholder="비밀번호 *" required
					   value="<%= loginUser.getUserPW() %>"
					   style="border: none; border-bottom: 1px solid rgba(0, 0, 0, 0.2); 
					   border-radius: 0;">
			</div>		
			
			<div class="input-group mb-3 row">
			<input type="password" class="form-control col-md-10" 
					   name="pwcheck" id="pwcheck" placeholder="비밀번호 확인 *" required
					   value=""
					   style="border: none; border-bottom: 1px solid rgba(0, 0, 0, 0.2); 
					   border-radius: 0;">
			</div>	
			
			<div class="input-group mb-3 row">
			<input type="text" class="form-control col-md-10" 
					   name="name" placeholder="이름 *" required
					   value="<%= loginUser.getUserName() %>"
					   style="border: none; border-bottom: 1px solid rgba(0, 0, 0, 0.2); 
					   border-radius: 0;">
			</div>			
			
			<div class="input-group mb-1 row">
			<input type="text" class="form-control col-md-10" 
					   name="birth" placeholder="생년월일 *"
					   value="<%= loginUser.getUserBirth() %>" onkeyup="checkUser_birth()"
					   style="border: none; border-bottom: 1px solid rgba(0, 0, 0, 0.2); 
					   border-radius: 0;">
			</div>
			
			<div class="input-group row">
         	<input type="text" class="form-control" name="birth_check" disabled 
            		style="background-color: white; border: none; font-size: 7px; color: red;">
         	</div>
			
			
			<div class="input-group mb-1 row">
				<input type="text" class="form-control col-md-10" 
					   name="tel" placeholder="핸드폰번호 *"
					   value="<%= loginUser.getUserTel() %>" onkeyup="checkUser_tel()"
					   style="border: none; border-bottom: 1px solid rgba(0, 0, 0, 0.2); 
					   border-radius: 0;">
			</div>
			
			<div class="input-group row">
            <input type="text" class="form-control" name="tel_check" disabled 
               style="background-color: white; border: none; font-size: 7px; color: red;">
         	</div>
			
			
			<div class="input-group mb-3 row">
				<input type="text" class="form-control col-md-10" 
					   name="address" placeholder="주소 *"
					   value="<%= loginUser.getUserAddress() %>"
					   style="border: none; border-bottom: 1px solid rgba(0, 0, 0, 0.2); 
					   border-radius: 0;">
			</div>
			
			
			<div class="d-flex justify-content-center mt-5 mb-5">
				<input type="submit" class="btn btn-lg btn-primary mx-3" onclick="return checkUpdateUser()" value="수정" />
				<a href="javascript: ;" onclick="alertDel()" class="btn btn-lg btn-danger mx-5" >탈퇴</a>
				<a href="../main/main_cat1.jsp" class="btn btn-lg btn-secondary mx-3">취소</a>
			</div>	
		</form>
	</div>
	
	<script>
		
		// 탈퇴 체크
		function alertDel() {
			
			let form = document.updateForm
			let password = document.getElementById('pw').value;
			let passwordCheck = document.getElementById('pwcheck').value;
			
			if(password != passwordCheck) {
				alert('비밀번호가 일치하지 않습니다.');
				return false;
				} 

			let check = confirm('정말 탈퇴하시겠습니까?')
			if( check ) {
				form.action = 'user_delete_pro.jsp'
				form.submit()
			}
		}
	</script>
	
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>
