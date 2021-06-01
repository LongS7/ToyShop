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
	<div class="container pb-5 pt-5">
		<div class="row">
			<div class="col-lg-6">
				<img alt="Lock"
					src="${context }/resources/images/leonie-zettl-0vGohk5aw6E-unsplash.jpg" class="rounded"
					width="100%" height="400px">
			</div>
			<div class="container pb-5 pt-5 col-lg-6">
				<h2 style="text-align: center;">Quên mật khẩu</h2>
				<p style="text-align: center;">Không vấn đề! Nhập email của bạn
					và chúng tôi sẽ gửi bạn một email với hướng dẫn để khôi phục mật
					khẩu của bạn.</p>
				<c:if test="${not empty message }">
					<h6 class="text-success">${message }</h6>
				</c:if>
				<form method="POST">
					<c:if test="${not empty errorMessage }">
						<div style="color: red; font-weight: bold; margin: 10px 0px;">${errorMessage}</div>
					</c:if>
					<div class="form-group">
						<input type="email" class="form-control" id="email"
							placeholder="Nhập địa chỉ email" name="email" required />
					</div>
					<button type="submit"
						class="btn btn-danger btn-block font-weight-bold">Gửi</button>
				</form>
				<br>
				<p style="text-align: center;">
					Quay về <a href="${context }/user/login">Đăng nhập</a>
				</p>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/footer.jsp"%>
</body>

</html>