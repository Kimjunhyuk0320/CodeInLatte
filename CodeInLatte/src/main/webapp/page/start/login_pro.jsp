<!-- 로그인 처리 -->
<%@page import="cafe.dto.User"%>
<%@page import="cafe.dao.UserRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	
	String root = request.getContextPath();

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String remember_id = request.getParameter("remember-id");
	String remember_me = request.getParameter("remember-me");
	
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
	
	
	// 아이디 저장
	if( remember_id != null && remember_id.equals("on") ) {
		Cookie cookie_id = new Cookie("userID", id);
		Cookie cookie_remeber_id = new Cookie("rememberID", remember_id);
		cookie_id.setPath(root);
		cookie_id.setMaxAge(10*60);
		cookie_remeber_id.setPath(root);
		cookie_remeber_id.setMaxAge(10*60);
		response.addCookie(cookie_id);
		response.addCookie(cookie_remeber_id);
		System.out.println("아이디를 쿠키에 저장했습니다");
	}else{
		Cookie cookie_id = new Cookie("userID", "");
		Cookie cookie_remeber_id = new Cookie("rememberID", "");
		cookie_id.setMaxAge(0);
		cookie_id.setPath(root);
		cookie_remeber_id.setMaxAge(0);
		cookie_remeber_id.setPath(root);
		response.addCookie(cookie_id);
		response.addCookie(cookie_remeber_id);
		System.out.println("아이디를 쿠키에 해제했습니다");
	}
	// 자동 로그인
	if( remember_me != null && remember_me.equals("on")){
		String token = userDAO.refreshToken(id);
		Cookie cookie_token = new Cookie("token", token);
		cookie_token.setPath(root);
		cookie_token.setMaxAge(10*60);
		response.addCookie(cookie_token);
		Cookie cookie_remember_me = new Cookie("rememberMe", remember_me);
		cookie_remember_me.setMaxAge(10*60);
		cookie_remember_me.setPath(root);
		response.addCookie(cookie_remember_me);
		System.out.println("토큰을 쿠키에 저장했습니다");
	}
	
	// 로그인 성공 페이지로 이동
	response.sendRedirect( root + "/page/user/complete.jsp?msg=0");		

%>