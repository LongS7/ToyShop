<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>
<c:set var="context" value="${ pageContext.request.contextPath }" />
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<link rel="shortcut icon"
	href='<c:url value="/resources/images/favicon.ico" />'
	type="image/x-icon">
<link rel="icon" href='<c:url value="/resources/images/favicon.ico" />'
	type="image/x-icon">
<link rel="stylesheet"
	href='<c:url value="/resources/bootstrap-4.5.0-dist/css/bootstrap.min.css"></c:url>'>
<link rel="stylesheet" href="${ context }/resources/css/main.css">
<script src="${ context }/resources/js/jquery.min.js"></script>
<script src="${ context }/resources/js/popper.min.js"></script>
<script
	src="${ context }/resources/bootstrap-4.5.0-dist/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="${ context }/resources/fontawesome-free-5.15.3-web/css/all.css">


<!-- me -->
<title>Carousel</title>
<link rel="stylesheet"
	href="${ context }/resources/css/product_detail.css">
<link rel="stylesheet"
	href="${ context }/resources/bootstrap-4.5.0-dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${ context }/resources/css/slider.css" />

<script type="text/javascript"
	src="${ context }/resources/js/product_detail.js"></script>
<script type="text/javascript"
	src="${ context }/resources/bootstrap-4.5.0-dist/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${ context }/resources/bootstrap-4.5.0-dist/js/jquery-3.5.1.slim.min.js"></script>
<script type="text/javascript"
	src="${ context }/resources/bootstrap-4.5.0-dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript"
	src="${ context }/resources/bootstrap-4.5.0-dist/js/popper.min.js"></script>
<script type="text/javascript"
	src="${ context }/resources/bootstrap-4.5.0-dist/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${ context }/resources/bootstrap-4.5.0-dist/js/slick.min.js"></script>
</head>
<body>
	<%@include file="/WEB-INF/views/navigationBar.jsp"%>
	<div class="container-fluid">

		<div class="row">
			<div class="col-12 col-md-5 border border-right-0">
				<div class="carousel slide" id="main-carousel" data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#main-carousel" data-slide-to="0" class="active"></li>
						<li data-target="#main-carousel" data-slide-to="1"></li>
						<li data-target="#main-carousel" data-slide-to="2"></li>
						<li data-target="#main-carousel" data-slide-to="3"></li>
					</ol>
					<!-- /.carousel-indicators -->

					<div class="carousel-inner">
						<div class="carousel-item active">
							<img id="pro-img" class="d-block img-fluid"
								src="data:image/png;base64,${product.images[0] }" alt="">
						</div>
						<c:if test="${fn:length(product.images) gt 1}">
							<c:forEach var = "i" begin = "1" end = "${product.images.size()-1}">
								<div class="carousel-item">
									<img class="d-block img-fluid"
										src="data:image/png;base64,${product.images[i]}"
										alt="">
								</div>
							</c:forEach>
						</c:if>
					</div>
					<!-- /.carousel-inner -->

					<a href="#main-carousel" class="carousel-control-prev"
						data-slide="prev" style=""> <span
						class="carousel-control-prev-icon"
						style="color: red; font-size: 20px;"></span> <span class="sr-only"
						aria-hidden="true">Prev</span>
					</a> <a href="#main-carousel" class="carousel-control-next"
						data-slide="next"> <span
						class="carousel-control-next-icon text-danger"></span> <span
						class="sr-only" aria-hidden="true">Next</span>
					</a>
				</div>
				<!-- /.carousel -->

			</div>
			<div class="col-12 col-md-7 border">
				<div class="">
					<p class="product_name">${product.name}</p>
				</div>
				<div class="">
					<span onmouseover="starmark(this)" onclick="starmark(this)"
						id="1one" style="font-size: 40px; cursor: pointer;"
						class="fa fa-star checked"></span> <span
						onmouseover="starmark(this)" onclick="starmark(this)" id="2one"
						style="font-size: 40px; cursor: pointer;" class="fa fa-star "></span>
					<span onmouseover="starmark(this)" onclick="starmark(this)"
						id="3one" style="font-size: 40px; cursor: pointer;"
						class="fa fa-star "></span> <span onmouseover="starmark(this)"
						onclick="starmark(this)" id="4one"
						style="font-size: 40px; cursor: pointer;" class="fa fa-star"></span>
					<span onmouseover="starmark(this)" onclick="starmark(this)"
						id="5one" style="font-size: 40px; cursor: pointer;"
						class="fa fa-star"></span>
				</div>
				<div class="">
					<p>
						Thuơng hiệu: <a href="#">${product.brand.name}</a>;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<b>SKU </b>${product.sku}
					</p>
				</div>
				<div class="">
					<p id="price">${product.price}VNĐ</p>
				</div>
				<div class="">
					<table style="width: 100%">
						<tr>
							<td><img src="${ context }/resources/images/dollar_32px.png">
								Hàng chính hãng, chứng nhận an toàn</td>
						</tr>
						<tr>
							<td><img src="${ context }/resources/images/buying_32px.png">Miễn
								phí giao hàng toàn quốc đơn trên 400K</td>
						</tr>
						<tr>
							<td><img src="${ context }/resources/images/call_32px.png">Liên
								hệ hỗ trợ: 1900.1208</td>
						</tr>
					</table>
				</div>
				<div class="mt-10">
					<input class="btn btn-light" type="button"
						onclick="dncrementValue()" value="-" /> <input type="text"
						id="number" value="0" size="1" /> <input class="btn btn-light"
						type="button" onclick="incrementValue()" value="+" />
				</div>
				<div class="mt-10">
					<div class="row">
						<div class="col-12 col-md-5">
							<button class="btn btn-md btn-danger col-sm-5 custom-button"
								style="width: 100%;" href="#" role="button">Mua ngay</button>
						</div>
						<div class="col-md-1"></div>
						<div class="col-12 col-md-5">
							<a class="btn btn-md btn-danger col-sm-5 custom-button"
								style="width: 100%;" href="#" role="button">Thêm vào giỏ
								hàng</a>
						</div>
					</div>

				</div>
			</div>
		</div>
		<div class="mt-10">
			<p>
				<b>Mô tả sản phẩm</b>
			</p>
			<p>${product.description}</p>
			<p>
				<b>Thông tin sản phẩm</b>
			</p>
		</div>
		<div class="table-responsive">
			<table class="table">
				<tr>
					<td>Chủ đề</td>
					<td>PP CORE</td>
				</tr>
				<tr>
					<td>Xuất xứ</td>
					<td>${product.origin}</td>
				</tr>
				<tr>
					<td>Ma VT</td>
					<td>${product.sku}</td>
				</tr>
				<tr>
					<td>Thương hiệu</td>
					<td>${product.brand.name}</td>
				</tr>
				<tr>
					<td>Xuất xứ thương hiệu</td>
					<td>Mỹ</td>
				</tr>
				<tr>
					<td>Tuổi</td>
					<td>${product.ages.toString().replace("[", "").replace("]", "")}</td>
				</tr>
				<tr>
					<td>Chất liệu</td>
					<td>${product.materials.toString().replace("[", "").replace("]", "")}</td>
				</tr>
				<tr>
					<td>Giới tính</td>
					<td>${product.gender}</td>
				</tr>
			</table>
		</div>
	</div>

	<%@include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>