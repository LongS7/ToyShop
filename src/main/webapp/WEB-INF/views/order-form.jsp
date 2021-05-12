<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<c:set var="context" value="${ pageContext.request.contextPath }" />
<link rel="shortcut icon" href='<c:url value="/resources/images/favicon.ico" />' type="image/x-icon">
<link rel="icon" href='<c:url value="/resources/images/favicon.ico" />' type="image/x-icon">
<link rel="stylesheet"
	href='<c:url value="/resources/bootstrap-4.5.0-dist/css/bootstrap.min.css"></c:url>'>
<link rel="stylesheet" href="${ context }/resources/css/main.css">
<script src="${ context }/resources/js/cart.js"></script>
<script src="${ context }/resources/js/jquery.min.js"></script>
<script src="${ context }/resources/js/popper.min.js"></script>
<script src="${ context }/resources/bootstrap-4.5.0-dist/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="${ context }/resources/fontawesome-free-5.15.3-web/css/all.css">
<title>Insert title here</title>
</head>
<body>
	<%@include file="navigationBar.jsp" %>
	
	<div class="container mt-5 mb-5">
        <h4 class="text-secondary text-center mb-3">Thông tin đơn hàng</h4>
        <form:form action="add" method="post" modelAttribute="order">
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <span class="input-group-text">Khách hàng</span>
                </div>
                <input type="text" class="form-control text-right" value="Điểu Long" readonly/>
            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <span class="input-group-text">Số điện thoại nhận hàng</span>
                </div>
                <form:input type="text" path="phone" class="form-control text-right" value="0123456789"/>
            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <span class="input-group-text">Tổng tiền đơn hàng</span>
                </div>
                <input type="text" class="form-control text-right" value="1.000.000 đ" readonly>
            </div>
            <label>Địa chỉ giao hàng</label>
            <div style="border: 1px solid rgb(197, 197, 197); padding: 5px; border-radius: 5px;">
                <div class="custom-control custom-radio">
                    <form:radiobutton class="custom-control-input" id="customRadio" path="shippingAddress" name="example" value="customEx"/>
                    <label class="custom-control-label" for="customRadio">A</label>
                </div>
                <div class="custom-control custom-radio">
                    <form:radiobutton class="custom-control-input" id="customRadio2" path="shippingAddress" name="example" value="customEx2"/>
                    <label class="custom-control-label" for="customRadio2">A</label>
                </div>
                <div class="custom-control custom-radio">
                    <form:radiobutton class="custom-control-input" id="customRadio3" path="shippingAddress" name="example" value="customEx3"/>
                    <label class="custom-control-label" for="customRadio3">A</label>
                </div>
                <div class="text-center mt-2">
                    <button class="btn btn-primary" id="btnAddAddress">Thêm địa chỉ mới</button>
                </div>
            </div>
            <div class="input-group mb-3 mt-3">
                <div class="input-group-prepend">
                  <span class="input-group-text">Phương thức thanh toán</span>
                </div>
                <input type="text" class="form-control text-right" value="Tiền mặt" readonly>
            </div>
            <div class="input-group mb-3">
                <input type="submit" class="btn btn-lg btn-danger btn-block text-uppercase" value="Xác nhận đặt hàng">
            </div>
        </form:form>
    </div>

	<%@include file="footer.jsp" %>
</body>
</html>