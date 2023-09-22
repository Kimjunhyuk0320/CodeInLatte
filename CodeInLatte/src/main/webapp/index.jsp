<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Main</title>
<!-- bootstrap lib -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link href="<%= request.getContextPath() %>/static/css/style.css" rel="stylesheet" />
</head>
<body>   
	<% 
		String root = request.getContextPath(); 
	%>
	
	<div class=" gap-2 d-sm-flex justify-content-sm-center ">
		<button class="btn btn-primary w-100 py-2 mt-2" type="button" onclick="location.href='./login.jsp'">회원</button>
		<button class="btn btn-primary w-100 py-2 mt-2" type="button" onclick="location.href='./main.jsp'">비회원</button>
		<button class="btn btn-primary w-100 py-2 mt-2" type="button" onclick="location.href='./admin_main.jsp'">관리자</button>
	</div>
</body>
</html>





