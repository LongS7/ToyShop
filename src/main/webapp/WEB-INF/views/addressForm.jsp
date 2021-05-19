<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
						Tài khoản của <br> <strong> <sec:authentication
								property="principal.name" />
						</strong>
					</div>
				</div>
			</div>
			<div class="col-8 align-self-center">
				<h4>Tạo sổ địa chỉ</h4>
			</div>
		</div>
		<div class="row">
			<%@include file="/WEB-INF/views/sideNavigationBar.jsp"%>
			<div class="col-8">
				<c:if test="${not empty message}">
					<div class="alert alert-success"><i class="fas fa-check-circle"></i> ${message}</div>
				</c:if>
				<form method="POST">
					<div class="form-group">
						<label for="province">Tỉnh/Thành phố:</label> <select
							class="form-control" id="province" name="provinceList"
							onchange="renderDistrictData();">
							<option>Chọn Tỉnh/Thành phố</option>
						</select>
					</div>
					<div class="form-group">
						<label for="district">Quận huyện:</label> <select
							class="form-control" id="district" name="districtList"
							onchange="renderWardData();">
							<option>Chọn Quận/Huyện</option>
						</select>
					</div>
					<div class="form-group">
						<label for="ward">Phường xã:</label> <select class="form-control"
							id="ward" name="wardList">
							<option>Chọn Phường/Xã</option>
						</select>
					</div>
					<div class="form-group">
						<label for="street">Địa chỉ:</label>
						<textarea class="form-control" rows="4" id="street"
							placeholder="Nhập địa chỉ" name="street"></textarea>
					</div>
					<button type="submit" class="btn btn-warning">Cập nhật</button>
				</form>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/footer.jsp"%>
	<script type="text/javascript">
		async function getAPIData(name) {
			let url;
			if (name == 'province') {
				url = 'https://vapi.vnappmob.com/api/province';
			} else if (name == 'district') {
				let provinceID = await
				getID('district');
				url = 'https://vapi.vnappmob.com/api/province/district/'
						+ provinceID;
			} else {
				let districtID = await
				getID('ward');
				url = 'https://vapi.vnappmob.com/api/province/ward/'
						+ districtID;
			}
			try {
				let res = await
				fetch(url);
				return await
				res.json();
			} catch (error) {
				console.log(error);
			}
		}

		async function renderProvinceData() {
			let provinces = await
			getAPIData('province');
			let provinceSelect = document.getElementById('province');
			let i;
			for (i = 0; i < provinces.results.length; i++) {
				let province = document.createElement('option');
				province.text = provinces.results[i].province_name;
				provinceSelect.append(province);
			}
		}

		async function renderDistrictData() {
			removeOptions('district');
			let districts = await
			getAPIData('district');
			let districtSelect = document.getElementById('district');
			let i;
			for (i = 0; i < districts.results.length; i++) {
				let district = document.createElement('option');
				district.text = districts.results[i].district_name;
				districtSelect.append(district);
			}
		}

		async function renderWardData() {
			removeOptions('ward');
			let wards = await
			getAPIData('ward');
			let wardSelect = document.getElementById('ward');
			let i;
			for (i = 0; i < wards.results.length; i++) {
				let ward = document.createElement('option');
				ward.text = wards.results[i].ward_name;
				wardSelect.append(ward);
			}
		}

		
		async function getID(selectID) {
			let apiData;
			let select;
			let id;
			let option;
			let i;
			if (selectID == 'district') {
				apiData = await
				getAPIData('province');
				select = document.getElementById('province');
				option = select.options[select.selectedIndex].text;
				for (i = 0; i < apiData.results.length; i++) {
					if (apiData.results[i].province_name == option) {
						id = apiData.results[i].province_id;
						return id;
					}
				}
			} else if (selectID == 'ward') {
				apiData = await
				getAPIData('district');
				select = document.getElementById('district');
				option = select.options[select.selectedIndex].text;
				for (i = 0; i < apiData.results.length; i++) {
					if (apiData.results[i].district_name == option) {
						id = apiData.results[i].district_id;
						return id;
					}
				}
			}
		}

		function removeOptions(selectID) {
			let select;
			let length;
			let i;
			if (selectID == 'district') {
				select = document.getElementById('district');
			} else if (selectID == 'ward') {
				select = document.getElementById('ward');
			}
			length = select.options.length - 1;
			for (i = length; i >= 0; i--) {
				select.remove(i);
			}
		}

		renderProvinceData();
	</script>
</body>

</html>