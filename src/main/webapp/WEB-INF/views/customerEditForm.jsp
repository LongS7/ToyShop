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
	<div class="col-8">
		<form action="">
			<div class="form-group">
				<label class="font-weight-bold" for="">Họ tên:</label> <input
					type="text" class="form-control">
			</div>
			<div class="form-group">
				<label class="font-weight-bold" for="">Số điện thoại:</label> <input
					type="text" class="form-control">
			</div>
			<div class="form-group">
				<label class="font-weight-bold" for="">Email:</label> <input
					type="text" class="form-control">
			</div>
			<label class="font-weight-bold" for="">Giới tính:</label> <br>
			<div class="custom-control custom-radio custom-control-inline">
				<input type="radio" class="custom-control-input" id="customRadio"
					name="example" value="customEx"> <label
					class="custom-control-label" for="customRadio">Nam</label>
			</div>
			<div class="custom-control custom-radio custom-control-inline">
				<input type="radio" class="custom-control-input" id="customRadio2"
					name="example" value="customEx"> <label
					class="custom-control-label" for="customRadio2">Nữ</label>
			</div>
			<div class="form-group">
				<label class="font-weight-bold" for="">Ngày sinh:</label> <input
					type="text" class="form-control">
			</div>
			<div class="custom-control custom-checkbox">
				<input type="checkbox" class="custom-control-input" id="passCheck"
					name="example1" onclick="showChangePassForm()"> <label
					class="custom-control-label" for="passCheck">Thay đổi mật
					khẩu</label>
			</div>
			<div id="changePasswordForm" style="display: none;">
				<br>
				<div class="form-group">
					<label class="font-weight-bold" for="">Mật khẩu cũ:</label> <input
						type="text" class="form-control">
				</div>
				<div class="form-group">
					<label class="font-weight-bold" for="">Mật khẩu mới:</label> <input
						type="text" class="form-control">
				</div>
				<div class="form-group">
					<label class="font-weight-bold" for="">Nhập lại:</label> <input
						type="text" class="form-control">
				</div>
			</div>
			<br>
			<button type="button" class="btn btn-warning">Cập nhật</button>
		</form>
	</div>
</body>
</html>