<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="context" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Quản lý</title>
<link rel="shortcut icon"
	href='<c:url value="/resources/images/favicon.ico" />'
	type="image/x-icon">
<link rel="icon" href='<c:url value="/resources/images/favicon.ico" />'
	type="image/x-icon">
<!-- Custom fonts for this template-->
<link
	href="${ context }/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">

<!-- Custom styles for this template-->
<link href="${ context }/resources/css/sb-admin-2.min.css"
	rel="stylesheet">
<script>
	function showChangePassForm() {
		var checkbox = document.getElementById('passCheck');
		var form = document.getElementById('changePasswordForm');
		var inputs = document.getElementsByClassName('inputDisabled');
		if (checkbox.checked == true) {
			form.style.display = "block";
			for (var i = 0; i < inputs.length; i++) {
				inputs[i].disabled = false;
			}
		} else {
			form.style.display = "none";
			for (var i = 0; i < inputs.length; i++) {
				inputs[i].disabled = true;
			}
		}
	}
</script>
</head>
<body>
	<div id="wrapper">
		<%@include file="sidebar.jsp"%>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<%@include file="toolbar.jsp"%>

				<!-- Your code here -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">Quản lý người dùng</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
					</div>

					<!-- Content Row -->
					<div class="row">

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-primary text-uppercase mb-1">
												Số lượng người dùng</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${ totalUser }
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-users fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-success shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-success text-uppercase mb-1">
												Số lượng nam giới</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">
												${totalMaleUser }</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-mars fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-info shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-warning text-uppercase mb-1">
												Số lượng nữ giới</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${ totalFemaleUser }
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-venus fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-danger shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-danger text-uppercase mb-1">
												Người dùng chưa mua hàng</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">${ totalUserNotOrder }
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-user-tag fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Content Row -->
					<div class="row">
						<div class="col-xl-12 col-lg-12">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">Thông tin
										người dùng</h6>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<form:form method="POST" modelAttribute="user"
										action="${context }/admin/manage-users/edit">
										<div class="row">
											<div class="col-xl-6 col-lg-6">
												<div class="form-group">
													<form:label class="font-weight-bold" path="name">Họ tên:
													</form:label>
													<form:input class="form-control" path="name"
														value="${user.name}" />
													<form:errors path="name" cssClass="error text-danger" />
												</div>
												<div class="form-group">
													<form:label class="font-weight-bold" path="phone">Số điện thoại:
													</form:label>
													<form:input class="form-control" path="phone"
														value="${user.phone }" />
													<p><form:errors path="phone" cssClass="error text-danger" /></p>
												</div>
												<div class="form-group">
													<form:label class="font-weight-bold" path="email">Email:
													</form:label>
													<form:input class="form-control" path="email"
														value="${user.email }" readonly="true" />
													<p><form:errors path="email" cssClass="error text-danger" /></p>
												</div>
												<form:label class="font-weight-bold" path="gender">Giới tính:
												</form:label>
												<br>
												<div
													class="custom-control custom-radio custom-control-inline">
													<form:radiobutton path="gender" value="1"
														class="custom-control-input" id="male" name="gender" />
													<form:label path="gender" class="custom-control-label"
														for="male">
														Nam
													</form:label>
												</div>
												<div
													class="custom-control custom-radio custom-control-inline">
													<form:radiobutton path="gender" value="0"
														class="custom-control-input" id="female" name="gender" />
													<form:label path="gender" class="custom-control-label"
														for="female">
														Nữ
													</form:label>
												</div>
												<br>
												<form:label class="font-weight-bold" path="birthday">Ngày sinh:
													</form:label>
												<form:input type="date" class="form-control" path="birthday"
													value="${user.birthday }" />
												<form:errors path="birthday" cssClass="error text-danger" />
											</div>
											<div class="col-xl-6 col-lg-6">
												<div class="form-group">
													<form:label class="font-weight-bold"
														path="account.username">Tên
														đăng nhập:</form:label>
													<form:input class="form-control" path="account.username"
														value="${user.account.username}" readonly="true" />
													<form:errors path="account.username"
														cssClass="error text-danger" />
												</div>
												<label class="font-weight-bold" style="display: block">Chọn
													"Thay đổi mật khẩu" để đổi mật khẩu</label>
												<div class="custom-control custom-checkbox">
													<input type="checkbox" class="custom-control-input"
														id="passCheck" name="passwordForm"
														onclick="showChangePassForm()"> <label
														class="custom-control-label" for="passCheck">Thay
														đổi mật khẩu</label>
												</div>
												<div id="changePasswordForm" style="display: none;">
													<div class="form-group">
														<label class="font-weight-bold" for="oldPassword">Mật
															khẩu cũ:</label> <input type="password" name="oldPassword"
															id="oldPassword" class="form-control inputDisabled"
															disabled>
													</div>
													<div class="form-group">
														<label class="font-weight-bold" for="newPassword">Mật
															khẩu mới:</label> <input type="password"
															class="form-control inputDisabled" name="newPassword"
															id="newPassword" disabled>
													</div>
													<div class="form-group">
														<label class="font-weight-bold" for="reNewPassword">Nhập
															lại:</label> <input type="password"
															class="form-control inputDisabled" name="reNewPassword"
															id="reNewPassword" disabled>
													</div>
													<form:input path="account.password"
														value="${user.account.password }" type="hidden" />
													<form:input path="role" value="${user.role }" type="hidden" />
												</div>
											</div>
										</div>
										<br>
										<div class="row">
											<div class="col-xl-12 col-lg-12" style="text-align: center">
												<button type="submit" class="btn btn-outline-warning"
													style="width: 25%">Cập nhật</button>
												<c:if test="${not empty errorMessage }">
													<p class="text-danger font-italic">${errorMessage }</p>
												</c:if>
												<c:if test="${not empty successMessage }">
													<p class="text-success font-italic">${successMessage }</p>
												</c:if>
											</div>
										</div>
									</form:form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- End of Main Content -->

			<%@include file="footer.jsp"%>
		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<%@include file="end.jsp"%>
</body>
</html>