
<%@page import="cafe.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="userDAO" class="cafe.dao.UserRepository" />
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String tel = request.getParameter("tel");
	String address = request.getParameter("address");

    User user = new User();
    user.setUserId(id);

    if (pw == null || pw =="" ){
        pw = userDAO.getUserById(id).getUserPW();
    }
    user.setUserId(id);
    user.setUserPW(pw);
    user.setUserName(name);
    user.setUserBirth(birth);
    user.setUserTel(tel);
    user.setUserAddress(address);

    int result = userDAO.update(user);
    if (result >0 ){
        response.sendRedirect("complete.jsp?msg=2");
    } else {
        response.sendRedirect("user_update.jsp");
    }

%>
