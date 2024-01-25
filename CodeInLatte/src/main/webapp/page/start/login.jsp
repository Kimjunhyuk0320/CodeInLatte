<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<jsp:include page="/layout/link.jsp" />
</head>
<body>
	<jsp:include page="/layout/header.jsp" />
	<%
	String root = request.getContextPath();
	String error = request.getParameter("error");
	%>

	<div class="container-fluid h-100" 
			style= "border: 1px solid rgba(0, 0, 0, 0.2); padding: 20px; width: 500px; padding-bottom: 70px">
		<div class="px-4 py-4 text-left">
			<h1 class="display-6 fw-bold text-body-emphasis">회원 로그인</h1>
		</div>

		<!-- 로그인 영역 -->
		<main class="form-signin w-100 m-auto" style="max-width: 330px;">
			<form action="login_pro.jsp" method="post">
				<div class="form-floating">
					<input type="text" class="form-control" id="floatingInput"
						name="id" placeholder="아이디"> 
						<label for="floatingInput">Id</label>
				</div>
				<div class="form-floating">
					<input type="password" class="form-control" id="floatingPassword"
						name="pw" placeholder="비밀번호"> 
						<label for="floatingPassword">Password</label>
				</div>
				<p class="text-center text-danger">
					<%
					if (error != null && error.equals("0")) {
					%>
					아이디 또는 비밀번호를 잘못 입력했습니다.
					<%
					}
					%>
				</p>
				<button class="btn w-100 py-2" type="submit"
				style="background-color: #8B4513; color: white;">로그인</button>
			</form>
			<button class="btn w-100 py-2 mt-2" type="button"
			style="background-color: #F1EFEF; color: black; "
				onclick="location.href='../user/join.jsp'">회원가입</button>
		</main>
	</div>
	
	
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>






