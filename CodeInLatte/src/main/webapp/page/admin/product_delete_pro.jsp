<%@page import="cafe.dto.Product"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productDAO" class="cafe.dao.ProductRepository" />
<%       

	String productId = request.getParameter("id");
	
	// 파일 경로 조회
	Product product = productDAO.select(productId);
	
	if( product == null ) {
		response.sendRedirect("admin_products.jsp");
		return;
	}
	String filePath = product.getProductImg();
	// 파일 삭제
	File file = new File(filePath);
		
	// 파일 존재여부 확인
	if( file.exists() ) {
		// delete()
		// - 파일 삭제 성공 --> true
		// - 파일 삭제 실패 --> false
		// * 하위 경로에 파일이 존재하면 삭제가 되지 않는다.
		if( file.delete() ) {
			System.out.println("파일 삭제 성공!!!");
		}
		else {
			System.err.println("파일 삭제 실패!!!");
		}
	} else {
		System.err.println("파일이 존재하지 않습니다!!!");
	}
	
	// 데이터 삭제
	int result = productDAO.delete(productId);			// 상품 데이터 삭제
	
	response.sendRedirect("admin_products.jsp");			// 상품 편집 목록으로 이동
	
%>

