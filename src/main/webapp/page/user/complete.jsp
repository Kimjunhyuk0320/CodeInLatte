<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>완료</title>
	<jsp:include page="/layout/link.jsp" />
</head>
<body>
	<%
	String heder = request.getParameter("msg");
	
	if (heder.equals("4")) { %> 
	<jsp:include page="/layout/admin_header.jsp" />
	<% } else { %>
	<jsp:include page="/layout/header.jsp" />
	<% 
	}
	%>
	
	<% String root = request.getContextPath(); %>
	
	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">Code In Latte</h1>
	</div>
	
	<!-- 회원 가입/수정/탈퇴 완료 -->
	<div class="container mb-5">
		<%
			String msg = request.getParameter("msg");
			msg = msg == null ? "" : msg;
			String text = "";
			switch(msg) {
				case "0" :
					String loginId = (String) session.getAttribute("loginId");
					text = loginId + "님 환영 합니다."; 
					break; 
				case "1" : text = "회원 가입이 완료되었습니다."; break; 
				case "2" : text = "회원 정보가 수정되었습니다."; break; 
				case "3" : text = "회원 정보가 삭제되었습니다."; break; 
				case "4" : text = "관리자님 환영 합니다."; break; 
			}
			
		%>
		<h1 class="text-center"><%= text %></h1>
		<% 	
			// 로그인
			if(msg.equals("0")) {
		%>
		<div class="btn-box d-flex justify-content-center p-5">
			<a href="<%= request.getContextPath() %>/page/main/main_cat1.jsp" class="btn btn-lg"
			style="background-color: #8B4513; color: white;">상품 메뉴</a>
		</div>
		
		<%
			// 회원 가입
			} else if(msg.equals("1")){
		%>
		<div class="btn-box d-flex justify-content-center p-5">
			<a href="<%= request.getContextPath() %>/page/start/login.jsp" class="btn btn-lg"
			style="background-color: #8B4513; color: white;">로그인</a>
		</div>
		
		<%
			// 회원 수정
			} else if(msg.equals("2")){
		%>
		<div class="btn-box d-flex justify-content-center p-5">
			<a href="<%= request.getContextPath() %>/page/user/user_update.jsp" class="btn btn-lg"
			style="background-color: #8B4513; color: white;">돌아가기</a>
		</div>
		
		<%
			// 회원 삭제
			} else if(msg.equals("3")){
		%>
		<div class="btn-box d-flex justify-content-center p-5">
			<a href="<%= request.getContextPath() %>" class="btn btn-lg"
			style="background-color: #8B4513; color: white;">메인</a>
		</div>
		
		<%
			// 관리자 로그인
			} else if(msg.equals("4")){
		%>
		<div class="btn-box d-flex justify-content-center p-5">
			<a href="<%= request.getContextPath() %>/page/admin/admin_main.jsp" class="btn btn-lg"
			style="background-color: #8B4513; color: white;">관리자 메인</a>
		</div>
		
		<%
			}  
		%>
		
	</div>
	
<jsp:include page="/layout/script.jsp" />
<jsp:include page="/layout/footer.jsp" />
</body>
</html>







