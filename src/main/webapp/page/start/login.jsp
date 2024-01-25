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
	
	
	// 아이디 저장 쿠키 가져오기
	Cookie[] cookies = request.getCookies();

	String userId = "";
	String rememberId = "";
	for(int i = 0 ; i < cookies.length ; i++) {
		if( cookies[i].getName().equals("userID") ) {
			userId = cookies[i].getValue(); 
		}
		if( cookies[i].getName().equals("rememberID") ) {
			rememberId = cookies[i].getValue(); 
		}
	}

	
	
	
	
	
	
	
	
	
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
						name="id" placeholder="아이디" value="<%= userId %>"> 
						<label for="floatingInput">Id</label>
				</div>
				<div class="form-floating">
					<input type="password" class="form-control" id="floatingPassword"
						name="pw" placeholder="비밀번호"> 
						<label for="floatingPassword">Password</label>
				</div>
				<div class="form-check text-start my-3 d-flex justify-content-around">
	    	<div class="item">
	    	  <%
	    	  	if( rememberId != null && rememberId.equals("on") ) {
	    	  %>
			      <input class="form-check-input" type="checkbox" name="remember-id" id="flexCheckDefault1"
			      		 checked>
			  <%
	    	  	} else {
	    	  %>  
			      <input class="form-check-input" type="checkbox" name="remember-id" id="flexCheckDefault1">
			  <% 
	    	  	}
	    	  %>	
		      <label class="form-check-label" for="flexCheckDefault1">아이디 저장</label>
	    	</div>
	    	<div class="item">
		      <input class="form-check-input" type="checkbox" name="remember-me" id="flexCheckDefault2">
		      <label class="form-check-label" for="flexCheckDefault2">자동 로그인</label>
	    	</div>
	      
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






