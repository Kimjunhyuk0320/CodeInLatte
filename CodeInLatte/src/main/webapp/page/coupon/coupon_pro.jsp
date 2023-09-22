<!-- 쿠폰 사용하기 기능 추가 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cafe.dao.AdminRepository"%>
<%@ page import="cafe.dto.Admin" %>
 
 <%
 	// 쿠폰no 넘겨받기
 	String couponNo = request.getParameter("couponNo");
	out.print(couponNo);
 
	
 
 %> 
 
 
 