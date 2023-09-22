<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cafe.dto.Product"%>
<%@page import="cafe.dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%
	// 상품ID 넘겨받기
	String productNo = request.getParameter("id");
	out.print(productNo);
		
	// 존재하는 상품인지?
	ProductRepository productDAO = new ProductRepository();
	Product product = productDAO.select(productNo);
	
	// 존재하지 않는 상품일 때
	if(product == null) {
		String root = request.getContextPath();
		response.sendRedirect(root + "/error/exception.jsp");
		// 테스트 해보기
	}
			
	// 장바구니 목록 세션 정보 등록
	List<Product> list = (List<Product>) session.getAttribute("cartList");
	
	// 최초 장바구니 담기
	if( list == null ) {
		list = new ArrayList<Product>();
		session.setAttribute("cartList", list);
	}
	
	int cnt = 0;
	Product productItem = new Product();
	
	for(int i = 0; i < list.size(); i++) {
		productItem = list.get(i);
		int pNo = productItem.getProductNo();
		// 기존의 장바구니 목록의 상품과 지금 추가하는 상품이 같으면, 개수를 누적
		if( pNo == Integer.parseInt(productNo) ) {
			cnt++;
			int count = productItem.getQuantity() + 1;	// 장바구니 개수 누적
			productItem.setQuantity(count);
		}
	}
	
	// 신규 상품을 장바구니 추가한 경우
	if(cnt == 0) {
		product.setQuantity(1);		// 최초 장바구니 개수 1
		list.add(product);
	}
	
	// 상품 상세 페이지로 이동
	response.sendRedirect("product.jsp?id=" + productNo);
%>