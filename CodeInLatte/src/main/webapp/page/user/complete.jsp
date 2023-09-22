<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Shop</title>
<!-- bootstrap lib -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link href="<%= request.getContextPath() %>/static/css/style.css" rel="stylesheet" />
</head>
<body>   
	<% String root = request.getContextPath(); %>
	
	<jsp:include page="/layout/header.jsp" />
	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">회원 정보</h1>
		
	</div>
	<!-- 회원 가입/수정/탈퇴 완료 -->
	<div class="container mb-5">
		<%
			String msg = request.getParameter("msg");
			msg = msg == null ? "" : msg;
			String text = "문구입력필요";
			switch(msg) {
				case "0" :
					String loginId = (String) session.getAttribute("loginId");
					text = loginId + "님 환영 합니다."; 
					break; 
				case "1" : text = "회원 가입이 완료되었습니다."; break; 
				case "2" : text = "회원 정보가 수정되었습니다."; break; 
				case "3" : text = "회원 정보가 삭제되었습니다."; break; 
			}
		%>
		<h1 class="text-center"><%= text %></h1>
		<div class="btn-box d-flex justify-content-center p-5">
			<a href="<%= request.getContextPath() %>" class="btn btn-lg btn-primary">메인 화면</a>
		</div>
	</div>
	
	
</body>
</html>







