<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
<style type="text/css">
</style>
<script>
	function showChangePassForm() {
		var checkbox = document.getElementById('passCheck');
		var form = document.getElementById('changePasswordForm');
		if (checkbox.checked == true) {
			form.style.display = "block";
		} else {
			form.style.display = "none";
		}
	}
</script>
</head>
<body>
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
				<h4>Thông tin tài khoản</h4>
			</div>
		</div>
		<div class="row">
			<%@include file="/WEB-INF/views/sideNavigationBar.jsp"%>
			<div class="col-8">
				<form:form method="POST" modelAttribute="user">
					<div class="form-group">
						<form:label class="font-weight-bold" path="name">Họ tên:</form:label>
						<form:input class="form-control" path="name" value="${user.name}" />
						<form:errors path="name" cssClass="error text-danger" />
					</div>
					<div class="form-group">
						<form:label class="font-weight-bold" path="phone">Số điện thoại:</form:label>
						<form:input class="form-control" path="phone"
							value="${user.phone }" />
						<form:errors path="phone" cssClass="error text-danger" />
					</div>
					<div class="form-group">
						<form:label class="font-weight-bold" path="email">Email:</form:label>
						<form:input class="form-control" path="email"
							value="${user.email }" />
						<form:errors path="email" cssClass="error text-danger" />
					</div>
					<form:label class="font-weight-bold" path="gender">Giới tính:</form:label>
					<br>
					<div class="custom-control custom-radio custom-control-inline">
						<form:radiobutton path="gender" value="1"
							class="custom-control-input" id="male" name="gender" />
						<form:label path="gender" class="custom-control-label" for="male">Nam</form:label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<form:radiobutton path="gender" value="0"
							class="custom-control-input" id="female" name="gender" />
						<form:label path="gender" class="custom-control-label"
							for="female">Nữ</form:label>
					</div>
					<div class="form-group">
						<form:label class="font-weight-bold" path="birthday">Ngày sinh:</form:label>
						<form:input type="date" class="form-control" path="birthday"
							value="${user.birthday }" />
						<form:errors path="birthday" cssClass="error text-danger" />
					</div>
					<h6>${result.message}</h6>
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="passCheck"
							name="passwordForm" onclick="showChangePassForm()"> <label
							class="custom-control-label" for="passCheck">Thay đổi mật
							khẩu</label>
					</div>
					<div id="changePasswordForm" style="display: none;">
						<br>
						<div class="form-group">
							<form:label class="font-weight-bold" path="account.password">Mật khẩu cũ:</form:label>
							<form:password path="account.password" class="form-control" />
							<form:errors path="account.password" cssClass="error text-danger" />
						</div>
						<div class="form-group">
							<label class="font-weight-bold" for="newPassword">Mật
								khẩu mới:</label> <input type="password" class="form-control"
								name="newPassword" id="newPassword">
						</div>
						<div class="form-group">
							<label class="font-weight-bold" for="reNewPassword">Nhập
								lại:</label> <input type="password" class="form-control"
								name="reNewPassword" id="reNewPassword">
						</div>
					</div>
					<br>
					<button type="submit" class="btn btn-warning">Cập nhật</button>
				</form:form>
			</div>
		</div>
	</div>

	<%@include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>