<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
<jsp:include page="/layout/link.jsp" />
<!-- Font Awesome CDN  -->
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
</head>
<body>
<%
	
	String root = request.getContextPath();
	
	String loginId = (String) session.getAttribute("loginId");
	
%>

<nav class="navbar navbar-expand-lg bg-white" style="height: 150px;">
  <div class="container-fluid">
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="true" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse border-bottom">
	   		
	    	 <a class="navbar-brand px-3" href="<%= root %>"><img src="<%= root %>/static/img/logo.png" alt="로고" class="w-50 h-50" style="margin-bottom:20px;"/></a>
	   	 	
	      	<div class="collapse navbar-collapse d-flex justify-content-end px-3">
		      <ul class="navbar-nav">
		       <%
	      	if(loginId == null) {
	      %>
	        <li class="nav-item px-2">
	          <a class="nav-link active" aria-current="page" href="<%= root %>/page/start/admin_login.jsp">로그인</a>
	        </li>
          <%
	      	} else {
          %>
          	<li class="nav-item px-2">
	          <a class="nav-link active" aria-current="page" href="<%= root %>/page/start/logout.jsp">로그아웃</a>
	        </li>
          <%
	      	}
          %>
		      </ul>
	      	</div>
	    </div>
	</div>
</nav>

	<% 
		String error = request.getParameter("error");
	%>

	<div class="container-fluid h-100"
		style="border: 1px solid rgba(0, 0, 0, 0.2); padding: 20px; width: 500px; padding-bottom: 70px">
		<div class="px-4 py-4 text-left">
			<h1 class="display-6 fw-bold text-body-emphasis">관리자 로그인</h1>
		</div>

		<!-- 로그인 영역 -->
		<main class="form-signin w-100 m-auto" style="max-width: 330px;">
			<form action="admin_login_pro.jsp" method="post">
				<div class="form-floating">
					<input type="text" class="form-control" id="floatingInput"
						name="id" placeholder="관리자 아이디"> 
						<label for="floatingInput">Id</label>
				</div>
				
				<div class="form-floating">
					<input type="password" class="form-control" id="floatingPassword"
						name="pw" placeholder="관리자 비밀번호"> 
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
				<button class="btn btn-primary w-100 py-2" type="submit"
						style="background-color: #8B4513; color: white;">로그인</button>
			</form>
		</main>
	</div>

	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>