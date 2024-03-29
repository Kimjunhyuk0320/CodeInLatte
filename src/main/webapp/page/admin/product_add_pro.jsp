<%@page import="cafe.dto.Product"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>       
<%@page import="java.util.List"%>  
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productDAO" class="cafe.dao.ProductRepository" />   
<%     
	request.setCharacterEncoding("UTF-8");
	String root = request.getContextPath();
	// [NEW] - 파일 업로드 추가 
	String path = root+"\\static\\img\\product";
	
	DiskFileUpload upload = new DiskFileUpload();  
	
	upload.setSizeMax(10*1000*1000); 		// 10MB - 파일 최대 크기
	upload.setSizeThreshold( 4 * 1024 );	// 4MB	- 메모리상의 최대 크기
	upload.setRepositoryPath(path);			// 임시 저장 경로
	
	List<FileItem> items = upload.parseRequest(request);
	Iterator params = items.iterator();
	
	Product product = new Product();
	String file = "";
	while( params.hasNext() ) {
		FileItem item = (FileItem) params.next();
		
		// FileItem
		// .getFieldName()		: 요청 파라미터 이름 - productId
		// .getString()			: 요청 파라미터 값   - P1001
		
		String value = item.getString("utf-8");			// P1001
		// 일반 데이터
		if( item.isFormField() ) {
			switch(item.getFieldName()) {
				
				case "name" 			: product.setProductName( value );  break;
				case "unitPrice" 		: product.setProductPrice(value.isEmpty() ? 0 : Integer.parseInt(value));  break;
				case "description" 		: product.setProductCon( value );  break;
				case "category" 		: product.setProductCat( value );  break;
			}
		}
		// 파일 데이터
		else {
			String fileName = item.getName();
			if( item == null || fileName == null || fileName == "" ) continue;
			File fileObj = new File(path + "/" + fileName);
			item.write(fileObj);			// 파일 저장
			file = fileObj.getPath();		
			product.setProductImg(file);			// DB 에 추가할 파일 경로(file 변수) 지정	- "E:/TJE/UPLOAD/강아지.png"
		}
	}


	int result = productDAO.insert(product);		// 상품 데이터 등록
	 
	response.sendRedirect("admin_main.jsp");			// 상품 목록으로 이동
%>