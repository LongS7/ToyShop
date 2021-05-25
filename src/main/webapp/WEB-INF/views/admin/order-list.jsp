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
<title> Quản lý </title>
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
                    <h1 class="h3 mb-2 text-gray-800">Quản lý hóa đơn</h1>
                    <c:if test="${ param.message != null }">
                    	<div class="alert alert-success alert-dismissible">
						  <button type="button" class="close" data-dismiss="alert">&times;</button>
						  ${ param.message }
						</div>
                    </c:if>
                    <c:if test="${ param.sort_date == null || param.sort_date == -1 }">
                     	<c:set var="sort_date" value="1"/>
                     	<c:set var="sort_icon" value="fas fa-sort-up"/>
                   	</c:if>
                   	<c:if test="${ param.sort_date == 1 }">
                   		<c:set var="sort_date" value="-1"/>
                   		<c:set var="sort_icon" value="fas fa-sort-down"/>
                   	</c:if>
                   	<c:if test="${ param.p == null }">
                    	<c:set var="page" value="1"/>
                     </c:if>
                     <c:if test="${ param.p != null }">
                     	<c:set var="page" value="${ param.p }"/>
                     </c:if>
                    <h1 class="h5">Bộ lọc</h1>
					<form class="mb-2">
						<input type="text" name="p" value="${ page }" hidden="true">
						<input type="text" name="sort_date" value="${ param.sort_date }" hidden="true">
						<div class="row">
						    <div class="col">
						      <label>Từ ngày</label>
						    </div>
						    <div class="col">
						      <label>Đến ngày</label>
						    </div>
						</div>
						<div class="row">
						    <div class="col">
						      <input type="date" class="form-control" name="dateFrom">
						    </div>
						    <div class="col">
						      <input type="date" class="form-control" name="dateTo">
						    </div>
						</div>
						<select name="state" class="custom-select mt-2 mb-2">
						    <option selected value="">Chọn trạng thái</option>
						    <option value="0">Đang xử lý</option>
						    <option value="1">Đã giao</option>
						    <option value="-1">Đã hủy</option>
						  </select>
						<button class="btn btn-primary mt-2 mb-2" type="submit">
							<span class="icon text-white-50">
                                <i class="fas fa-filter"></i>
                            </span>
                            <span class="text">Lọc</span>
						</button>
					</form>
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Danh sách hóa đơn</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>Mã HD</th>
                                            <th><div>
                                            	<span>Ngày đặt</span>
                                            	<a class="float-right" href="?p=${ page }&sort_date=${ sort_date }&dateFrom=${ param.dateFrom }&&dateTo=${ param.dateTo }&&state=${ param.state }"><i class="${ sort_icon }"></i></a>
                                           	</div></th>
                                            <th>Tổng tiền</th>
                                            <th>Trạng thái đơn hàng</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="order" items="${ orders }">
                                    		<tr>
                                    			<td><a href="${ context }/admin/manage-orders/${ order._id }">${ order._id }</a></td>
                                    			<td>${ order.orderDate }</td>
                                    			<td> <fmt:formatNumber value="${ order.getTotal() }" type="currency" /> </td>
                                    			<td>
                                    				<c:if test="${ order.state eq -1 }">Đã hủy</c:if> 
							                    	<c:if test="${ order.state eq 0}">Đang xử lý</c:if> 
							                    	<c:if test="${ order.state eq 1 }">Đã giao</c:if> 
                                    			</td>
                                    			<td class="text-center"> 
                                    				<c:if test="${ order.state == 0 }">
                                    					<a class="btn btn-primary" href="${ context }/admin/manage-orders/update/${ order._id }">Cập nhật trạng thái</a> 
                                   					</c:if>
                                   				</td>
                                    		</tr>
                                    	</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <ul class="pagination justify-content-end">
                            	<c:if test="${ page > 1 }">
                           			<li class="page-item"><a class="page-link" href="list-order?p=${ page - 1 }">Previous</a></li>
                            	</c:if>
                            	<c:if test="${ page == null || page <= 1 }">
                           			<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                            	</c:if>
							  	<li class="page-item active"><a class="page-link" href="list-order?p=${ page }">${ page }</a></li>
							  	<li class="page-item"><a class="page-link" href="list-order?p=${ page + 1 }">${ page + 1 }</a></li>
							  	<li class="page-item"><a class="page-link" href="list-order?p=${ page + 2 }">${ page + 2 }</a></li>
							  	<li class="page-item"><a class="page-link" href="list-order?p=${ page + 1 }">Next</a></li>
							</ul>
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