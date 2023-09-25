<%@page import="java.util.List"%>
<%@page import="cafe.dto.User"%>
<%@page import="cafe.dao.UserRepository"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.UUID"%>
<%@page import="cafe.dao.ProductRepository"%>
<%@page import="cafe.dao.AdminRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userNo = request.getParameter("userno");
	String userTel = "";
	String[] productNames = null;
	String[] productPrice = null;
	String[] cartCnt = null;
	out.print(userNo);
	Date now = new Date();
	DateFormat dateFomatter = new SimpleDateFormat("yyyyMMddHHmmss");
	String orderNumber = dateFomatter.format(now.getTime());
	out.print(orderNumber);
	int sum = 0;
	int stamp = 0;
	if(!userNo.equals("Guest")) {
		
		// 결제하기에서 넘어 온 유저번호
		userTel = request.getParameter("usertel");
		productNames = request.getParameterValues("productName");
		productPrice = request.getParameterValues("productPrice");
		cartCnt = request.getParameterValues("cartCnt");
		
		AdminRepository adminDAO = new AdminRepository();
		ProductRepository productDAO = new ProductRepository();
		UserRepository userDAO = new UserRepository();
		List<User> userList = userDAO.cartUserSelect(userNo);
		out.println("사용자 전화번호 : " + userTel);
		User user = null;
		if (productNames != null) {
		    for (int i = 1; i <= productNames.length; i++) {
		    	adminDAO.productOrder(userTel, productNames[i-1], cartCnt[i-1], productPrice[i-1], orderNumber);
				sum += Integer.parseInt(cartCnt[i-1]);
				out.print(productNames.length);
		    	if(i == (productNames.length)) {
		    		user = userList.get(i - productNames.length);
			    	stamp = user.getUserStamp();
			    	out.print("stamp : " + stamp + "<br>");
		    	}
		    	
		        out.println("상품명 " + (i-1) + ": " + productNames[i-1]);
		        out.println("주문수량 " + (i-1) + ": " + cartCnt[i-1]);
		        out.println("상품금액 " + (i-1) + ": " + productPrice[i-1]);
		        out.println("<br>");
		    }
		}
		stamp += sum;
		out.print(stamp);
		out.print(userNo);
		
		int result = userDAO.stampUp(userNo, stamp);
		session.setAttribute("cartList", null);
		productDAO.cartDelete(userNo);
		
	} else {
		// 결제하기에선 넘어 온 유저번호
				userTel = request.getParameter("usertel");
				productNames = request.getParameterValues("productName");
				productPrice = request.getParameterValues("productPrice");
				cartCnt = request.getParameterValues("cartCnt");
				
				AdminRepository adminDAO = new AdminRepository();
				ProductRepository productDAO = new ProductRepository();
			
				out.println("사용자 전화번호 : " + userTel);
				if (productNames != null) {
				    for (int i = 0; i < productNames.length; i++) {
				    	adminDAO.productOrder(userTel, productNames[i], cartCnt[i], productPrice[i], orderNumber);
				    	
				    	
				    	
				        out.println("상품명 " + i + ": " + productNames[i]);
				        out.println("주문수량 " + i + ": " + cartCnt[i]);
				        out.println("상품금액 " + i + ": " + productPrice[i]);
				        out.println("<br>");
				    }
				}
				
				session.setAttribute("cartList", null);
	}
	
	response.sendRedirect("order_complete.jsp?usertel=" + userTel);
%>