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
				<img alt="" src="${context }/resources/images/train_toy.jpg" width="100%">
			</div>
			<div class="col-lg-6">
				<p>Đăng nhập để mua hàng và sử dụng những tiện ích mới nhất từ
					XShop</p>
				<p>
					Bạn chưa có tài khoản? <a href="${context }/user/register"
						class="font-weight-bold">ĐĂNG KÝ TÀI KHOẢN</a>
				</p>
				<form method="POST">
					<c:if test="${not empty errorMessage }">
						<div style="color: red; font-weight: bold; margin: 10px 0px;">${errorMessage}</div>
					</c:if>
					<div class="form-group">
						<label class="font-weight-bold" for="username">Email <span
							class="text-danger">*</span></label> <input type="text"
							class="form-control" id="username"
							placeholder="Nhập tên đăng nhập" name="username" />
						<!-- <errors path="username" cssClass="error text-danger"/> -->
					</div>
					<div class="form-group">
						<label class="font-weight-bold" for="password">Mật khẩu <span
							class="text-danger">*</span></label> <input type="password"
							class="form-control" id="password" placeholder="Nhập mật khẩu"
							name="password" />
						<!-- <errors path="password" cssClass="error text-danger"/> -->
					</div>
					<div class="form-group form-check">
						<label class="form-check-label" for="remember_me"> <input
							class="form-check-input" type="checkbox" name="remember-me"
							id="remember_me"> Remember me
						</label>
					</div>
					<!-- <input type="hidden" name="${_csrf.parameterName }"
				value="${_csrf.token }" /> -->
					<p>
						Quên mật khẩu? Khôi phục mật khẩu <a
							href="${context }/user/forgotPassword">tại đây</a>
					</p>
					<button type="submit"
						class="btn btn-danger btn-block font-weight-bold">ĐĂNG
						NHẬP</button>
				</form>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/footer.jsp"%>
</body>

</html>