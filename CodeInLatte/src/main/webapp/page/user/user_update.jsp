<%@page import="cafe.dao.UserRepository"%>
<%@page import="cafe.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>update</title>
<!-- bootstrap lib -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link href="<%= request.getContextPath() %>/static/css/style.css" rel="stylesheet" />
</head>
<body>   
	<% 
		String root = request.getContextPath();
		String loginId = (String) session.getAttribute("loginId");
		
		if( loginId == null || loginId.equals("") ) {
			response.sendRedirect(root);
		}
		
		UserRepository userDAO = new UserRepository();
		User loginUser = userDAO.getUserById(loginId);
			
	%>
	
	<jsp:include page="/layout/header.jsp" />
	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">회원 정보 수정</h1>
	</div>
	
	<!-- 회원 수정 영역 -->
	<div class="container-sm m-auto mb-5" style="max-width: 600px">
		<form action="update_pro.jsp" name="updateForm" method="post" >
		
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">아이디</label>
				<input type="text" class="form-control col-md-10" 
					   name="id" placeholder="아이디" required
					   value="<%= loginUser.getId() %>">
			</div>
			
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">이름</label>
				<input type="text" class="form-control col-md-10" 
					   name="name" placeholder="이름" required
					   value="<%= loginUser.getName() %>">
			</div>				
			
			
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">전화번호</label>
				<input type="text" class="form-control col-md-10" 
					   name="phone" placeholder="전화번호"
					   value="<%= loginUser.getTel() %>">
			</div>
			
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">주소</label>
				<input type="text" class="form-control col-md-10" 
					   name="address" placeholder="주소"
					   value="<%= loginUser.getAddress() %>">
			</div>
			
			
			<div class="d-flex justify-content-center mt-5 mb-5">
				<input type="submit" class="btn btn-lg btn-primary mx-3" value="수정" />
				<a href="javascript: ;" onclick="alertDel()" class="btn btn-lg btn-danger mx-5" >탈퇴</a>
				<a href="javascript: history.back()" class="btn btn-lg btn-secondary mx-3">취소</a>
			</div>	
			
			
		</form>
	
	</div>
	
	<jsp:include page="/layout/script.jsp" />

	<script>
		
		let form = document.updateForm	
		
		// 탈퇴 체크
		function alertDel() {

			let form = document.updateForm
			let check = confirm('정말 탈퇴하시겠습니까?')
			if( check ) {
				form.action = 'user_delete_pro.jsp'
				form.submit()
			}

		}
	
	</script>
</body>
</html>








