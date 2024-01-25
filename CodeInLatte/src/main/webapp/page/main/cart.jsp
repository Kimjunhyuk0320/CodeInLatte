<%@page import="java.text.DecimalFormat"%>
<%@page import="cafe.dao.ProductRepository"%>
<%@page import="cafe.dto.User"%>
<%@page import="cafe.dao.UserRepository"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cafe.dto.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	DecimalFormat df = new DecimalFormat("###,###");
   	String root = request.getContextPath();

   	String productNo = request.getParameter("productNo");
   	// 세션으로 유저 넘버 받아오기
   	// 현재 임시로 값 받기
   	String userId = (String) session.getAttribute("loginId");
   	String userNo = "";
   	String userTel = "";
   	List<Product> userCartList = null;
   	List<Product> cartList = null;
   	ProductRepository productDAO = null;
   	if(userId != null) {
      	// 장바구니 목록을 세션에서 가져오기
      	cartList = (List<Product>) session.getAttribute("cartList");
      	if(cartList == null) cartList = new ArrayList<Product>();
      
      	UserRepository userDAO = new UserRepository();
      	int uNo = userDAO.getUserById(userId).getUserNo();
      	userNo = String.valueOf(uNo);
      	userTel = userDAO.getUserById(userId).getUserTel();
      
      	productDAO = new ProductRepository();
      	userCartList = productDAO.payMents(userNo);
      
   	} else {
     	// 장바구니 목록을 세션에서 가져오기
      	cartList = (List<Product>) session.getAttribute("cartList");
      	if(cartList == null) cartList = new ArrayList<Product>();
   	}
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CodeInLatte</title>
   <jsp:include page="/layout/link.jsp" />
</head>
<body>
<jsp:include page="/layout/header.jsp" />
<!-- 장바구니 영역 -->
   <div class="container">
   
   <h2 class="w-100 text-center">Shopping Cart</h2>
   <div class="cart_box row d-flex justify-content-between w-100">
      <div class="left_box col-md-6">
         <ul>
         <%
         int sum = 0;
         if(userId == null) {

            for(int i = 0; i < cartList.size(); i++) {
               Product product = cartList.get(i);
               int total = product.getProductPrice() * product.getQuantity();
               sum += total;
         %>
            <li class="product_box d-flex border-bottom">
               <div class="img_box"><img src="<%= root %>/img?id=<%= product.getProductNo() %>" alt="이미지"/></div>
               <div class="name_price_box position-relative">
                  <h5 class="px-4 lh-1 pt-4"><%= product.getProductName() %></h5>
                  <p class="px-4">₩<%= df.format( product.getProductPrice() ) %></p>
                  <p class="px-4 position-absolute bottom-0">SUBTOTAL</p>
               </div>
               <div class="cnt_box position-relative">
                  <div class="input_box d-flex">
                     <button class="minus" disabled>-</button>
                     <input type="number" name="quantity" id="quantity" value="<%= product.getQuantity() %>" min="0" max="999" readonly/>
                     <button class="plus" disabled>+</button>
                  </div>
                  <div class="button_box position-absolute bottom-0">
                     <p>₩<%= df.format( total )%></p>
                  </div>
               </div>
               <div>
                  <a href="cart_remove.jsp?removeid=<%= product.getProductNo() %>" ><i class="fa fa-close"></i></a>
               </div>
            </li>
         <%
            }
         } else {
            
         
            for(int i = 0; i < userCartList.size(); i++) {
               Product product = userCartList.get(i);
               Product userProduct = productDAO.select(String.valueOf(product.getProductNo()));
               int total = userProduct.getProductPrice() * product.getCartCnt();
               sum += total;
         %>
            <li class="product_box d-flex border-bottom">
                  <div class="img_box"><img src="<%= root %>/img?id=<%= product.getProductNo() %>" alt="이미지"/></div>
                  <div class="name_price_box position-relative">
                     <h5 class="px-4 lh-1 pt-4"><%= userProduct.getProductName() %></h5>
                     <p class="px-4">₩<%= df.format( userProduct.getProductPrice() ) %></p>
                     <p class="px-4 position-absolute bottom-0">SUBTOTAL</p>
                  </div>
                  <div class="cnt_box position-relative">
                     <div class="input_box d-flex">
                        <button class="minus" disabled>-</button>
                        <input type="number" id="quantity" value="<%= product.getCartCnt() %>" min="0" max="999" readonly/>
                        <button class="plus" disabled>+</button>
                     </div>
                     <div class="button_box position-absolute bottom-0">
                        <p>₩<%= df.format( total ) %></p>
                     </div>
                  </div>
                  <div>
                     <a href="cart_remove.jsp?removeid=<%= product.getProductNo() %>" ><i class="fa fa-close"></i></a>
                  </div>
               </li>
            <%   
            }
         }
         %>
         </ul>
      </div>
      <div class="right_box position-relative col-md-6">
         <div class="total_box">
         <h3>Cart Totals</h3>
         <hr>
         <ul class="d-flex justify-content-between">
            <li>Total</li>
         <%
            if(!cartList.isEmpty()) {
         %>
            <li>₩<%= df.format( sum ) %></li>
         <%
            } else {
         %>
            <li>0</li>
         <%
            } 
         %>
         </ul>
         <%
         if(userId != null) {   
         %>
         <!-- 버튼 영역 -->
            <div class="d-flex justify-content-between align-items-center">
<%--                <a href="cart_remove.jsp?removeall=<%= productNo %>" class="btn btn-lg btn-danger">삭제하기</a> --%>
<!--                <a href="./main_cat1.jsp" class="btn btn-lg btn-success">상품페이지</a> -->
               <a href="payment.jsp?userNo=<%= userNo %>" class="btn btn-lg btn-dark w-100">주문하기</a>
            </div>
         <%
         } else { 
         %>
         <!-- 버튼 영역 -->
            <div class="d-flex justify-content-between align-items-center">
<%--                <a href="cart_remove.jsp?removeall=<%= productNo %>" class="btn btn-lg btn-danger">삭제하기</a> --%>
<!--                <a href="./main_cat1.jsp" class="btn btn-lg btn-success">상품페이지</a> -->
               <a href="payment.jsp?userNo=Guest" class="btn btn-lg btn-dark w-100">주문하기</a>
            </div>
         <%
         }
         %>
         </div>
      </div>
   </div>
   <div class="text-center w-100">
      <a href="cart_remove.jsp?removeall=<%= productNo %>" class="btn btn-lg btn-outline-dark me-5 delete_btn">DELETE CART</a>
   </div>
   </div>
   <div class="w-100 position-absolute bottom-0 back_btn_box">
      <a href="./main_cat1.jsp" class="btn btn-lg btn-dark mx-5">상품페이지</a>
   </div>
<jsp:include page="/layout/footer.jsp" />
<jsp:include page="/layout/script.jsp"/>
</body>
</html>