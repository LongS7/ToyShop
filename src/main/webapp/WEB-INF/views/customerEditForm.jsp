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
	<div class="col-sm-8 col-12">
		<form:form action="" modelAttribute="user">
			<div class="form-group">
				<form:label class="font-weight-bold" path="name">Họ tên:</form:label> <form:input
					type="text" class="form-control" path="name" value="${user.name}"/>
			</div>
			<div class="form-group">
				<form:label class="font-weight-bold" path="phone">Số điện thoại:</form:label> <form:input
					type="text" class="form-control" path="phone" value="${user.phone }"/>
			</div>
			<div class="form-group">
				<form:label class="font-weight-bold" path="email">Email:</form:label> <form:input
					type="text" class="form-control" path="email" value="${user.email }"/>
			</div>
			<form:label class="font-weight-bold" path="gender">Giới tính:</form:label> <br>
			<div class="custom-control custom-radio custom-control-inline">
				<form:radiobutton path="gender" value="1" class="custom-control-input" id="gender" name="male"/>
				<form:label path="gender" class="custom-control-label" id="gender">Nam</form:label>
			</div>
			<div class="custom-control custom-radio custom-control-inline">
				<form:radiobutton path="gender" value="0" class="custom-control-input" id="gender" name="female"/>
				<form:label path="gender" class="custom-control-label" id="gender">Nữ</form:label>
			</div>
			<div class="form-group">
				<form:label class="font-weight-bold" path="birthday">Ngày sinh:</form:label> <form:input
					type="date" class="form-control" path="birthday" value="${user.birthday }"/>
			</div>
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
					<form:password path="account.password" class="form-control" name="password"/>
				</div>
				<div class="form-group">
					<label class="font-weight-bold" for="newPassword">Mật khẩu mới:</label> <input
						type="password" class="form-control" name="newPassword" id="newPassword">
				</div>
				<div class="form-group">
					<label class="font-weight-bold" for="reNewPassword">Nhập lại:</label> <input
						type="password" class="form-control" name="reNewPassword" id="reNewPassword">
				</div>
			</div>
			<br>
			<button type="button" class="btn btn-warning">Cập nhật</button>
		</form:form>
	</div>
</body>
</html>