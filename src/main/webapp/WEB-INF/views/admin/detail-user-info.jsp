<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions"%>
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
						<div class="col-xl-6 col-lg-6">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">Thông tin
										người dùng</h6>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="row">
										<div class="col-xl-6 col-lg-6">
										<p>
											<strong>Họ tên:</strong>
										</p>
										<p>${user.name }</p>
										<p>
											<strong>Số điện thoại:</strong>
										</p>
										<p>${user.phone }</p>
										<p>
											<strong>Email:</strong>
										</p>
										<p>${user.email }</p>
									</div>
									<div class="col-xl-6 col-lg-6">
										<p>
											<strong>Tên đăng nhập:</strong>
										</p>
										<p>${user.account.username }</p>
										<p>
											<strong>Giới tính:</strong>
										</p>
										<p>
											<c:choose>
												<c:when test="${user.gender == '0'}">
																Nữ
															</c:when>
												<c:otherwise>
																Nam
															</c:otherwise>
											</c:choose>
										</p>
										<p>
											<strong>Ngày sinh:</strong>
										</p>
										<p>${user.birthday }</p>
									</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-xl-6 col-lg-6">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">Thông tin
										địa chỉ</h6>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<c:forEach items="${user.shippingAddresses }"
										var="shippingAddress" varStatus="loop">
										<div class="border border-info rounded-lg p-2">
											<h6>Địa chỉ thứ ${loop.index + 1}</h6>
											<p>Địa chỉ: ${shippingAddress.street },
												${shippingAddress.ward }, ${shippingAddress.district },
												${shippingAddress.province }</p>
										</div>
									</c:forEach>
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