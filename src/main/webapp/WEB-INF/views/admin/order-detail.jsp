<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="context" value="${ pageContext.request.contextPath }" />
<c:set var="formAction" value="${ context }/admin/manage-orders/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title> Quản lý - Chi tiết hóa đơn </title>
<link rel="shortcut icon"
	href='<c:url value="/resources/images/favicon.ico" />'
	type="image/x-icon">
<link rel="icon" href='<c:url value="/resources/images/favicon.ico" />'
	type="image/x-icon">
<!-- Custom fonts for this template-->
<link href="${ context }/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

<!-- Custom styles for this template-->
<link href="${ context }/resources/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body>
	<fmt:setLocale value="vi_VN" scope="session"/>
	<div id="wrapper">
		<%@include file="sidebar.jsp" %>
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <%@include file="toolbar.jsp" %>

                <!-- Your code here -->
                
                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Thông tin hóa đơn #${ order._id }</h1>
                    <c:if test="${ param.message != null }">
                    	<div class="alert alert-success alert-dismissible">
						  <button type="button" class="close" data-dismiss="alert">&times;</button>
						  ${ param.message }
						</div>
                    </c:if>

                    <div class="row">

                        <div class="col-lg-6">
                            <!-- Basic Card Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Thông tin đặt hàng</h6>
                                </div>
                                <div class="card-body">
                                    <p><i class="far fa-calendar-alt"></i> Ngày đặt hàng: ${ order.orderDate }</p>
									<p><i class="fas fa-tasks"></i>
										<c:if test="${ order.state == -1 }">Đã hủy</c:if>
										<c:if test="${ order.state == 0 }">Đang xử lý</c:if>
										<c:if test="${ order.state == 1 }">Đã giao hàng</c:if>
									</p>
									<p><i class="fas fa-money-check-alt"></i> Thanh toán: Tiền mặt</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-6">
							<!-- Basic Card Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Thông tin giao hàng</h6>
                                </div>
                                <div class="card-body">
                                    <p><i class="fas fa-user"></i> Khách hàng: ${ order.user.name }</p>
									<p><i class="fas fa-phone-square-alt"></i> Số điện thoại: ${ order.phone }</p>
									<p><i class="fas fa-map-marked-alt"></i> Địa chỉ giao hàng: ${ order.shippingAddress }</p>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- Basic Card Example -->
                     <div class="card shadow mb-4">
                         <div class="card-header py-3">
                             <h6 class="m-0 font-weight-bold text-primary">Thông tin sản phẩm</h6>
                         </div>
                         <div class="card-body">
                             <div class="table-responsive">
								<table class="table table-border">
									<thead>
										<tr><td>Sản phẩm</td><td>Đơn giá</td><td>Số lượng</td><td>Giảm giá</td><td>Tạm tính</td></tr>
									</thead>
							        <tbody>
							        	<c:forEach var="item" items="${ order.orderDetails }">
								        	<tr>
									            <td style="min-width: 300px;">
									                <div class="order-item row">
									                    <div class="col-sm-2 col-5 mt-auto mb-auto"><img src="data:image/png;base64,${ item.product.images[0] }" style="width: 100%;"/></div>
									                    <div class="col-sm-10 col-7 mt-auto mb-auto">
									                        <div class="order-product-name"> <a href="${ context }/product/${ item.product._id }">${ item.product.name }</a> </div>
									                        <div class="order-product-origin"> Xuất xứ: ${ item.product.origin } </div>
									                        <div class="order-product-sku"> Sku: ${ item.product.sku } </div>
									                    </div>
									                </div>
									            </td>
									            <td><fmt:formatNumber value="${ item.unitPrice }" type="currency"/></td>
									            <td>${ item.quantity }</td>
									            <td><fmt:formatNumber value="${ item.getTotalDiscount() }" type="currency"/></td>
									            <td><fmt:formatNumber value="${ item.getLineTotal() }" type="currency"/></td>
									        </tr>
								        </c:forEach>
							        </tbody>
							    </table>
							</div>
							<p style="font-size: 1.2rem; font-weight: bold;">Tổng cộng: <fmt:formatNumber value="${ order.getTotal() }" type="currency"/> </p>
							<c:if test="${ order.state == 0 }">
                            	<a class="btn btn-primary btn-block" href="${ context }/admin/manage-orders/update/${ order._id }">Cập nhật trạng thái</a> 
                            </c:if>
		
                         </div>
                     </div>

                </div>
                <!-- /.container-fluid -->
                                
                <!-- End of your code -->

            </div>
            <!-- End of Main Content -->

            <%@include file="footer.jsp" %>

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <%@include file="end.jsp" %>
    <c:forEach var="lab" items="${ labels }"></c:forEach>
    
    <script type="text/javascript">
    	var labels = new Array()
    	var data = new Array()
    	<c:forEach var="lab" items="${ labels }">
    		labels.push("${lab}")
    	</c:forEach>
   		<c:forEach var="dat" items="${ data }">
    		data.push("${dat}")
    	</c:forEach>
    		
    	console.log(data)
    		
    	loadDataToChart(labels, data)
    </script>
</body>
</html>