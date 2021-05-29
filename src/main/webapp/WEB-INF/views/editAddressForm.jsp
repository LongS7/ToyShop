<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %>
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
				<h4>Chỉnh sửa địa chỉ</h4>
			</div>
		</div>
		<div class="row">
			<%@include file="/WEB-INF/views/sideNavigationBar.jsp"%>
			<div class="col-8">
				<c:if test="${not empty message}">
					<div class="alert alert-success"><i class="fas fa-check-circle"></i> ${message}</div>
				</c:if>
				<form method="POST" action="${context }/user/address/edit/<sec:authentication property="principal.id"/>">
					<input type="hidden" name="province" value="${shippingAddress.province}">
					<input type="hidden" name="district" value="${shippingAddress.district}">
					<input type="hidden" name="ward" value="${shippingAddress.ward}">
					<input type="hidden" name="street" value="${shippingAddress.street}">
					<div class="form-group">
						<label for="newProvince">Tỉnh/Thành phố:</label> <select
							class="form-control" id="newProvince" name="newProvince"
							onchange="renderDistrictData();">
							<option value="${shippingAddress.province}" selected>${shippingAddress.province}</option>
						</select>
					</div>
					<div class="form-group">
						<label for="newDistrict">Quận huyện:</label> <select
							class="form-control" id="newDistrict" name="newDistrict"
							onchange="renderWardData();">
							<option value="${shippingAddress.district}" selected>${shippingAddress.district}</option>
						</select>
					</div>
					<div class="form-group">
						<label for="newWard">Phường xã:</label> <select class="form-control"
							id="newWard" name="newWard">
							<option value="${shippingAddress.ward}" selected>${shippingAddress.ward}</option>
						</select>
					</div>
					<div class="form-group">
						<label for="newStreet">Địa chỉ:</label>
						<textarea class="form-control" rows="4" id="newStreet"
							placeholder="Nhập địa chỉ" name="newStreet" required>${shippingAddress.street}</textarea>
					</div>
					<button type="submit" class="btn btn-warning">Chỉnh sửa</button>
				</form>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/footer.jsp"%>
	<script type="text/javascript">
		async function getAPIData(name) {
			let url;
			if (name == 'newProvince') {
				url = 'https://vapi.vnappmob.com/api/province';
			} else if (name == 'newDistrict') {
				let provinceID = await getID('newDistrict');
				url = 'https://vapi.vnappmob.com/api/province/district/'
						+ provinceID;
			} else {
				let districtID = await getID('newWard');
				url = 'https://vapi.vnappmob.com/api/province/ward/'
						+ districtID;
			}
			try {
				let res = await fetch(url);
				return await res.json();
			} catch (error) {
				console.log(error);
			}
		}

		async function renderProvinceData() {
			let provinces = await getAPIData('newProvince');
			let provinceSelect = document.getElementById('newProvince');
			let i;
			for (i = 0; i < provinces.results.length; i++) {
				let province = document.createElement('option');
				province.text = provinces.results[i].province_name;
				provinceSelect.append(province);
			}
		}

		async function renderDistrictData() {
			removeOptions('newDistrict');
			let districts = await getAPIData('newDistrict');
			let districtSelect = document.getElementById('newDistrict');
			let i;
			placeholderDistrict = document.createElement('option');
			placeholderDistrict.text = "Chọn Quận/Huyện";
			districtSelect.append(placeholderDistrict);
			for (i = 0; i < districts.results.length; i++) {
				let district = document.createElement('option');
				district.text = districts.results[i].district_name;
				districtSelect.append(district);
			}
		}

		async function renderWardData() {
			removeOptions('newWard');
			let wards = await getAPIData('newWard');
			let wardSelect = document.getElementById('newWard');
			let i;
			placeholderWard = document.createElement('option');
			placeholderWard.text = "Chọn Phường/Xã";
			wardSelect.append(placeholderWard);
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
			if (selectID == 'newDistrict') {
				apiData = await getAPIData('newProvince');
				select = document.getElementById('newProvince');
				option = select.options[select.selectedIndex].text;
				for (i = 0; i < apiData.results.length; i++) {
					if (apiData.results[i].province_name == option) {
						id = apiData.results[i].province_id;
						return id;
					}
				}
			} else if (selectID == 'newWard') {
				apiData = await getAPIData('newDistrict');
				select = document.getElementById('newDistrict');
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
			if (selectID == 'newDistrict') {
				select = document.getElementById('newDistrict');
			} else if (selectID == 'newWard') {
				select = document.getElementById('newWard');
			}
			length = select.options.length - 1;
			for (i = length; i >= 0; i--) {
				select.remove(i);
			}
		}
		
		async function renderOldDistrictData() {
			removeOptions('newDistrict');
			let districts = await getAPIData('newDistrict');
			let districtSelect = document.getElementById('newDistrict');
			let i;
			placeholderDistrict = document.createElement('option');
			placeholderDistrict.text = "${shippingAddress.district}";
			districtSelect.append(placeholderDistrict);
			for (i = 0; i < districts.results.length; i++) {
				let district = document.createElement('option');
				district.text = districts.results[i].district_name;
				districtSelect.append(district);
			}
			removeDuplicateOptions('newDistrict', "${shippingAddress.district}");
		}

		async function renderOldWardData() {
			removeOptions('newWard');
			let wards = await getAPIData('newWard');
			let wardSelect = document.getElementById('newWard');
			let i;
			placeholderWard = document.createElement('option');
			placeholderWard.text = "${shippingAddress.ward}";
			wardSelect.append(placeholderWard);
			for (i = 0; i < wards.results.length; i++) {
				let ward = document.createElement('option');
				ward.text = wards.results[i].ward_name;
				wardSelect.append(ward);
			}
			removeDuplicateOptions('newWard', "${shippingAddress.ward}");
		}
		
		function removeDuplicateOptions(selectID, option) {
			let select;
			let length;
			if (selectID == 'newDistrict') {
				select = document.getElementById('newDistrict');
			} else if (selectID == 'newWard') {
				select = document.getElementById('newWard');
			}
			for(var i = select.length-1; i >= 0; i--) {
				if(select.options[i].value == option) {
					select.remove(i);
					break;
				}
			}
		}

		renderProvinceData();
		renderOldDistrictData();
		renderOldWardData();
	</script>
</body>

</html>