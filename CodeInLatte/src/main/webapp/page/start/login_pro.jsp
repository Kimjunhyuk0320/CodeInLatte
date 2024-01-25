<!-- 로그인 처리 -->
<%@page import="cafe.dto.User"%>
<%@page import="cafe.dao.UserRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	
	String root = request.getContextPath();

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	UserRepository userDAO = new  UserRepository();
	User loginUser = userDAO.login(id, pw);
	
	// 로그인 실패
	if( loginUser == null ) {
		response.sendRedirect("login.jsp?error=0");		
		return;
	}
	
	
	// 로그인 성공
	// - 세션에 아이디 등록
	session.setAttribute("loginId", id);
	
	// 로그인 성공 페이지로 이동
	response.sendRedirect( root + "/page/user/complete.jsp?msg=0");		

%>