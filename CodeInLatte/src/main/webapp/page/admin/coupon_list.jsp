<%@page import="cafe.dao.CouponRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="couponDAO" class="cafe.dao.CouponRepository"/>
<%@ page import="cafe.dto.Coupon"%> 
<%@ page import="java.util.List"%> 
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>쿠폰 목록 불러오기</title>
   <jsp:include page="/layout/link.jsp" />
</head>
<body>
   <jsp:include page="/layout/admin_header.jsp" />
   <%
      List<Coupon> couponList = couponDAO.couponlist();      
   %>

   <h3 class="Admin text-center" style="margin-top:20px; margin-bottom:30px;"></h3>
   
   <!-- 쿠폰 목록 -->
   <div class="Admin container">
        <div id="Admin layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">쿠폰 목록 조회</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                    <li class="breadcrumb-item active">Tables</li>
                </ol>
                <div class="card mb-4">
                    <div class="card-body">
                        회원 정보와 쿠폰 정보를 보여주는 목록입니다. 
                    </div>
                </div>
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-table me-1"></i>
                        DataTable CouponList
                    </div>
                    <div class="card-body">
                        <table class="table" id="datatablesSimple">
                            <thead>
                                <tr>
                           <th style="text-align:center;">쿠폰번호</th>
                           <th style="text-align:center;">쿠폰명</th>
                           <th style="text-align:center;">쿠폰 발행일</th>
                           <th style="text-align:center;">회원번호</th>
                           <th style="text-align:center;">쿠폰 사용 여부</th>
                           <th style="text-align:center;">유효기한</th>
                           <th></th>
                                </tr>
                            </thead>
                            <tbody>
                          <%
                     for(int i = 0 ; i < couponList.size() ; i++) {
                     Coupon coupon = couponList.get(i);
                    %>
                     <tr>
                        <td style="text-align:center;"><%= coupon.getCouponNo() %></td>         
                        <td style="text-align:center;"><%= coupon.getCouponName()%></td>         
                        <td style="text-align:center;"><%= coupon.getCouponDate() %></td>         
                        <td style="text-align:center;"><%= coupon.getUserNo() %></td>         
                        <td style="text-align:center;"><%= coupon.getCouponCheck() %></td>         
                        <td style="text-align:center;"><%= coupon.getCouponDueDate() %></td>         
                        <td><a href="#" class="btn btn-danger" onclick="#">삭제</a></td>         
                     </tr>
                   <%
                     }
                   %>
                            </tbody>
                            <tfoot>
                  <%
                     if( couponList.isEmpty() ) {
                  %>
                     <tr>
                        <td colspan="6">발행된 쿠폰이 없습니다.</td>   
                     </tr>
                  <% } else { %>
                     <tr>
                        <td colspan=6; style="text-align:right;" >총 발행된 쿠폰 수</td>
                        <td colspan=2; style="text-align:center;"><%= couponList.size() %></td>
                     </tr>
                  <%
                     }
                  %>
                     </tfoot>
                       </table>
                   </div>
               </div>
           </div>
       </main>
    </div>
    </div>
   <jsp:include page="/layout/footer.jsp" />
   <jsp:include page="/layout/script.jsp" />
</body>
</html>