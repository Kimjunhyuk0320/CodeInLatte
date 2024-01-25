<%@page import="cafe.dao.OrderRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String orderNo = request.getParameter("id");
	OrderRepository orderDAO = new OrderRepository();
	orderDAO.delete(orderNo);

	response.sendRedirect("order_list.jsp");

%>