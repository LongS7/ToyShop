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
<title> Chi tiết đơn hàng </title>
<style>
	.order-product-name {
		font-size: 1.1rem;
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
	<fmt:setLocale value="vi_VN"/>
	
	<%@include file="navigationBar.jsp" %>
	
	<div class="container p-2">
		<h5 class="text-center">Thông tin đơn hàng <span style="font-size: 1.2rem; font-weight: bold;">#${ order._id }</span></h5>
		
		<div class="row p-2">
			<div class="col-sm-6 col-12 border p-2">
				<p><i class="far fa-calendar-alt"></i> Ngày đặt hàng: ${ order.orderDate }</p>
				<p><i class="fas fa-tasks"></i>
					<c:if test="${ order.state == -1 }">Đã hủy</c:if>
					<c:if test="${ order.state == 1 }">Đang xử lý</c:if>
					<c:if test="${ order.state == 2 }">Đã giao hàng</c:if>
				</p>
				<p><i class="fas fa-money-check-alt"></i> Thanh toán: Tiền mặt</p>
			</div>
			<div class="col-sm-6 col-12 border p-2">
				<p><i class="fas fa-user"></i> Khách hàng: ${ order.user.name }</p>
				<p><i class="fas fa-phone-square-alt"></i> Số điện thoại: ${ order.phone }</p>
				<p><i class="fas fa-map-marked-alt"></i> Địa chỉ giao hàng: ${ order.shippingAddress }</p>
			</div>
		</div>
		<hr>
		<div class="table-responsive">
			<table class="table table-hover">
				<thead>
					<tr><td>Sản phẩm</td><td>Đơn giá</td><td>Số lượng</td><td>Giảm giá</td><td>Tạm tính</td><td></td></tr>
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
				            <td> 
				            	<c:if test="${ item.product.hasCommentOfUser(currentUser) == true }">
				            		<span class="btn disable">Bạn đã đánh giá</span>
				            	</c:if>
				            	<c:if test="${ item.product.hasCommentOfUser(currentUser) == false }">
				            		<a class="btn btn-primary text-white" style="min-width: 150px;" 
						            product-id="${ item.product._id }"
						            data-toggle="modal" data-target="#myModal" onclick="return setProduct(this)"> Thêm nhận xét </a> 
				            	</c:if> 
				            </td>
				        </tr>
			        </c:forEach>
		        </tbody>
		    </table>
		</div>
		<!-- The Modal -->
		<div class="modal" id="myModal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		
		      <!-- Modal Header -->
		      <div class="modal-header">
		        <h4 class="modal-title">Đánh giá sản phẩm</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>
		
		      <!-- Modal body -->
		      <div class="modal-body">
		      	<span onmouseover="starmark(this)" onclick="starmark(this)"
					id="1one" style="font-size: 40px; cursor: pointer;"
					class="fa fa-star checked"></span> <span
					onmouseover="starmark(this)" onclick="starmark(this)" id="2one"
					style="font-size: 40px; cursor: pointer;" class="fa fa-star "></span>
				<span onmouseover="starmark(this)" onclick="starmark(this)"
					id="3one" style="font-size: 40px; cursor: pointer;"
					class="fa fa-star "></span> <span onmouseover="starmark(this)"
					onclick="starmark(this)" id="4one"
					style="font-size: 40px; cursor: pointer;" class="fa fa-star"></span>
				<span onmouseover="starmark(this)" onclick="starmark(this)"
					id="5one" style="font-size: 40px; cursor: pointer;"
					class="fa fa-star"></span>
		        <form class="mt-3" action="${ context }/comments/add" method="post">
		        	<input type="hidden" id="productId" name="productId">
		        	<input type="hidden" id="rating" name="rating">
				  	<div class="form-group">
					  	<label for="comment">Nhận xét:</label>
					  	<textarea class="form-control" rows="5" id="comment" name="comment"></textarea>
					</div>
					<input class="btn btn-primary" type="submit" value="Đăng">
				</form>
		      </div>
		
		      <!-- Modal footer -->
		      <div class="modal-footer">
		        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
		      </div>
		
		    </div>
		  </div>
		</div>
		<p style="font-size: 1.2rem; font-weight: bold;">Tổng cộng: <fmt:formatNumber value="${ order.getTotal() }" type="currency"/> </p>
		
		<c:if test="${ order.state == 1 }"><a class="btn btn-danger btn-block mt-5" href="${ context }/order/cancel/${ order._id }">Hủy đơn hàng</a></c:if>
	</div>
	<script type="text/javascript">
		var productId = document.getElementById("productId")
		var rating = document.getElementById("rating")
		function starmark(item) {
			  count = item.id[0];
			  sessionStorage.starRating = count;
			  var subid = item.id.substring(1);
			  for (var i = 0; i < 5; i++) {
			    if (i < count) {
			      document.getElementById(i + 1 + subid).style.color = "orange";
			      rating.value = i + 1;
			      
			    } else {
			      document.getElementById(i + 1 + subid).style.color = "black";
			    }
			  }
		}
		function setProduct(btn) {			
			productId.value = btn.getAttribute("product-id")
		}
	</script>
	<%@include file="footer.jsp" %>
</body>
</html>