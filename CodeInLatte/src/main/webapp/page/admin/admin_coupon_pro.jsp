<%@page import="cafe.dto.Coupon"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@page import="java.util.Iterator"%>
<%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.*"%>

<jsp:useBean id="couponDAO" class="cafe.dao.CouponRepository"/>

<%
	request.setCharacterEncoding("UTF-8");
	
	String path = "D:\\JSG\\UPLOAD";
	DiskFileUpload upload = new DiskFileUpload();
	
	upload.setSizeMax( 10*1000*1000 );		// 10MB - 파일 최대 크기
	upload.setSizeThreshold( 4 * 1024 );	// 4MB - 메모리상의 최대 크기
	upload.setRepositoryPath( path );		// 임시 저장 경로
	
	List items = upload.parseRequest( request );
	Iterator params = items.iterator();
	
	Coupon coupon = new Coupon();
	
	String file = "";
	
	while( params.hasNext() ) {
		FileItem item = (FileItem) params.next();
		
		// FileItem
		// - getFieldName()		: 요청 파라미터 이름 - productId
		// .getString()			: 요청 파라미터 값 - P1001
		
		String value = item.getString("utf-8");
		
		// 일반 데이터
		if( item.isFormField()){
			switch(item.getFieldName()){
			case "couponNo" 		: coupon.setCouponNo(value.isEmpty() ? 0 : Integer.parseInt(value)); break;
			case "userNo" 			: coupon.setCouponNo(value.isEmpty() ? 0 : Integer.parseInt(value)); break;
			// 쿠폰 발행 하고 userNo는 생성해서 넣어주면 안되나?
			case "CouponName" 		: coupon.setCouponName( value ); break;
			case "CouponDueDate" 	: coupon.setCouponDueDate( value ); break;
			case "CouponDate" 		: coupon.setCouponDate( value ); break;
			case "CouponCheck" 		: coupon.setCouponCheck( value.isEmpty() ? 0 : Integer.parseInt(value) ); break;
			}
		}
		
		// 파일 데이터
		else {
			
			String fileName = item.getName();
			
			if( item == null || fileName == null || fileName == "") continue;	// 이미지 없이 업로드

			File fileObj = new File(path + "/" + fileName);
			item.write(fileObj);	// 파일 저장
			file = fileObj.getPath();
			coupon.setCouponImg(file);	// DB에 추가할 파일 경로(file 변수) 지정
		}
	}
	
//	int result = couponDAO.couponGenerate(coupon);
	
	response.sendRedirect("coupon_list.jsp");		
	
%>