<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 로그인</title>
	<jsp:include page="/layout/link.jsp" />
</head>
<body>   
	<% 
		String root = request.getContextPath();
		String error = request.getParameter("error");
		
	%>
	
	<jsp:include page="/layout/header.jsp" />
	<div class="px-4 py-5 mt-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">관리자 로그인</h1>
	</div>
	
	<!-- 로그인 영역 -->
	<main class="form-signin w-100 m-auto" style="max-width: 330px;">
	  <form action="login_pro.jsp" method="post">
	    <div class="form-floating">
	      <input type="text" class="form-control" id="floatingInput" name="id" placeholder="관리자 아이디">
	      <label for="floatingInput">Id</label>
	    </div>
	    <div class="form-floating">
	      <input type="password" class="form-control" id="floatingPassword" name="pw" placeholder="관리자 비밀번호">
	      <label for="floatingPassword">Password</label>
	    </div>
	    <p class="text-center text-danger">
	    	<%
	    		if( error != null && error.equals("0") ) {
	    	%>
	    		아이디 또는 비밀번호를 잘못 입력했습니다.
	    	<%
	    		}
	    	%>
	    </p>
	    <button class="btn btn-primary w-100 py-2" type="submit">로그인</button>
	  </form>
	</main>
	
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>








