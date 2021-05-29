<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
<c:set var="context" value="${ pageContext.request.contextPath }" />
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cửa hàng đồ chơi</title>
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
</head>

<body>
	<%@include file="/WEB-INF/views/navigationBar.jsp"%>

	<div class="p-3">
		<div class="row mt-2">
			<div class=" col-lg-8 col-md-8 col-sm-8 col-xs-12"
				style="margin-bottom: 5px; height: 100%;">
				<div id="carouselId" class="carousel slide text-center bg-light"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselId" data-slide-to="0" class="active"></li>
						<li data-target="#carouselId" data-slide-to="1"></li>
						<li data-target="#carouselId" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner" role="listbox">
						<c:forEach var="i" begin="0" end="2">
							<div class="carousel-item <c:if test="${ i == 0 }"> active </c:if> ">
								<a href="${ context }/san-pham/${ bestProduct[i]._id }"><img width="400px"
									src="data:image/png;base64,${bestProduct[i].images[0] }"
									alt="${ bestProduct[i].name }"></a>
							</div>
						</c:forEach>
					</div>
					<a href="#carouselId" class="carousel-control-prev"
						data-slide="prev" style=""> <i class="fa fa-chevron-circle-left fa-3x" style="color: black;"></i> <span class="sr-only"
						aria-hidden="true">Prev</span>
					</a> <a href="#carouselId" class="carousel-control-next"
						data-slide="next"> <i class="fa fa-chevron-circle-right fa-3x" style="color: black;"></i> <span
						class="sr-only" aria-hidden="true">Next</span>
					</a>
				</div>
			</div>
			<div class="danh-muc col-lg-4 col-md-4 col-sm-4 col-xs-12">
				<div class="row">
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 col-6">
						<a href="${ context }/san-pham/?tuoi=1-3-tuoi&page=1&limit=20"> <img src="./resources/images/1.jpeg" />
							<p>1 - 3 tuổi</p>
						</a>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 col-6">
						<a href="${ context }/san-pham/?tuoi=4-6-tuoi&page=1&limit=20"> <img src="./resources/images/2.jpeg" />
							<p>4 - 6 tuổi</p>
						</a>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 col-6">
						<a href="${ context }/san-pham/?tuoi=6-11-tuoi&page=1&limit=20"> <img src="./resources/images/3.jpg" />
							<p>6 - 11 tuổi</p>
						</a>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 col-6">
						<a href="${ context }/san-pham/?tuoi=12-tuoi-tro-len&page=1&limit=20"> <img src="./resources/images/4.jpg" />
							<p>12 tuổi trở lên</p>
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="hot-products">
			<h4>Sản phẩm nổi bật</h4>
			<div class="list-product row">
				<c:forEach var="product" items="${ bestProduct }">
					<%@include file="product.jsp" %>
				</c:forEach>
			</div>
		</div>
		<div class="hot-brands mt-2">
			<h4>Thương hiệu nổi bật</h4>
			<div class="list-brand row">
				<a class="brand col-sm-2 col-4" href="#"> <img
					src="./resources/images/brand-1.png" />
				</a> <a class="brand col-sm-2 col-4" href="#"> <img
					src="./resources/images/brand-2.png" />
				</a> <a class="brand col-sm-2 col-4" href="#"> <img
					src="./resources/images/brand-3.png" />
				</a> <a class="brand col-sm-2 col-4" href="#"> <img
					src="./resources/images/brand-4.png" />
				</a> <a class="brand col-sm-2 col-4" href="#"> <img
					src="./resources/images/brand-5.png" />
				</a> <a class="brand col-sm-2 col-4" href="#"> <img
					src="./resources/images/brand-6.png" />
				</a> <a class="brand col-sm-2 col-4" href="#"> <img
					src="./resources/images/brand-1.png" />
				</a> <a class="brand col-sm-2 col-4" href="#"> <img
					src="./resources/images/brand-2.png" />
				</a> <a class="brand col-sm-2 col-4" href="#"> <img
					src="./resources/images/brand-3.png" />
				</a> <a class="brand col-sm-2 col-4" href="#"> <img
					src="./resources/images/brand-4.png" />
				</a> <a class="brand col-sm-2 col-4" href="#"> <img
					src="./resources/images/brand-5.png" />
				</a> <a class="brand col-sm-2 col-4" href="#"> <img
					src="./resources/images/brand-6.png" />
				</a>
			</div>
		</div>
	</div>

	<%@include file="/WEB-INF/views/footer.jsp"%>
</body>

</html>