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
</head>

<body>
	<%@include file="/WEB-INF/views/navigationBar.jsp"%>

	<div class="container pb-5 pt-5 col-lg-4">
		<p>Đăng nhập để mua hàng và sử dụng những tiện ích mới nhất từ
			XShop</p>
		<p>
			Bạn chưa có tài khoản? <a href="register"  class="font-weight-bold">ĐĂNG KÝ TÀI KHOẢN</a>
		</p>
		<form:form method="POST" modelAttribute="user">
			<div class="form-group">
				<form:label path="account.username" class="font-weight-bold">Email <span class="text-danger">*</span></form:label> 
				<form:input class="form-control" id="email" placeholder="Nhập email" name="email" path="account.username"/>
				<form:errors path="account.username" cssClass="error text-danger"/>
			</div>
			<div class="form-group">
				<form:label path="account.password" class="font-weight-bold">Mật khẩu <span class="text-danger">*</span></form:label> <form:input type="password"
					class="form-control" id="pwd" placeholder="Enter password"
					name="password" path="account.password"/>
					<form:errors path="account.password" cssClass="error text-danger"/>
			</div>
			<p>
				Quên mật khẩu? Khôi phục mật khẩu <a href="#">tại đây</a>
			</p>
			<button type="submit" class="btn btn-danger btn-block font-weight-bold">ĐĂNG
				NHẬP</button>
		</form:form>
	</div>
	<%@include file="/WEB-INF/views/footer.jsp" %>
</body>

</html>