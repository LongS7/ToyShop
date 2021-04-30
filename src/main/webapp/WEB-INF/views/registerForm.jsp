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
	<div class="container  pb-5 pt-5">
		<h4>ĐĂNG KÝ TÀI KHOẢN CỦA BẠN</h4>
		<form:form action="#" method="POST" modelAttribute="user">
			<div class="form-group">
				<form:label path="name">Họ tên:</form:label>
				<form:input path="name" placeholder="Nhập họ và tên"
					class="form-control" />
			</div>
			<div class="form-group">
				<form:label path="phone">Số điện thoại:</form:label>
				<form:input path="phone" placeholder="Nhập số điện thoại"
					class="form-control" />
			</div>
			<div class="form-group">
				<form:label path="email">Email:</form:label>
				<form:input type="email" path="email" placeholder="Nhập email"
					class="form-control" />
			</div>
			<%-- <div class="form-group">
				<form:label path="password">Mật khẩu:</form:label>
				<form:password path="password"
					placeholder="Mật khẩu từ 6 đến 32 ký tự" />
			</div> --%>
			<form:label path="gender">Giới tính</form:label><br>
			<div class="form-check-inline">
				<form:label path="gender" class="form-check-label">
					<form:radiobutton class="form-check-input" path="gender" value="1" />Nam
				</form:label>
			</div>
			<div class="form-check-inline">
				<form:label path="gender" class="form-check-label">
					<form:radiobutton class="form-check-input" path="gender" value="0" />
				</form:label>
				Nữ
			</div>
			<div class="form-group">
				<form:label path="birthday">Ngày sinh:</form:label>
				<form:input type="date" path="birthday"
					placeholder="Nhập ngày tháng năm sinh" class="form-control" />
			</div>
			<button type="submit" class="btn btn-danger btn-block">Tạo
				tài khoản</button>
		</form:form>
	</div>
	<%@include file="/WEB-INF/views/footer.jsp"%>
</body>

</html>