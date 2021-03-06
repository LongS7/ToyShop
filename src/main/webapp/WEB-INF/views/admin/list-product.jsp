<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="context" value="${ pageContext.request.contextPath }" />
<c:set var="formAction" value="${ context }/admin/manage-products/" />
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
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css">
<style>
div.dataTables_wrapper {
	width: 1000px;
	margin: 0 auto;
}
</style>
</head>

<body>
	<fmt:setLocale value="vi_VN" scope="session" />
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
					<h1 class="h3 mb-2 text-gray-800 row justify-content-center">Danh
						sách sản phẩm</h1>

					<div class="row">
						<div class="col-xl-12 col-lg-12">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">Danh sách sản phẩm</h6>
								</div>
								<!-- Card Body -->
								<div class="card-body">
										<table id="example" class="table table-hover">
											<thead class="thead-light">
												<tr>
													<th>#</th>
													<th>Tên sản phẩm</th>
													<th>Sku</th>
													<th>Giá</th>
													<th colspan="" style="min-width: 280px;text-align: center;">Hành động</th>
					
												</tr>
					
											</thead>
											<tbody>
												<c:forEach var="product" items="${products }" varStatus="stt">
													<c:url var="editUrl" value="/admin/manage-products/edit">
														<c:param name="productId" value="${product._id}" />
													</c:url>
													<c:url var="deleteUrl" value="/admin/manage-products/delete">
														<c:param name="productId" value="${product._id}" />
													</c:url>
													<c:url var="viewUrl" value="/admin/manage-products/view">
														<c:param name="productId" value="${product._id}" />
													</c:url>
													<tr>
														<td>${stt.index + 1}</td>
														<td>${product.name}</td>
														<td>${product.sku}</td>
														<td>${product.price}</td>
									
														<td>
															<a href="${editUrl}"><button type="button"
																	class="btn btn-outline-info" data-toggle="modal"
																	data-target="#editUserInfoModal">Cập nhật</button></a> 
															&nbsp;
															<a href="${viewUrl}"><button type="button" class="btn btn-outline-success"
																data-toggle="modal" data-target="#detailUserInfoModal">Xem
																chi tiết</button></a>
															&nbsp;
															<a href="${deleteUrl}"><button type="button"
																	class="btn btn-outline-danger" data-toggle="modal"
																	data-target="#deleteUserInfoModal">Xóa</button></a> 
														</td>
															
													</tr>
												</c:forEach>
					
											</tbody>
										</table>
								</div>
							</div>
						</div>
					</div>

				</div>
				<!-- /.container-fluid -->


			</div>
			<!-- End of Main Content -->


			<%@include file="footer.jsp"%>

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<%@include file="end.jsp"%>

	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#example').DataTable({
				"scrollY" : 450,
				"scrollX" : true
			});
		});
	</script>

</body>
</html>