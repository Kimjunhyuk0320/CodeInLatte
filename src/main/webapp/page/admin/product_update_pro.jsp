<%@page import="java.util.UUID"%>
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
	boolean newFile = false;			// 새 이미지 파일 업로드 여부
	while( params.hasNext() ) {
		FileItem item = (FileItem) params.next();
		
		// FileItem
		// .getFieldName()		: 요청 파라미터 이름 - productId
		// .getString()			: 요청 파라미터 값   - P1001
		
		String value = item.getString("utf-8");			// P1001
		// 일반 데이터
		if( item.isFormField() ) {
			switch(item.getFieldName()) {
				case "productId" 		: product.setProductNo(Integer.parseInt(value));  break;
				case "name" 			: product.setProductName(value);  break;
				case "unitPrice" 		: product.setProductPrice(value.isEmpty() ? 0 : Integer.parseInt(value));  break;
				case "description" 		: product.setProductCon( value );  break;
				case "category" 		: product.setProductCat( value );  break;
			}
		}
		// 파일 데이터
		else {
			String fileName = item.getName();
			
			if( item == null || fileName == null || fileName == "" ) continue;	// 이미지 없이 업로드한 경우 null 체크
			fileName = UUID.randomUUID().toString().substring(0, 11) + "_" + fileName;
			File fileObj = new File(path + "/" + fileName);
			item.write(fileObj);			// 파일 저장
			file = fileObj.getPath();		
			product.setProductImg(file);			// DB 에 추가할 파일 경로(file 변수) 지정	- "E:/TJE/UPLOAD/강아지.png"
			newFile = true;					// 업로드한 이미지 파일이 있음
		}
	}
	
		Product oldProduct = productDAO.select(Integer.toString(product.getProductNo()));
	if( newFile ) {
		// 기존 파일 삭제
		String oldFilePath = oldProduct.getProductImg();
		if(oldFilePath == null || oldFilePath.equals("")){
			oldFilePath = "";
		}
		// 파일 삭제
		File oldFile = new File(oldFilePath);
			
		// 파일 존재여부 확인
		if( oldFile.exists() ) {
			// delete()
			// - 파일 삭제 성공 --> true
			// - 파일 삭제 실패 --> false
			// * 하위 경로에 파일이 존재하면 삭제가 되지 않는다.
			if( oldFile.delete() ) {
				System.out.println("파일 삭제 성공!!!");
			}
			else {
				System.err.println("파일 삭제 실패!!!");
			}
		} else {
			System.err.println("파일이 존재하지 않습니다!!!");
		}
	}else{
		product.setProductImg(oldProduct.getProductImg());
	}
	
	
	
 
	int result = productDAO.update(product);		// 상품 데이터 수정
	String productId = Integer.toString(product.getProductNo());
	
	if( result > 0 ) {
		response.sendRedirect("admin_products.jsp");					// 상품 목록 화면으로 이동
	} else {
		response.sendRedirect("product_update.jsp?id=" + productId);	// 상품 수정 화면으로 이동
	}

%>





