
<%@page import="cafe.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="userDAO" class="cafe.dao.UserRepository" />
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String tel = request.getParameter("tel");
	String address = request.getParameter("address");

    User user = new User();
    user.setId(id);

    if (pw == null || pw =="" ){
        pw = userDAO.getUserById(id).getPassword();
    }
    user.setId(id);
    user.setPassword(pw);
    user.setName(name);
    user.setBirth(birth);
    user.setTel(tel);
    user.setAddress(address);

    int result = userDAO.update(user);
    if (result >0 ){
        response.sendRedirect("complete.jsp?msg=2");
    } else {
        response.sendRedirect("user_update.jsp");
    }

%>
