<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

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
<title>Document</title>
<style>
.thematic_break {
	border-top: 1px solid black;
}

td {
	padding: 5px;
	padding-left: 0;
}

img {
	border: 0.5px solid #C0C0C0;
	border-radius: 5px;
	width: 98px;
	height: 98px;
}

.product-quantity {
	text-align: center;
}
</style>
</head>

<body>
	<%@include file="navigationBar.jsp"%>
	
	<fmt:setLocale value="vi_VN" scope="session"/>
	
	<div class="container-fluid">
		<c:if test="${ cart != null and cart.size() > 0 }">
			<c:set var="total" value="0"></c:set>
			<c:set var="totalDiscount" value="0"></c:set>
			<div class="row p-3">
				<div class="col-sm-6">
					<h5>THÔNG TIN GIỎ HÀNG (${ cart.size() } sản phẩm)</h5>
					<table style="width: 100%">
						<c:forEach var="item" items="${ cart }">
							<c:set var="total" value="${ total + item.product.price * item.quantity }"></c:set>
							<c:set var="totalDiscount" value="${ totalDiscount + item.product.price * item.product.discount * item.quantity }"></c:set>
							<tr>
								<td colspan="4">
									<hr>
								</td>
							</tr>
							<tr>
								<td rowspan="2"><img src="data:image/png;base64,${ item.product.images[0] }" alt="${ item.product.name }"></td>
								<td><a href="/product?${ item.product._id }">${ item.product.name }</a></td>
								<td class="text-danger"><strong><fmt:formatNumber value="${ item.product.price * (1 - item.product.discount)}" type="currency"/> </strong></td>
								<c:if test="${ item.product.discount > 0 }">
									<td class="text-danger"><strong  style="text-decoration: line-through;"><fmt:formatNumber value="${ item.product.price }" type="currency"/> </strong></td>									
								</c:if>
							</tr>
							<tr>
								<td><a href="remove?productId=${ item.product._id }" type="button" class="btn btn-light">Xóa</a></td>
								
								<td></td>
								<td >
									<form action="list" method="post">
										<input name="productId" type="text" value="${ item.product._id }" hidden="hidden">
										<div class="input-group">
											<div class="input-group-append">
										    	<button class="btn btn-secondary" onclick="decreaseQuantity(this)"><i class="fas fa-minus"></i></button>
										  	</div>
										  	<input name="q" type="text" class="form-control text-center" value="${ item.quantity }" style="width: 20px;" >
										  	<div class="input-group-append">
										    	<button class="btn btn-secondary" onclick="increaseQuantity(this)"><i class="fas fa-plus"></i></button>
										  	</div>
										</div>
									</form>
								</td>
							</tr>
							<tr>
								<td colspan="4">
									<hr>
								</td>
							</tr>
						</c:forEach>
					</table> 
					<a href="/home" class="btn btn-outline-danger">Tiếp tục mua sắm</a>
				</div>
				<div class="col-sm-6">
					<h4>TÓM TẮT ĐƠN HÀNG</h4>
					<form action="#">
						<table style="width: 100%">
							<tr>
								<td>TỔNG TIỀN</td>
								<td class="text-right"><fmt:formatNumber value="${ total }" type="currency" /></td>
							</tr>
							<tr>
								<td>GIẢM</td>
								<td class="text-right"><fmt:formatNumber value="${ totalDiscount }" type="currency" /></td>
							</tr>
							<tr>
								<td colspan="2">
									<hr>
								</td>
							</tr>
							<tr>
								<td class="text-uppercase" style="font-size: 1.5em;"><strong>Thành tiền</strong></td>
								<td class="text-right" style="font-size: 1.5em;">
									<strong><fmt:formatNumber value="${ total - totalDiscount }" type="currency" />
									</strong>
								</td>
							</tr>
							<tr>
								<td><br></td>
							</tr>
							<tr>
								<td colspan="2"><button type="button"
										class="text-uppercase btn btn-danger btn-block"
										style="font-size: 1.5em;">tiến hành thanh toán</button></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
	
		</c:if>
		<c:if test="${ cart == null or cart.size() <= 0 }">
			<div class="text-center p-5" style="height: 300px;">
				<h4 class="mb-5">Bạn chưa có sản phẩm nào trong giỏ hàng!</h4>
				<a href="/home" class="btn btn-outline-danger ml-auto mr-auto">Tiếp tục mua sắm</a>
			</div>
		</c:if>
	</div>
	<%@include file="footer.jsp"%>
</body>

</html>