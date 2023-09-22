<%@page import="cafe.dto.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="productDAO" class="cafe.dao.ProductRepository" />
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
			String root = request.getContextPath();
			out.print(root);
			List<Product> productList = productDAO.list(); 
		%>
	<div class="container mb-5">
		<div class="row gy-4">
			<%
				for(int i = 0 ; i < productList.size() ; i++) {
					Product product = productList.get(i);
			%>
				<div class="col-md-6 col-xl-4 col-xxl-3">  
					<div class="card p-3">
						<!-- 이미지 영역 -->
						<div class="img-content">
							<img src="<%= root %>/img?id=<%= product.getProductNo() %>" class="w-100 p-2" />
						</div>
						<!-- 컨텐츠 영역 -->
						<div class="content">
							<h3 class="text-center"><%= product.getProductName() %></h3>
							<p><%= product.getProductCat() %></p>
							<p class="d-flex justify-content-between"></p>
								<div>
									<p class="text-end price">₩ <%= product.getProductPrice() %></p>						
								</div>
								<div>								
									<a href="product_delete_pro.jsp?id=<%= product.getProductNo() %>"
											   class="btn btn-danger mx-1">삭제</a>
									<a href="product_update.jsp?id=<%= product.getProductNo() %>"
											   class="btn btn-primary mx-1">수정</a>
								</div>
							</p>
						</div>						
					</div>
				</div>
			<%
				}
			%>
		</div>
	</div>
	
	
	
	
	
	
	
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>