<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
					<h1 class="h3 mb-2 text-gray-800 row justify-content-center">Chi tiết sản phẩm</h1>

				<div class="table-responsive">
				<table class="table table-hover">
					<tr>
						<th>Tên sản phẩm</th>
						<td>${product.name}</td>
					</tr>
					<tr>
						<th>Giá</th>
						<td><fmt:formatNumber value="${product.price}" type="currency" /></td>
					</tr>
					<tr>
						<th>Mô tả sản phẩm</th>
						<td>${product.description}</td>
					</tr>
					<tr>
						<th>Xuất xứ</th>
						<td>${product.brand.origin}</td>
					</tr>
					<tr>
						<th>Sku</th>
						<td>${product.sku}</td>
					</tr>
					<tr>
						<th>Thương hiệu</th>
						<td>${product.brand.name}</td>
					</tr>
					<tr>
						<th>Xuất xứ thương hiệu</th>
						<td>Mỹ</td>
					</tr>
					<tr>
						<th>Tuổi</th>
						<td>${product.ages.toString().replace("[", "").replace("]", "")}</td>
					</tr>
					<tr>
						<th>Chất liệu</th>
						<td>${product.materials.toString().replace("[", "").replace("]", "")}</td>
					</tr>
					<tr>
						<th>Giới tính</th>
						<td>${product.gender}</td>
					</tr>
					<tr>
						<th>Hình ảnh</th>
						<c:if test="${fn:length(product.images) gt 0}">
							<c:forEach items="${product.images}" var="image">
								<td>
								
									<img src="data:image/png;base64,${image}" alt=""/>
								
									
								</td>
							</c:forEach>
						</c:if>
					</tr>
				</table>
				
			</div>
					
					<div class="row justify-content-center">
						<a class="justify-content-center" href="${context}/admin/manage-products/list"><button type="button" class="btn btn-primary row">Danh sách sản phẩm</button></a>
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