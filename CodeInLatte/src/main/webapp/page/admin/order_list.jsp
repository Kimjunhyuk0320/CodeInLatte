<%@page import="cafe.dto.Order"%>
<%@page import="cafe.dao.OrderRepository"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
<head>
   <meta charset="UTF-8">
   <title>전체 사용자 주문 내역 목록 불러오기</title>
   <jsp:include page="/layout/link.jsp" />
</head>

<body>
   <jsp:include page="/layout/admin_header.jsp" />
   <%
      OrderRepository orderDAO = new OrderRepository();
      List<Order> orderList = orderDAO.orderlist();
   %>
   
   <h3 class="Admin text-center" style="margin-top:20px; margin-bottom:30px;"></h3>

   <!-- 주문 목록 -->
      <div class="Admin container">
        <div id="Admin layoutSidenav_content">

        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">주문 목록 조회</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                    <li class="breadcrumb-item active">Tables</li>
                </ol>

                <div class="card mb-4">
                    <div class="card-body">
                        전체 사용자의 주문 정보를 보여주는 목록입니다. 
                    </div>
                </div>

                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-table me-1"></i>
                        DataTable OrderList
                    </div>

                    <div class="card-body">
                        <table class="table" id="datatablesSimple">
                            <thead>
                                <tr>
                           <th style="text-align:center;">결제번호</th>
                           <th style="text-align:center;">상품명</th>
                           <th style="text-align:center;">수량</th>
                           <th style="text-align:center;">연락처</th>
                           <th style="text-align:center;">주문번호</th>
                           <th style="text-align:center;">주문일자</th>
                           <th style="text-align:center;">합계</th>
                           <th style="text-align:center;">비고</th>
                           <th></th>
                                </tr>
                            </thead>
                            <tbody>

                          <%
                             int sum = 0;
                       for(int i = 0 ; i < orderList.size() ; i++) {
                       Order order = orderList.get(i);
                       int orderPrice = order.getOrderPrice();
                         sum += orderPrice;
                    %>
                     <tr>
                        <td style="text-align:center;"><%= order.getOrderNo() %></td>         
                        <td style="text-align:center;"><%= order.getOrderName()%></td>         
                        <td style="text-align:center;"><%= order.getOrderCnt()%></td>         
                        <td style="text-align:center;"><%= order.getUserTel() %></td>         
                        <td style="text-align:center;"><%= order.getOrderNumber() %></td>
                        <td style="text-align:center;"><%= order.getOrderDate() %></td>         
                        <td style="text-align:center;"><%= order.getOrderPrice() %></td>
                        <td><a href="#" class="btn btn-danger">삭제</a></td>         
                     </tr>

                   <%
                     }
                   %>
                            </tbody>
                            <tfoot>

                  <%
                     if( orderList.isEmpty() ) {
                  %>

                     <tr>
                        <td colspan="6">주문 목록이 없습니다.</td>   
                     </tr>

                  <% } else { %>

                     <tr>
                        <td colspan=7>총 주문 수</td>
                        <td colspan=2><%= orderList.size() %></td>
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