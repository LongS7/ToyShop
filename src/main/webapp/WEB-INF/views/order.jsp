<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<style>
	.order-product-name {
	    overflow: hidden;
	    text-overflow: ellipsis;
	    display: -webkit-box;
	    -webkit-box-orient: vertical;
	    -webkit-line-clamp: 2;
	}
	.order-date, .order-total {
	    color: rgb(70, 70, 70);
	}
</style>
</head>
<body>
	<%@include file="navigationBar.jsp" %>
	
	<div class="row p-3">
        <div class="col-sm-2 d-none d-sm-block">
            <div class="text-center">
                <div class=""><i class="fas fa-user-circle fa-3x"></i></div>
                <div>Điểu Long</div>
            </div>
            <div class="list-group list-group-flush text-center">
                <a href="#" class="list-group-item list-group-item-action"><i class="fas fa-user-circle fa-2x"></i><br> Thông tin tài khoản</a>
                <a href="#" class="list-group-item list-group-item-action"><i class="fas fa-bell fa-2x"></i><br>Thông báo</a>
                <a href="#" class="list-group-item list-group-item-action"><i class="fas fa-map-marker-alt fa-2x"></i><br>Các địa chỉ giao hàng</a>
                <a href="#" class="list-group-item list-group-item-action"><i class="fas fa-file-invoice fa-2x"></i><br>Đơn hàng của tôi</a>
                <a href="#" class="list-group-item list-group-item-action"><i class="fas fa-comments fa-2x"></i><br>Nhận xét của tôi</a>
                <a href="#" class="list-group-item list-group-item-action"><i class="fas fa-question-circle fa-2x"></i><br>Liên hệ</a>
            </div>
        </div>
        <div class="col-sm-10 col-12">
            <ul class="nav nav-tabs nav-justified">
                <li class="nav-item">
                  <a class="nav-link active" href="#">Tất cả</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">Đang xử lý</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">Đã giao hàng</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">Đã hủy</a>
                </li>
            </ul>
            <table class="table">
                <tr>
                    <td>
                        <div class="order-item row">
                            <div class="col-sm-2 col-5 mt-auto mb-auto"><img src="./resources/images/lego_car.jpg" style="width: 100%;"/></div>
                            <div class="col-sm-10 col-7 mt-auto mb-auto">
                                <div class="order-product-name">Điện Thoại Samsung Galaxy A02s (4GB/64GB) - ĐÃ KÍCH HOẠT BẢO HÀNH ĐIỆN TỬ - Hàng Chính Hãng - Đen	</div>
                                <div class="order-total">Tổng: 2.855.000 ₫</div>
                                <div class="order-date">Ngày mua: 14/04/2021</div>
                                <div class="order-btn-detail"><a href="#" class="btn btn-primary">Xem chi tiết</a></div>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="order-item row">
                            <div class="col-sm-2 col-5 mt-auto mb-auto"><img src="./resources/images/lego_car.jpg" style="width: 100%;"/></div>
                            <div class="col-sm-10 col-7 mt-auto mb-auto">
                                <div class="order-product-name">Điện Thoại Samsung Galaxy A02s (4GB/64GB) - ĐÃ KÍCH HOẠT BẢO HÀNH ĐIỆN TỬ - Hàng Chính Hãng - Đen	</div>
                                <div class="order-total">Tổng: 2.855.000 ₫</div>
                                <div class="order-date">Ngày mua: 14/04/2021</div>
                                <div class="order-btn-detail"><a href="#" class="btn btn-primary">Xem chi tiết</a></div>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
	
	<%@include file="footer.jsp" %>
</body>
</html>