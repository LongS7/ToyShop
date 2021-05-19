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
<title>Insert title here</title>
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
            <label>Địa chỉ giao hàng</label>
            <c:forEach var="i" begin="0" end="${ user.shippingAddress.size() }">
            	<div class="form-check">
				  <label class="form-check-label">
				    <input type="radio" class="form-check-input" name="address" value="${ i }" <c:if test="${ i == 0 }">checked="checked"</c:if> />
				    	${ order.user.shippingAddresses[i].street }, ${ order.user.shippingAddresses[i].ward }, ${ order.user.shippingAddresses[i].district }, ${ order.user.shippingAddresses[i].province }
				  </label>
				</div>
            </c:forEach>
            <div class="form-check">
				  <label class="form-check-label">
				    <input type="radio" class="form-check-input" name="address" value="-1" <c:if test="${ user.shippingAddress.size() == 0 }">checked="checked"</c:if> />
					Thêm địa chỉ mới
				  </label>
			</div>
            <div class="form-group">
			    <label for="street">Số nhà</label>
			    <form:input class="form-control" placeholder="Nhập số nhà, số đường" id="street" path="shippingAddress.street"/>
		  	</div>
		  	<div class="form-group">
			    <label for="ward">Xã/phường</label>
			    <form:input class="form-control" placeholder="Xã/phường" id="ward" path="shippingAddress.ward"/>
			    <form:errors path="shippingAddress.ward" class="error"></form:errors>
		  	</div>
		  	<div class="form-group">
			    <label for="district">Quận/huyện</label>
			    <form:input class="form-control" placeholder="Quận/huyện" id="district" path="shippingAddress.district"/>
			    <form:errors path="shippingAddress.district" class="error"></form:errors>
		  	</div>
		  	<div class="form-group">
			    <label for="province">Tỉnh/thành</label>
			    <form:input class="form-control" placeholder="Tỉnh/thành" id="province" path="shippingAddress.province"/>
			    <form:errors path="shippingAddress.province" class="error"></form:errors>
		  	</div>
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