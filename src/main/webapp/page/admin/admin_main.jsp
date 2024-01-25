<%@page import="cafe.dto.Coupon"%>
<%@page import="cafe.dao.CouponRepository"%>
<%@page import="cafe.dto.Order"%>
<%@page import="java.util.List"%>
<%@page import="cafe.dao.OrderRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/layout/link.jsp" />
</head>
<body>
	<jsp:include page="/layout/admin_header.jsp" />

<%
	OrderRepository orderDAO = new OrderRepository();
	List<Order> orderList = orderDAO.orderlist();

	int sum = 0;
	for(int i = 0 ; i < orderList.size() ; i++) {
		Order order = orderList.get(i);
		int orderPrice = order.getOrderPrice();
		sum += orderPrice * order.getOrderCnt();
	}
	
	CouponRepository couponDAO = new CouponRepository();
	List<Coupon> couponList = couponDAO.couponlist();
	int number = couponList.size();
	String root = request.getContextPath();

	/////////
	String loginId = (String) session.getAttribute("loginId");

	boolean login = false;
	if( loginId != null && !loginId.isEmpty() ) {
		login = true;
	}
	
	// 쿠폰 사용 여부에 따른 개수
	int couponCnt = 0;
	int noncouponCnt = 0;
	Coupon coupon = null;
	
	for(int i = 0; i < couponList.size(); i++){
		coupon = couponList.get(i);
		
		
		if(coupon.getCouponCheck() == 0) {
			noncouponCnt++;
		} else {
			couponCnt++;
		}
	}
%>	
	<div class="row m-0 mypage">
		<!-- 사이드바 -->
		<div class="sidebar border border-right col-md-3 col-lg-2 p-0 bg-body-tertiary">
			<div class="d-flex flex-column flex-shrink-0 p-3 bg-body-tertiary">
			    <ul class="nav nav-pills flex-column mb-auto">
			      <!-- 로그인 시 -->
			      <% if( login ) { %>
					  <li><a href="<%= root %>/page/admin/admin_main.jsp" class="nav-link active">관리자 메인페이지</a></li>
			          <li><a href="<%= root %>/page/admin/product_add.jsp" class="nav-link link-body-emphasis">상품 등록</a></li>
				      <li><a href="<%= root %>/page/admin/admin_products.jsp" class="nav-link link-body-emphasis">상품 수정</a></li>
				      <li><a href="<%= root %>/page/admin/order_list.jsp" class="nav-link link-body-emphasis">주문 목록 조회</a></li>
				      <li><a href="<%= root %>/page/admin/coupon_list.jsp" class="nav-link link-body-emphasis">쿠폰 목록 조회</a></li>
			      <% } %>
			    </ul>
			    <hr>
			 </div>
		</div>
	

	<!-- 콘텐츠 -->
	<div class="col-md-9 ms-sm-auto col-lg-10 p-0 m-0">
			<div class="px-4 py-3 my-3 text-center">
				<br>
				<h1 class="display-5 fw-bold text-body-emphasis">관리자 메인페이지</h1>
			</div>
			
			<!-- 콘텐츠 내용-->
                         
			<div class="container shop m-auto mb-5">
				<div class="btn-box d-grid gap-2">
					<div id="layoutSidenav_content">
               
                    <div class="container-fluid px-4">
                                    
                        <div class="card mb-4">
                            <div class="card-body">
                               Code In Latte의 관리자 페이지 입니다.
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-chart-area me-1"></i>
                               <!--  10월 총 매출액 (\<%= sum %> 원)--> 
									월별 매출 현황	        					
                            </div>
                            <div class="card-body">
                            
	               
	                            <canvas id="myChart" width="100%" height="30"></canvas></div>
                            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        인기 상품별 주문 수량
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="50"></canvas></div>
                                    <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-pie me-1"></i>
                                        쿠폰 발급 현황 (총 쿠폰 발행 수 : <%= number %>)
                                    </div>
                                    <div class="card-body"><canvas id="myPieChart" width="100%" height="50"></canvas></div>
                                    <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
	               </div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
	


<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script>
  var ctx = document.getElementById('myBarChart');

  var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ['아메리카노', '카페라떼', '패션 후르츠 에이드', '블루 레몬 에이드', '오곡 라떼', '헤이즐넛 커피'],
      datasets: [{
        label: '주문 상품 수',
        data: [25, 19, 4, 11, 8, 3],
        borderWidth: 1
      }]
    },
    options: {
//	  responsive: false,
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });
  
  var ctx2 = document.getElementById('myPieChart').getContext('2d');
	var myChart2 = new Chart(ctx2, {
	    type: 'pie',
	    data: {
	    	labels: ['사용', '미사용'],
	        datasets: [{
	            label: '쿠폰 갯수',
	            data: [<%= noncouponCnt %>, <%= couponCnt %>],
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	            ],
	            borderColor: [
	                'rgba(255, 99, 132, 1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)'
	            ],
	            borderWidth: 1
	        }]
	    },
	    options: {
//	    	responsive: false,
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero: true
	                }
	            }]
	        }
	    }
	});
	
	
	var ctx3 = document.getElementById('myChart');
	const stackedLine = new Chart(ctx3, {
	    type: 'line',
	    data: {
	        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'July', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
	        datasets: [{
	          label: '월별 매출액',
	          data: [500000, 190000, 400000, 1145000, 844400, 344500, 500000, 400000, 300000, 569000],
	          borderWidth: 1
	        }]
	      },
	    options: {
	        scales: {
	            y: {
	                stacked: true
	            }
	        }
	    }
	});
	 
</script>
   
			

	
</body>
</html>