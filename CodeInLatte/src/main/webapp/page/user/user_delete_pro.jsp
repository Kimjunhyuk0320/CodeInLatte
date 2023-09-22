<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="userDAO" class="cafe.dao.UserRepository" />

<%
    String id = request.getParameter("id");
    //데이터베이스에서 데이터 삭제
    int result = userDAO.delete(id);
    if ( result > 0 ){
        response.sendRedirect("complete.jsp?msg=3");
        //세션도 해제
        session.invalidate();
    } else {
        out.println("회원삭제가 안됐습니다..."); 
        response.sendRedirect("update.jsp");
    } 
%>
