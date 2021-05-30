<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<fmt:setLocale value="vi_VN"/>
	<%@include file="/WEB-INF/views/navigationBar.jsp"%>
	<div class="container-fluid">

		<div class="row">
			<div class="col-12 col-md-4 border border-right-0">
				<div class="carousel slide" id="main-carousel" data-ride="carousel">
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
						data-slide="prev" style=""> <i class="fa fa-chevron-circle-left fa-3x" style="color: black;"></i> <span class="sr-only"
						aria-hidden="true">Prev</span>
					</a> <a href="#main-carousel" class="carousel-control-next"
						data-slide="next"> <i class="fa fa-chevron-circle-right fa-3x" style="color: black;"></i> <span
						class="sr-only" aria-hidden="true">Next</span>
					</a>
				</div>
				<!-- /.carousel -->

			</div>
			<div class="col-12 col-md-8 border p-3">
				<div class="">
					<p class="product_name h4">${product.name}</p>
				</div>
				<div class="">
					<c:set var="rating" value="${ product.getRating() }"/>
					<span class="fa fa-star <c:if test="${ rating >= 1 }">checked</c:if> "></span>
					<span class="fa fa-star <c:if test="${ rating >= 2 }">checked</c:if> "></span>
					<span class="fa fa-star <c:if test="${ rating >= 3 }">checked</c:if> "></span>
					<span class="fa fa-star <c:if test="${ rating >= 4 }">checked</c:if> "></span>
					<span class="fa fa-star <c:if test="${ rating >= 5 }">checked</c:if> "></span>
				</div>
				<div class="">
					<p>
						Thuơng hiệu: <a href="#">${product.brand.name}</a>;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<b>SKU </b>${product.sku}
					</p>
				</div>
				<div class="">
					<p id="price"> <fmt:formatNumber value="${product.price}" type="currency" /> </p>
				</div>
				<div class="">
					<table class="table">
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
				<form class="form-inline mt-10" action="${ context }/mycart/add" method="get">
					<input type="hidden" name="productId" value="${ product._id }">
					<div class="mt-10" style="width: 150px;">
						<div class="input-group">
							<div class="input-group-append">
						    	<button onclick="return dncrementValue()" class="btn btn-secondary"><i class="fas fa-minus"></i></button>
						  	</div>
						  	<input id="number" name="q" type="text" class="form-control text-center" value="1" style="width: 20px;" >
						  	<div class="input-group-append">
						    	<button onclick="return incrementValue()" class="btn btn-secondary"><i class="fas fa-plus"></i></button>
						  	</div>
						</div>
					</div>
					<div class="mt-10 ml-auto">
						<div class="col-12 col-md-5">
							<button type="submit" class="btn btn-md btn-danger col-sm-5 custom-button"
								style="width: 100%;">Thêm vào giỏ hàng</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="mt-10 pl-5 pr-5">
			<p>
				<b>Mô tả sản phẩm</b>
			</p>
			<p style="text-align: justify;">${product.description}</p>
		</div>
		<div class="pl-5 pr-5">
			<p>
				<b>Thông tin sản phẩm</b>
			</p>
			<div class="table-responsive">
				<table class="table table-hover">
					<tr>
						<td>Chủ đề</td>
						<td>PP CORE</td>
					</tr>
					<tr>
						<td>Xuất xứ</td>
						<td>${product.brand.origin}</td>
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
		<div class="comments p-5">
			<div class="h5"> Nhận xét từ khách hàng (${ product.comments.size() }) </div>
			<hr>
			<c:forEach var="comment" items="${ product.comments }">
				<div class="row comment">
					<div class="col-sm-4">
						<div class="row">
							<div class="col-2">
								<i class="fas fa-user-circle fa-3x text-secondary"></i>
							</div>
							<div class="col-9 ml-auto mt-auto mb-auto">
								<strong>${ comment.user.name }</strong>
								<p> 
									${ comment.date.toLocalDate() } ${ comment.date.toLocalTime() }
								</p>
							</div>
						</div>
					</div>
					<div class="col-sm-8 p-2">
						<span class="fa fa-star <c:if test="${ comment.rate >= 1 }">checked</c:if> "></span>
						<span class="fa fa-star <c:if test="${ comment.rate >= 2 }">checked</c:if> "></span>
						<span class="fa fa-star <c:if test="${ comment.rate >= 3 }">checked</c:if> "></span>
						<span class="fa fa-star <c:if test="${ comment.rate >= 4 }">checked</c:if> "></span>
						<span class="fa fa-star <c:if test="${ comment.rate >= 5 }">checked</c:if> "></span> - 
						<c:if test="${ comment.rate == 1 }"> <c:set var="rv" value="Quá tệ"/></c:if>
						<c:if test="${ comment.rate == 2 }"> <c:set var="rv" value="Tệ"/></c:if>
						<c:if test="${ comment.rate == 3 }"> <c:set var="rv" value="Bình thường"/></c:if>
						<c:if test="${ comment.rate == 4 }"> <c:set var="rv" value="Hài lòng"/></c:if>
						<c:if test="${ comment.rate == 5 }"> <c:set var="rv" value="Cực kì hài hòng"/></c:if>
						<span> ${ rv } </span>
						<div class="mt-3" style="text-align: justify;">
							${ comment.content }
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	
	</div>

	<%@include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>