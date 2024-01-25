<%@page import="cafe.dao.UserRepository"%>
<%@page import="cafe.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	User user = new User();
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String tel = request.getParameter("tel");
	String address = request.getParameter("address");
	
	user.setUserId(id);
	user.setUserPW(pw);
	user.setUserName(name);
	user.setUserBirth(birth);
	user.setUserTel(tel);
	user.setUserAddress(address);
	

	// 회원 정보 등록 요청
	UserRepository userDAO = new UserRepository();
	int result = userDAO.insert(user);
	
	if( result > 0  ) {
		// 회원 가입 완료 페이지로 이동
		response.sendRedirect("complete.jsp?msg=1");		
	} else {
		response.sendRedirect("join.jsp");		
	}

%>