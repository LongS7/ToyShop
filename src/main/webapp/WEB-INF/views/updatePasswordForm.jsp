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
		<h2 style="text-align: center;">Tạo mật khẩu mới</h2>
		<p style="text-align: center;">Vui lòng nhập mật khẩu mới ở bên
			dưới.</p>
		<c:if test="${not empty message }">
			<h6 class="text-success">${message }</h6>
		</c:if>
		<form:form method="POST" action="savePassword"
			modelAttribute="passwordDto">
			<c:if test="${not empty errorMessage }">
				<div style="color: red; font-weight: bold; margin: 10px 0px;">${errorMessage}</div>
			</c:if>
			<div class="form-group">
				<form:password path="newPassword" class="form-control" placeholder="Nhập mật khẩu mới"/>
				<form:errors path="newPassword" cssClass="error text-danger" />
			</div>
			<div class="form-group">
				<input type="password" name="reNewPassword" class="form-control" placeholder="Nhập lại mật khẩu mới"
					required>
			</div>
			<form:hidden path="token" />
			<button type="submit"
				class="btn btn-danger btn-block font-weight-bold">Cập nhật
				mật khẩu</button>
		</form:form>
	</div>
	<%@include file="/WEB-INF/views/footer.jsp"%>
</body>

</html>