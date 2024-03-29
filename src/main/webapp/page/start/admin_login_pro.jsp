<!-- 로그인 처리 -->
<%@page import="cafe.dto.Admin"%>
<%@page import="cafe.dao.AdminRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	AdminRepository AdminDAO = new AdminRepository();
	Admin loginAdmin = AdminDAO.login(id, pw);
	
	// 로그인 실패
	if( loginAdmin == null ) {
		response.sendRedirect("admin_login.jsp?error=0");		
		return;
	}
	
	
	// 로그인 성공
	// - 세션에 아이디 등록
	session.setAttribute("loginId", id);
	
	// 로그인 성공 페이지로 이동
	response.sendRedirect("../user/complete.jsp?msg=4");		

%>