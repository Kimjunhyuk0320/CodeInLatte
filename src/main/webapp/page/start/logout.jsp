<%@page import="cafe.dao.UserRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String root = request.getContextPath();
	// 자동 로그인, 토큰 쿠키 삭제
	String id = (String) session.getAttribute("loginId");
	// 세션 무효화
	session.removeAttribute("loginId");
	// 쿠키 전달
	UserRepository userDAO = new UserRepository();
	userDAO.deleteToken(id);
	Cookie cookie_token = new Cookie("token", "");
	response.addCookie(cookie_token);
	Cookie cookie_remember_me = new Cookie("rememberMe", "");
	response.addCookie(cookie_remember_me);
	cookie_token.setMaxAge(0);
	cookie_remember_me.setMaxAge(0);
	response.addCookie(cookie_token);
	response.addCookie(cookie_remember_me);
	System.out.println("자동로그인을 쿠키에서 해제했습니다");  
   response.sendRedirect(root + "/index.jsp");

%>