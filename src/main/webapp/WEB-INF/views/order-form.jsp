<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8"/>
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
<title> Tạo đơn hàng mới </title>
</head>
<body>
	<%@include file="navigationBar.jsp" %>
	<fmt:setLocale value="vi_VN" scope="session"/>
	
	<div class="container mt-5 mb-5">
        <h4 class="text-secondary text-center mb-3">Thông tin đơn hàng</h4>
        <form:form action="add" method="post" modelAttribute="order">
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <span class="input-group-text">Khách hàng</span>
                </div>
                <input type="text" class="form-control text-right" value="${ order.user.name }" readonly/>
            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <span class="input-group-text">Số điện thoại nhận hàng</span>
                </div>
                <form:input type="text" path="phone" class="form-control text-right" readonly="true" />
            </div>
            <div class="w-100">
           		<label>Địa chỉ giao hàng</label> <c:if test="${ param.message == -1 }"><span class="error"> Vui lòng thêm địa chỉ mới </span></c:if>
           		<a class="btn btn-primary float-right" href="${ context }/user/address/create/${ order.user._id }">Thêm địa chỉ mới</a>
        	</div>
            <c:if test="${ order.user.shippingAddresses != null and order.user.shippingAddresses.size() > 0 }">
            	<c:forEach var="i" begin="0" end="${ order.user.shippingAddresses.size() - 1 }">
	            	<div class="form-check">
					  <label class="form-check-label">
					    <input type="radio" class="form-check-input" name="address" value="${ i }" <c:if test="${ i == 0 }">checked="checked"</c:if> />
					    	${ order.user.shippingAddresses[i].street }, ${ order.user.shippingAddresses[i].ward }, ${ order.user.shippingAddresses[i].district }, ${ order.user.shippingAddresses[i].province }
					  </label>
					</div>
	            </c:forEach>
            </c:if>
            <br>            
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <span class="input-group-text">Tổng tiền đơn hàng</span>
                </div>
                <input type="text" class="form-control text-right" value="<fmt:formatNumber value="${ order.getTotal() }" type="currency"/>" readonly>
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