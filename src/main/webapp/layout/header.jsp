<%@page import="cafe.dao.UserRepository"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="cafe.dto.Admin" %>
<%@ page import="cafe.dto.Coupon" %>
<%@ page import="cafe.dto.User" %>
<%@ page import="cafe.dto.Product" %>
<jsp:useBean id="couponDAO" class="cafe.dao.CouponRepository"/>
<jsp:useBean id="userDAO" class="cafe.dao.UserRepository"/>
<jsp:useBean id="adminDAO" class="cafe.dao.AdminRepository"/>
<jsp:useBean id="productDAO" class="cafe.dao.ProductRepository"/>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
   List<Product> cartList = (List<Product>) session.getAttribute("cartList");
   
//    int cartCount = 0;
//    if(cartList != null) cartCount = cartList.size();
   
   String root = request.getContextPath();
   
   String loginId = (String) session.getAttribute("loginId");
   
   String userTel = userDAO.getUserById(loginId).getUserTel();
   int userNo = userDAO.getUserById(loginId).getUserNo();
   
   List<Coupon> couponlist = couponDAO.couponCompletelist(userDAO.getUserByTel(userTel).getUserNo()); // check 0인 것만 해야함. -> 0이 사용가능한 쿠폰
	Coupon coupon = new Coupon();
	coupon = couponDAO.nonCompleCoupon(userNo, 0);
	int noncompl = coupon.getCount();
	int cartCount = 0;
	if (loginId == null){
		cartCount = (cartList == null ? 0 : cartList.size());
	}else{
		cartList = new ArrayList<Product>();
	      String userno = Integer.toString(userNo);
	      cartList = productDAO.payMents(userno);
	      cartCount = (cartList == null ? 0 : cartList.size());
	}
%>
 
<!-- Font Awesome CDN  -->
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<nav class="navbar navbar-expand-lg bg-white" style="height: 150px;">
  <div class="container-fluid">
    <div class="collapse navbar-collapse border-bottom">
       	 <%
            if(loginId == null) {
         %>
    <a class="navbar-brand px-3" href="<%= root %>/index.jsp"><img src="<%= root %>/static/img/logo.png" alt="로고" class="w-50 h-50" /></a>
          <%
            } else {
          %>
    <a class="navbar-brand px-3" href="<%= root %>/page/main/main_cat1.jsp"><img src="<%= root %>/static/img/logo.png" alt="로고" class="w-50 h-50" /></a>
		 <%
            }
          %>



         <div class="collapse navbar-collapse d-flex justify-content-end px-3">
         <ul class="navbar-nav">
         <%
            if(loginId == null) {
         %>
           <li class="nav-item px-2">
             <a class="nav-link active" aria-current="page" href="<%= root %>/page/start/login.jsp">로그인</a>
<%--              <a class="nav-link active" aria-current="page" href="<%= root %>/page/start/login.jsp">로그아웃</a> --%>
           </li>
           <li class="nav-item px-2">
             <a class="nav-link" href="<%= root %>/page/user/join.jsp">회원가입</a>
           </li>
          <%
            } else {
          %>
             <li class="nav-item px-2">
             <a class="nav-link active" aria-current="page" href="<%= root %>/page/start/logout.jsp">로그아웃</a>
<%--              <a class="nav-link active" aria-current="page" href="<%= root %>/page/start/login.jsp">로그아웃</a> --%>
           </li>
           <li class="nav-item px-2">
             <a class="nav-link" href="<%= root %>/page/main/main_cat1.jsp">상품목록</a>
           </li>
           <li class="nav-item px-2">
             <a class="nav-link" href="<%= root %>/page/coupon/coupon.jsp">Coupon(<%= noncompl %>)</a>
           </li>
          <%
            }
          %>
          
          
          
          
          
          
           <li class="nav-item px-2">
             <a class="nav-link" href="<%= root %>/page/main/cart.jsp"><i class="fa fa-shopping-cart fs-5"></i>(<%= cartCount %>)</a>
           </li>
           
           
           
           
           
           <%
           if(loginId == null) {
              
           } else {
           %>
           <li class="nav-item">
             <a class="nav-link" href="<%= root %>/page/user/user_update.jsp"><i class="fa fa-user-o fs-5"></i></a>
           </li>
           <%
           }
           %>
         </ul>
         </div>
    </div>
  </div>
</nav>