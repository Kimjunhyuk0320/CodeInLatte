<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>CodeInLatte</title>
   <jsp:include page="/layout/link.jsp" />
</head>
<body>
<%
   String root = request.getContextPath();
%>   
<%--    <jsp:include page="/layout/header.jsp" />   --%>

    <video autoplay loop muted>
      <source src = "<%= root %>/static/img/index.webm"type = "video/webm">
    </video>
    
    <div class="main_box">
    	<div class="main_inner">
    		<div class="main_img_box">
    			<img src="<%= root %>/static/img/white_logo.png" alt="로고" />
    		</div>
    		<ul class="main_btn_box">
    			<li><button class="btn btn-outline-light" onclick="location.href='<%= root %>/page/start/login.jsp'">회원</button></li>
    			<li><button class="btn btn-outline-light" onclick="location.href='<%= root %>/page/main/main_cat1.jsp'">비회원</button></li>
    			<li><button class="btn btn-outline-light" onclick="location.href='<%= root %>/page/start/admin_login.jsp'">관리자</button></li>
    		</ul>
    		<div class="Team_info">
    			<p><a href="#">Team Information</a></p>
    		</div>
    	</div>
    </div>
    <jsp:include page="/layout/script.jsp" />
    <jsp:include page="/layout/footer.jsp" /> 
</body>
</html>


