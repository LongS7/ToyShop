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
<title>Đăng ký tài khoản</title>
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
		<div class="row">
			<div class="col-lg-6">
				<img alt="Toy" src="${context }/resources/images/baby-natur-Hld-gd-WN7k-unsplash.jpg" width="100%" height="100%" class="rounded">
			</div>
			<div class="col-lg-6">
				<h4>ĐĂNG KÝ TÀI KHOẢN CỦA BẠN</h4>
				<c:if test="${not empty result }">
					<div class="alert alert-success">
						<i class="fas fa-exclamation-circle"></i> ${result }
					</div>
				</c:if>
				<form:form method="POST" modelAttribute="user">
					<div class="form-group">
						<form:label path="name" class="font-weight-bold">Họ tên <span
								class="text-danger">*</span>
						</form:label>
						<form:input path="name" placeholder="Nhập họ và tên"
							class="form-control" />
						<form:errors path="name" cssClass="error text-danger" />
					</div>
					<div class="form-group">
						<form:label path="phone" class="font-weight-bold">Số điện thoại <span
								class="text-danger">*</span>
						</form:label>
						<form:input path="phone" placeholder="Nhập số điện thoại"
							class="form-control" />
						<form:errors path="phone" cssClass="error text-danger" />
					</div>
					<div class="form-group">
						<form:label path="email" class="font-weight-bold">Email <span
								class="text-danger">*</span>
						</form:label>
						<form:input path="email" placeholder="Nhập email"
							class="form-control" />
						<form:errors path="email" cssClass="error text-danger" />
						<c:if test="${not empty emailError }">
							<p class="text-danger">
								<i>${emailError }</i>
							</p>
						</c:if>
					</div>
					<div class="form-group">
						<form:label path="account.username" class="font-weight-bold">Tên đăng nhập <span
								class="text-danger">*</span>
						</form:label>
						<form:input path="account.username" class="form-control"
							placeholder="Tên đăng nhập từ 3 đến 16 ký tự" />
						<c:if test="${not empty usernameError }">
							<p class="text-danger">
								<i>${usernameError }</i>
							</p>
						</c:if>
					</div>
					<div class="form-group">
						<form:label path="account.password" class="font-weight-bold">Mật khẩu <span
								class="text-danger">*</span>
						</form:label>
						<form:password path="account.password" class="form-control"
							placeholder="Mật khẩu từ 6 đến 32 ký tự" />
						<form:errors path="account.password" cssClass="error text-danger" />
					</div>
					<form:label path="gender" class="font-weight-bold">Giới tính <span
							class="text-danger">*</span>
					</form:label>
					<br>
					<div class="custom-control custom-radio custom-control-inline">
						<form:radiobutton path="gender" value="1" id="male" name="gender"
							class="custom-control-input" />
						<label class="custom-control-label" for="male">Nam</label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<form:radiobutton path="gender" value="0" id="female"
							name="gender" class="custom-control-input" />
						<label class="custom-control-label" for="female">Nữ</label>
					</div>
					<div class="form-group">
						<form:label path="birthday" class="font-weight-bold">Ngày sinh <span
								class="text-danger">*</span>
						</form:label>
						<form:input type="date" path="birthday"
							placeholder="Nhập ngày tháng năm sinh" class="form-control" />
						<form:errors path="birthday" cssClass="error text-danger" />
					</div>
					<form:hidden path="role" value="ROLE_USER"/>
					<button type="submit"
						class="btn btn-danger btn-block font-weight-bold">ĐĂNG KÝ</button>
				</form:form>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/footer.jsp"%>
</body>

</html>