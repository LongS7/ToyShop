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
<style type="text/css">
.image_container {
	height: 120px;
	width: 200px;
	border-radius: 6px;
	overflow: hidden;
	margin: 10px;
}

.image_container img {
	height: 100%;
	width: auto;
	object-fit: cover;
}

.image_container span {
	top: -6px;
	right: 8px;
	color: red;
	font-size: 28px;
	font-weight: normal;
	cursor: pointer;
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
					<h1 class="h3 mb-2 text-gray-800 row justify-content-center">Thêm/Cập
						nhật sản phẩm</h1>

					<c:url var="saveUrl" value="/admin/manage-products/saveProduct" />

					<form:form action="${saveUrl}" modelAttribute="product"
						class="form" id="form" method="POST">
						<div class="form-group">
							<form:label path="name">Tên sản phẩm:</form:label>
							<form:input type="text" path="name" class="form-control"></form:input>
						</div>
						<div class="form-row">
							<div class="form-group col-md-4">
								<form:label path="price">Giá:</form:label>
								<form:input type="text" path="price" class="form-control"></form:input>
							</div>
							<div class="form-group col-md-4">
								<form:label path="sku">Sku:</form:label>
								<form:input type="text" path="sku" class="form-control"></form:input>
							</div>
							<div class="form-group col-md-4">
								<form:label path="brand._id">Thương hiệu:</form:label>
								<form:select id="inputState" path="brand._id"
									class="form-control">
									<c:forEach var="brand" items="${listBrand}">
										<form:option value="${brand._id}">${brand.name}</form:option>
									</c:forEach>
								</form:select>
							</div>
						</div>

						<div class="form-group">
							<form:label path="description">Mô tả sản phẩm:</form:label>
							<form:textarea path="description" class="form-control" rows="3"></form:textarea>
						</div>

						<div class="form-row">
							<div class="form-group col-md-4">
								<form:label path="materials">Chất liệu:</form:label>
								<form:input type="text" path="materials" class="form-control"></form:input>
							</div>
							<div class="form-group col-md-4">
								<form:label path="discount">Giảm giá:</form:label>
								<form:input type="text" path="discount" class="form-control"
									placeholder="Enter discount"></form:input>
							</div>
							<div class="form-group col-md-4">
								<form:label path="gender">Giới tính:</form:label>
								<form:select id="inputState" path="gender" class="form-control">
									<c:forEach var="gen" items="${listGender}">
										<form:option value="${gen}">${gen}</form:option>
									</c:forEach>
								</form:select>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<form:label path="ages">Tuổi: </form:label>
								<div class="form-check-inline">
									<form:label path="ages" class="form-check-label">
										<form:checkboxes items="${listAge }" path="ages" />
									</form:label>
								</div>
								<form:input type="file" path="images" name="Image" id="image"
									multiple="" class="d-none" onchange="image_select()"></form:input>
								<form:button class="btn btn-sm btn-primary" type="button"
									onclick="document.getElementById('image').click()">Chọn hình ảnh:</form:button>

							</div>
							<div class="form-group col-md-6">
								<form:label path="category">Thể loại:</form:label>
								<form:select id="inputState" path="category._id"
									class="form-control">
									<c:forEach var="cate" items="${listCategory}">
										<form:option value="${cate._id}">${cate.categoryName}</form:option>
									</c:forEach>
								</form:select>
							</div>
						</div>

						<div class="card-body d-flex flex-wrap justify-content-start"
							id="container">
							<!-- image preview -->
						</div>
						<div class="text-center">
							<button type="submit" class="btn btn-primary">Lưu sản
								phẩm</button>
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

	<script type="text/javascript">
	var images = [];
 	  function image_select() {
 	  	  var image = document.getElementById('image').files;
 	  	  for (i = 0; i < image.length; i++) {
 	  	  	  if (check_duplicate(image[i].name)) {
              images.push({
 	  	  	  	    "name" : image[i].name,
 	  	  	  	    "url" : URL.createObjectURL(image[i]),
 	  	  	  	    "file" : image[i],
 	  	  	    })
 	  	  	  } else 
 	  	  	  {
 	  	  	  	 alert(image[i].name + " is already added to the list");
 	  	  	  }
 	  	  }
 	  	  document.getElementById('form').reset();
 	  	  document.getElementById('container').innerHTML = image_show();
 	  }

 	  function image_show() {
 	  	  var image = "";
 	  	  images.forEach((i) => {
 	  	  	 image += `<div class="image_container d-flex justify-content-center position-relative">
 	  	  	  	  <img src="`+ i.url +`" alt="Image">
 	  	  	  	  <span class="position-absolute" onclick="delete_image(`+ images.indexOf(i) +`)">&times;</span>
 	  	  	  </div>`;
 	  	  })
 	  	  return image;
 	  }
 	  function delete_image(e) {
 	  	  images.splice(e, 1);
 	  	  document.getElementById('container').innerHTML = image_show();
 	  }

 	  function check_duplicate(name) {
 	  	var image = true;
 	  	if (images.length > 0) {
 	  		for (e = 0; e < images.length; e++) {
 	  			if (images[e].name == name) {
 	  				image = false;
 	  				break;
 	  			}
 	  		}
 	  	}
 	  	return image;
 	  }

	</script>

</body>
</html>