<%@page import="java.text.DecimalFormat"%>
<%@page import="cafe.dto.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productDAO" class="cafe.dao.ProductRepository" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품페이지</title>
   <jsp:include page="/layout/link.jsp" />
</head>
<body>
<%
	DecimalFormat df = new DecimalFormat("###,###");
   	String root = request.getContextPath();
   	List<Product> productList = productDAO.list();
%>
<jsp:include page="/layout/header.jsp" />
   <div class="container">
      <div class="d-flex justify-content-around border-bottom my-3 w-100 text-center">
         <div class="py-3 w-100"><a href="./main_cat1.jsp" class="d-block">카페인</a></div>
         <div class="py-3 w-100"><a href="./main_cat2.jsp" class="d-block">디카페인</a></div>
         <div class="py-3 w-100 bg-dark bg-gradient text-white"><a href="./main_cat3.jsp" class="d-block">음료</a></div>
      </div>
      <div class="row gy-4">
      <%
         for(int i = 0; i < productList.size(); i++) {
            Product product = productList.get(i);
            if(product.getProductCat().equals("beverage")) {
      %>
         <div class="col-md-6 col-xl-4 col-xxl-3">
            <div class="card p-3">
               <!-- 이미지 영역 -->
               <div class="img-content">
                  <!-- [New] 이미지 썸네일 추가 -->
                  <img alt="이미지" src="<%= root %>/img?id=<%= product.getProductNo() %>" class="w-100 p-2">               
               </div>
               <!-- 컨텐츠 영역 -->
               <div class="content">
                  <h3><%= product.getProductName() %></h3>
                  <p><%= product.getProductCat() %></p>
                  <div class="d-flex justify-content-between w-100">
                     <p class="price">₩<%= df.format( product.getProductPrice() ) %></p>
                     <a href="./product.jsp?productNo=<%= product.getProductNo() %>" class="btn btn-dark">상세정보</a>
                  </div>                  
               </div>
            </div>
         </div>
      <%
            }
         }
      %>
      </div>
   </div>
<jsp:include page="/layout/footer.jsp" />
<jsp:include page="/layout/script.jsp"/>
</body>
</html>