<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
</head>
<body>
	<fmt:requestEncoding value="UTF-8" />
	<%@include file="/WEB-INF/views/navigationBar.jsp"%>
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
			<div class="col-8 align-self-center">
				<h4>Sổ địa chỉ</h4>
			</div>
		</div>
		<div class="row">
			<%@ include file="/WEB-INF/views/sideNavigationBar.jsp"%>
			<div class="col-8">
				<div
					class="d-flex justify-content-center border border-success pt-3 pb-3 row">
					<a href="${context }/user/address/create/${user._id}"><i
						class="fas fa-plus"></i> Thêm địa chỉ mới</a>
				</div>
				<c:forEach items="${user.shippingAddresses }" var="address">
					<br>
					<div class="border border-success pt-2 pb-2 row">
						<div class="col-10">Địa chỉ: ${address.street }, ${address.ward }, ${address.district }, ${address.province }</div>
						<div class="col-2"><a href="#">Chỉnh sửa</a></div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>