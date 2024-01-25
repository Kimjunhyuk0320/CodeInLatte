<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%
   String root = request.getContextPath();
   String loginId = (String) session.getAttribute("loginId");
%>
   <div class="container" id="Admin">
      <nav class="navbar navbar-expand-lg sticky-top">
        <div class="container-fluid">
          <!-- 로고 이미지 -->
            <a class="navbar-brand text-center px-3" href="admin_main.jsp"><img src="<%= root %>/static/img/logo.png" 
                   alt="로고" class="w-50 h-50"/></a>
         <%
               if(!(loginId == null)){
            %>
            
          <!-- Nav 메뉴 -->
         <!-- Nav 메뉴 : 관리자 모드 접속 -->   
          <div class="collapse navbar-collapse d-flex justify-content-start px-3" id="navbarNav">
            <ul class="navbar-nav nav-underline">
              <li class="nav-item px-2" id="pro_add">
                <a class="nav-link link-secondary" href="<%= root %>/page/admin/product_add.jsp">상품등록</a>
              </li>
              <li class="nav-item px-2" id="pro_update">
                <a class="nav-link link-secondary" href="<%= root %>/page/admin/product_update.jsp">상품수정</a>
              </li>
              <li class="nav-item px-2" id="order">
                <a class="nav-link link-secondary" href="<%= root %>/page/admin/order_list.jsp">주문내역</a>
              </li>
              <li class="nav-item px-2" id="coupon">
                <a class="nav-link link-secondary" href="<%= root %>/page/admin/coupon_list.jsp">쿠폰내역</a>
              </li>
            </ul>
            
          <%
             } 
          %>
   
          <!-- Nav 메뉴 : 로그아웃 되어 있을 때 -->   
          <div class="collapse navbar-collapse d-flex justify-content-end px-3">
             <ul class="navbar-nav">
         <%
            if(loginId == null) {
         %>
               <li class="nav-item px-2">
                  <a class="nav-link active" aria-current="page" href="<%= root %>/page/start/admin_login.jsp">로그인</a>
               </li>
            
         <!-- Nav 메뉴 : 로그인 되어 있을 때 -->                 
          <%
            } else {
          %>
            <li class="nav-item px-2">
               <a class="nav-link active" aria-current="page" href="<%= root %>/page/start/logout.jsp">로그아웃</a>
            </li>
         <%
               }
         %>
            </ul>
         </div>
      </div>
   </div>
   </nav>
</div>