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
					<h1 class="h3 mb-2 text-gray-800 row justify-content-center">Thêm/Cập
						nhật sản phẩm</h1>


					<form:form action="#" modelAttribute="product">
						<div class="form-group">
							<form:label path="name">Name:</form:label>
							<form:input type="text" path="name" class="form-control"
								placeholder="Enter name"></form:input>
						</div>
						<div class="form-row">
							<div class="form-group col-md-4">
								<form:label path="price">Price:</form:label>
								<form:input type="text" path="price" class="form-control"
									placeholder="Enter price"></form:input>
							</div>
							<div class="form-group col-md-4">
								<form:label path="sku">Sku:</form:label>
								<form:input type="text" path="sku" class="form-control"
									placeholder="Enter sku"></form:input>
							</div>
							<div class="form-group col-md-4">
								<form:label path="origin">Origin:</form:label>
								<form:input type="text" path="origin" class="form-control"
									placeholder="Enter origin"></form:input>
							</div>
						</div>
						<div class="form-group">
							<form:label path="description">Description:</form:label>
							<form:textarea path="description" class="form-control"
								placeholder="Enter description" rows="3"></form:textarea>
						</div>
						<div class="form-row">
							<div class="form-group col-md-4">
								<form:label path="materials">Materials:</form:label>
								<form:input type="text" path="materials" class="form-control"
									placeholder="Enter materials"></form:input>
							</div>
							<div class="form-group col-md-4">
								<form:label path="discount">Discount:</form:label>
								<form:input type="text" path="discount" class="form-control"
									placeholder="Enter discount"></form:input>
							</div>
					
						</div>


					</form:form>
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



</body>
</html>