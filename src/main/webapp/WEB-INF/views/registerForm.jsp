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
	<div class="container  pb-5 pt-5 col-lg-4">
		<h4>ĐĂNG KÝ TÀI KHOẢN CỦA BẠN</h4>
		<form:form method="POST" modelAttribute="user">
			<div class="form-group">
				<form:label path="name" class="font-weight-bold">Họ tên <span class="text-danger">*</span></form:label>
				<form:input path="name" placeholder="Nhập họ và tên"
					class="form-control" />
				<form:errors path="name" cssClass="error text-danger"/>
			</div>
			<div class="form-group">
				<form:label path="phone" class="font-weight-bold">Số điện thoại <span class="text-danger">*</span></form:label>
				<form:input path="phone" placeholder="Nhập số điện thoại"
					class="form-control" />
				<form:errors path="phone" cssClass="error text-danger"/>
			</div>
			<div class="form-group">
				<form:label path="email" class="font-weight-bold">Email <span class="text-danger">*</span></form:label>
				<form:input path="email" placeholder="Nhập email"
					class="form-control" />
				<form:errors path="email" cssClass="error text-danger"/>
			</div>
			<div class="form-group">
				<form:label path="account.password" class="font-weight-bold">Mật khẩu <span class="text-danger">*</span></form:label>
				<form:password path="account.password" class="form-control"
					placeholder="Mật khẩu từ 6 đến 32 ký tự" />
				<form:errors path="account.password" cssClass="error text-danger"/>
			</div>
			<div class="form-group">
				<form:label path="gender" class="font-weight-bold">Giới tính <span class="text-danger">*</span></form:label>
				<form:select path="gender" class="form-control">
					<form:option value="1">Nam</form:option>
					<form:option value="0">Nữ</form:option>
				</form:select>
			</div>
			<div class="form-group">
				<form:label path="birthday" class="font-weight-bold">Ngày sinh <span class="text-danger">*</span></form:label>
				<form:input type="date" path="birthday"
					placeholder="Nhập ngày tháng năm sinh" class="form-control" />
				<form:errors path="birthday" cssClass="error text-danger" />
			</div>
			<form:hidden path="role" value="Khách hàng" />
			<button type="submit" class="btn btn-danger btn-block font-weight-bold">ĐĂNG KÝ</button>
		</form:form>
	</div>
	<%@include file="/WEB-INF/views/footer.jsp"%>
</body>

</html>