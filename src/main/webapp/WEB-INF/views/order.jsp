<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<c:set var="context" value="${ pageContext.request.contextPath }" />
<link rel="shortcut icon" href='<c:url value="/resources/images/favicon.ico" />' type="image/x-icon">
<link rel="icon" href='<c:url value="/resources/images/favicon.ico" />' type="image/x-icon">
<link rel="stylesheet"
	href='<c:url value="/resources/bootstrap-4.5.0-dist/css/bootstrap.min.css"></c:url>'>
<link rel="stylesheet" href="${ context }/resources/css/main.css">
<script src="${ context }/resources/js/cart.js"></script>
<script src="${ context }/resources/js/jquery.min.js"></script>
<script src="${ context }/resources/js/popper.min.js"></script>
<script src="${ context }/resources/bootstrap-4.5.0-dist/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="${ context }/resources/fontawesome-free-5.15.3-web/css/all.css">
<title>Insert title here</title>
</head>
<body>
	<fmt:setLocale value="vi_VN"/>
	
	<%@include file="navigationBar.jsp" %>
	
	<div class="container pb-5 pt-5">
		<div class="row">
			<div class="col-sm-4 d-none d-sm-block">
				<div class="row">
					<div class="col-2">
						<i class="fas fa-user-circle fa-3x"></i>
					</div>
					<div class="col-10">
						Tài khoản của <br> <strong>${user.name }</strong>
					</div>
				</div>
			</div>
			<div class="col-sm-8 col-12 text-center">
				<h4>Đơn hàng của bạn</h4>
			</div>
		</div>
		
		<div class="row">
			<%@include file="/WEB-INF/views/sideNavigationBar.jsp"%>
		
			<div class="col-sm-8 col-12">
	            <ul class="nav nav-tabs nav-justified">
	                <li class="nav-item">
	                  <a class="nav-link <c:if test="${ param.state == null }">active</c:if>" href="${ context }/order/my-order/">Tất cả</a>
	                </li>
	                <li class="nav-item">
	                  <a class="nav-link <c:if test="${ param.state == '1' }">active</c:if>" href="${ context }/order/my-order/filter?state=1">Đang xử lý</a>
	                </li>
	                <li class="nav-item">
	                  <a class="nav-link <c:if test="${ param.state == '2' }">active</c:if>" href="${ context }/order/my-order/filter?state=2">Đã giao hàng</a>
	                </li>
	                <li class="nav-item">
	                  <a class="nav-link <c:if test="${ param.state == '-1' }">active</c:if>" href="${ context }/order/my-order/filter?state=-1">Đã hủy</a>
	                </li>
	            </ul>
	            <div class="table-responsive">
	            	<table class="table">
		            	<thead>
		            		<tr>
		            			<td>Mã đơn</td>
		            			<td>Ngày đặt hàng</td>
		            			<td>Tổng tiền</td>
		            			<td>Trạng thái</td>
		            		</tr>
		            	</thead>
		                <c:forEach var="order" items="${ myOrders }">
		                	<tr>
			                    <td> <a class="link" href="${ context }/order/my-order/${ order._id }">${ order._id }</a> </td>
			                    <td> ${ order.orderDate } </td>
			                    <td> <fmt:formatNumber value="${ order.getTotal() }" type="currency"/> </td>
			                    <td> 
			                    	<c:if test="${ order.state eq -1 }">Đã hủy</c:if> 
			                    	<c:if test="${ order.state eq 1}">Đang xử lý</c:if> 
			                    	<c:if test="${ order.state eq 2 }">Đã giao</c:if> 
		                    	</td>
			                </tr>
		                </c:forEach>
		            </table>
	            </div>
	        </div>
		</div>
	</div>
	
	<%@include file="footer.jsp" %>
</body>
</html>