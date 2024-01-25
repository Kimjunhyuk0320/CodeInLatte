<!-- 쿠폰 사용하기 기능 추가 -->
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%> 
<%@ page import="cafe.dto.Admin" %>
<%@ page import="cafe.dto.Coupon" %>
<%@ page import="cafe.dto.User" %>
<%@ page import="cafe.dto.Product" %>
<jsp:useBean id="couponDAO" class="cafe.dao.CouponRepository"/>
<jsp:useBean id="userDAO" class="cafe.dao.UserRepository"/>
<jsp:useBean id="adminDAO" class="cafe.dao.AdminRepository"/>
<jsp:useBean id="productDAO" class="cafe.dao.ProductRepository"/>

<%
	String root = request.getContextPath();
		
	String userTel = request.getParameter("usertel");
	String couponNo = request.getParameter("couponNo");
	int userNo = couponDAO.couponSelect(couponNo).getUserNo();
	int couponCheck = couponDAO.couponSelect(couponNo).getCouponCheck();
	
//	out.print("couponCheck : " +  couponCheck + " "); //선택한 쿠폰 넘버에 대한 쿠폰 사용 여부 확인
	
	int stampCount = userDAO.getUserByTel(userTel).getUserStamp();
//	out.print("stampCount : " +  stampCount + " ");
	
	if(couponNo != null){
		int useCouponNo = Integer.parseInt(couponNo);
		
		List<Coupon> completedCouponlist = couponDAO.couponCompletelist(userNo, couponCheck);
		Coupon coupon = new Coupon();
		
		for(int i=0; i<completedCouponlist.size(); i++){
			coupon = completedCouponlist.get(i);
		}
		
		// 쿠폰 사용 처리 : 사용 가능(1), 사용 완료(2)
		if(coupon !=null && couponCheck==0){
			//stampCount--;
			
			Coupon usedCoupon = new Coupon();
			
			usedCoupon.setCouponNo(Integer.parseInt(couponNo));
			usedCoupon.setUserNo(userNo);
			usedCoupon.setCouponCheck(1);
			
			completedCouponlist.add(usedCoupon);
			couponDAO.couponUpdate(coupon); // DB 업데이트
		}
		
	}
	
 %>
 
 

