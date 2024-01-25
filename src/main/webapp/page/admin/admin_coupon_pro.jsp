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
	
	upload.setSizeMax( 10*1000*1000 );		// 10MB - ���� �ִ� ũ��
	upload.setSizeThreshold( 4 * 1024 );	// 4MB - �޸𸮻��� �ִ� ũ��
	upload.setRepositoryPath( path );		// �ӽ� ���� ���
	
	List items = upload.parseRequest( request );
	Iterator params = items.iterator();
	
	Coupon coupon = new Coupon();
	
	String file = "";
	
	while( params.hasNext() ) {
		FileItem item = (FileItem) params.next();
		
		// FileItem
		// - getFieldName()		: ��û �Ķ���� �̸� - productId
		// .getString()			: ��û �Ķ���� �� - P1001
		
		String value = item.getString("utf-8");
		
		// �Ϲ� ������
		if( item.isFormField()){
			switch(item.getFieldName()){
			case "couponNo" 		: coupon.setCouponNo(value.isEmpty() ? 0 : Integer.parseInt(value)); break;
			case "userNo" 			: coupon.setCouponNo(value.isEmpty() ? 0 : Integer.parseInt(value)); break;
			// ���� ���� �ϰ� userNo�� �����ؼ� �־��ָ� �ȵǳ�?
			case "CouponName" 		: coupon.setCouponName( value ); break;
			case "CouponDueDate" 	: coupon.setCouponDueDate( value ); break;
			case "CouponDate" 		: coupon.setCouponDate( value ); break;
			case "CouponCheck" 		: coupon.setCouponCheck( value.isEmpty() ? 0 : Integer.parseInt(value) ); break;
			}
		}
		
		// ���� ������
		else {
			
			String fileName = item.getName();
			
			if( item == null || fileName == null || fileName == "") continue;	// �̹��� ���� ���ε�

			File fileObj = new File(path + "/" + fileName);
			item.write(fileObj);	// ���� ����
			file = fileObj.getPath();
			coupon.setCouponImg(file);	// DB�� �߰��� ���� ���(file ����) ����
		}
	}
	
//	int result = couponDAO.couponGenerate(coupon);
	
	response.sendRedirect("coupon_list.jsp");		
	
%>