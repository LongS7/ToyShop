<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<div class="container-fluid">
		<div class="row">
			<div class="col">
				<h5>THÔNG TIN ĐƠN HÀNG (4 sản phẩm)</h5>
				<form action="">
					<table style="width: 100%">
						<tr>
							<td colspan="4">
								<hr>
							</td>
						</tr>
						<tr>
							<td rowspan="2"><img src="../images/31204_1.jpg" alt=""></td>
							<td><a href="#">1 x Trạm đỗ xe Ferrari đa chức năng, kèm
									2 xe tỉ lệ 1:43</a></td>
							<td class="text-danger"><strong>999,000 VNĐ</strong></td>
							<td class="product-quantity">
								<button type="button" class="btn btn-light btn-sm">
									<i class="fas fa-plus"></i>
								</button>
								<input type="text" size="1">
							<button type="button" class="btn btn-light btn-sm">
									<i class="fas fa-minus"></i>
								</button>
							</td>
						</tr>
						<tr>
							<td><button type="button" class="btn btn-light">Xóa</button></td>
						</tr>
						<tr>
							<td colspan="4">
								<hr>
							</td>
						</tr>
						<tr>
							<td rowspan="2"><img src="../images/e8721_1.jpg" alt=""></td>
							<td><a href="#">1 x Bé Nana đi tắm</a></td>
							<td class="text-danger"><strong>328,000 VNĐ</strong></td>
							<td class="product-quantity">
								<button type="button" class="btn btn-light btn-sm">
									<i class="fas fa-plus"></i>
								</button> <input type="text" size="1">
								<button type="button" class="btn btn-light btn-sm">
									<i class="fas fa-minus"></i>
								</button>
							</td>
						</tr>
						<tr>
							<td><button type="button" class="btn btn-light">Xóa</button></td>
						</tr>
						<tr>
							<td colspan="4">
								<hr>
							</td>
						</tr>
					</table>
				</form>
				<button class="btn btn-outline-danger">Tiếp tục mua sắm</button>
			</div>
			<div class="col">
				<h4>TÓM TẮT ĐƠN HÀNG</h4>
				<form action="#">
					<table style="width: 100%">
						<tr>
							<td>TỔNG TIỀN</td>
							<td class="text-right">1,327,000 VNĐ</td>
						</tr>
						<tr>
							<td>GIẢM</td>
							<td class="text-right">0 VNĐ</td>
						</tr>
						<tr>
							<td>VẬN CHUYỂN (GIAO HÀNG MIỄN PHÍ - FREE)</td>
							<td class="text-right">0 VNĐ</td>
						</tr>
						<tr>
							<td colspan="2">
								<hr>
							</td>
						</tr>
						<tr>
							<td class="text-uppercase" style="font-size: 1.5em;"><strong>Thành
									tiền</strong></td>
							<td class="text-right" style="font-size: 1.5em;"><strong>1,327,000
									VNĐ</strong></td>
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
	</div>
	<%@include file="footer.jsp"%>
</body>

</html>