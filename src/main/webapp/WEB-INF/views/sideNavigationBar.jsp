<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

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
<style>
i {
	margin: auto 10px;
}
</style>
<script>
        $(document).ready(function () {
            $("#myTab a").click(function (e) {
                e.preventDefault();
                $(this).tab('show');
            });
        });
    </script>
</head>

<body>
	<ul class="nav flex-column nav-pills col-3" id="myTab">
		<li class="nav-item"><a class="nav-link" href="#1"><i
				class="fas fa-user fa-fw"></i> Thông tin tài khoản</a></li>
		<li class="nav-item"><a class="nav-link" href="#2"><i
				class="fas fa-bell fa-fw"></i> Thông báo của tôi</a></li>
		<li class="nav-item"><a class="nav-link" href=""><i
				class="fas fa-file-invoice-dollar fa-fw"></i> Quản lý đơn hàng</a></li>
		<li class="nav-item"><a class="nav-link" href=""><i
				class="fas fa-map-marker-alt fa-fw"></i> Sổ địa chỉ</a></li>
		<li class="nav-item"><a class="nav-link" href=""><i
				class="far fa-credit-card fa-fw"></i> Thông tin thanh toán</a></li>
		<li class="nav-item"><a class="nav-link" href=""><i
				class="fas fa-edit fa-fw"></i> Nhận xét sản phẩm đã mua</a></li>
		<li class="nav-item"><a class="nav-link" href=""><i
				class="fas fa-heart fa-fw"></i> Sản phẩm yêu thích</a></li>
		<li class="nav-item"><a class="nav-link" href=""><i
				class="fas fa-star fa-fw"></i> Nhận xét của tôi</a></li>
		<li class="nav-item"><a class="nav-link" href=""><i
				class="fas fa-tag fa-fw"></i> Mã giảm giá</a></li>
	</ul>
</body>

</html>