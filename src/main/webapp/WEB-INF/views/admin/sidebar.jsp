<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="context" value="${ pageContext.request.contextPath }" />
<!-- Sidebar -->
<ul
	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
	id="accordionSidebar">

	<!-- Sidebar - Brand -->
	<a
		class="sidebar-brand d-flex align-items-center justify-content-center"
		href="${ context }/admin">
		<div class="sidebar-brand-icon rotate-n-15">
			<i class="fas fa-paw"></i>
		</div>
		<div class="sidebar-brand-text mx-3">
			Toy Shop
		</div>
	</a>

	<!-- Divider -->
	<hr class="sidebar-divider my-0">

	<!-- Nav Item - Dashboard -->
	<li class="nav-item active"><a class="nav-link" href="${ context }/admin">
			<i class="fas fa-fw fa-tachometer-alt"></i> <span>Trang chủ</span>
	</a></li>

	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Heading -->
	<div class="sidebar-heading">Quản lý</div>

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item">
		<a class="nav-link collapsed" href="#"
			data-toggle="collapse" data-target="#toy" aria-expanded="true"
			aria-controls="toy"> <i class="fas fa-carrot"></i> <span>Đồ chơi</span>
		</a>
		<div id="toy" class="collapse" aria-labelledby="headingTwo"
			data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<a class="collapse-item" href="buttons.html">Danh sách</a> <a
					class="collapse-item" href="${context}/admin/manage-products/add">Thêm mới</a>
			</div>
		</div>
	</li>
	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item">
		<a class="nav-link" href="${ context }/admin/manage-orders/"> <i class="fas fa-file-invoice-dollar fa-fw"></i> <span>Đơn hàng</span></a>
	</li>
	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item">
		<a class="nav-link" href="#"> <i class="fas fa-users"></i> <span>Khách hàng</span></a>
	</li>
	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Heading -->
	<div class="sidebar-heading">Thống kê</div>

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item"><a class="nav-link collapsed" href="#"> <i class="fas fa-chart-line"></i> <span>Thống kê doanh thu</span></a>
	</li>

	<!-- Divider -->
	<hr class="sidebar-divider d-none d-md-block">

	<!-- Sidebar Toggler (Sidebar) -->
	<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>

	<!-- Sidebar Message -->
	<div class="sidebar-card">
		<div class="sidebar-card-illustration mb-2">
			<i class="fas fa-paw fa-3x"></i>
		</div>
		<p class="text-center mb-2">
			<strong>Toy Shop</strong> Trang web mua đồ chơi trực tuyến
		</p>
	</div>

</ul>
<!-- End of Sidebar -->