<%@page import="cafe.dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="cafe.dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String removeid = request.getParameter("removeid");
	String removeall = request.getParameter("removeall");
	ProductRepository productDAO = new ProductRepository();
	// 세션에서 유저 정보 받아오기
	String userNo = "1";
	
	if(removeid == null && removeall != null ) {
		productDAO.cartDelete(userNo);
		session.setAttribute("cartList", null);
		response.sendRedirect("./cart.jsp");
		return;
	}
	
	// 장바구니 개별 항목 삭제
	List<Product> cartList = (List<Product>) session.getAttribute("cartList");
	
	if( cartList == null ) { 
		response.sendRedirect("./cart.jsp");
		return;
	}
	for(int i = 0; i < cartList.size(); i++) {
		Product product = cartList.get(i);
		int pNo = product.getProductNo();
		if( pNo == Integer.parseInt(removeid) ) {
			cartList.remove( product );
			break;
		}
	}
	if(removeall == null && removeid != null ) {
		productDAO.cartMenuDelete(removeid, userNo);
		response.sendRedirect("./cart.jsp");
		return;
	}
%>