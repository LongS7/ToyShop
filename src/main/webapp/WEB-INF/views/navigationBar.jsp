<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<c:set var="context" value="${ pageContext.request.contextPath }" />
<nav class="navbar navbar-expand-md bg-4 navbar-dark">
        <!-- Links -->
        <a class="navbar-brand" href="${ context }"><i class="fas fa-paw fa-2x"></i></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <form class="form-inline ml-auto" id="search-form">
                <div class="input-group w-100">
                    <input type="text" class="form-control" placeholder="Search" id="txtSearch">
                    <div class="input-group-append">
                      <button class="btn btn-secondary" type="submit"><i class="fas fa-search"></i></button>
                    </div>
                </div>
            </form>
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <div class="dropdown">
                    	<c:if test="${ currentUser == null }">
	                        <a class="nav-link active" data-toggle="dropdown">
	                            <i class="fas fa-user-alt"></i> Tài khoản
	                        </a>
	                        <div class="dropdown-menu">
	                            <a class="dropdown-item" href="${context }/user/register">Tạo tài khoản</a>
	                            <a class="dropdown-item" href="${context }/user/login">Đăng nhập</a>
	                        </div>
                        </c:if>
                        <c:if test="${ currentUser != null }">
	                        <a class="nav-link active" data-toggle="dropdown">
	                            <i class="fas fa-user-alt"></i> ${ currentUser.name }
	                        </a>
	                        <div class="dropdown-menu">
	                            <a class="dropdown-item" href="${ context }/user/edit">Quản lý tài khoản</a>
	                            <a class="dropdown-item" href="${ context }/order/my-order">Đơn hàng của tôi</a>
	                        </div>
                        </c:if>
                    </div>
                </li>
                <li class="nav-item active"><a class="nav-link" href="${ context }/mycart/"><i class="fas fa-shopping-cart"></i> Giỏ hàng </a></li>
            </ul>
        </div>
    </nav>
    <nav class="navbar navbar-expand-md bg-1 navbar-dark second-nav">
        <div class="collapse navbar-collapse justify-content-center" id="collapsibleNavbar">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="${ pageContext.request.contextPath }/san-pham/tat-ca?page=1&limit=20"">Sản phẩm</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Thương hiệu</a></li>
                <li class="nav-item dropdown">
				<div class="dropdown">
					<a class="nav-link">Danh mục</a>
					<div class="dropdown-menu " style="min-width: 300px;">
						<c:forEach var="map" items="${ categories }">
							<div class="dropdown-item">
								<div class="dropdown dropright">
							      	<a class="btn" href="${ context }/danh-muc?des=${ map.key }"  data-toggle="dropdown">${ map.key }</a>
								    <div class="dropdown-menu">
										<c:forEach var="cate" items="${ map.value }">
											<a class="dropdown-item" href="${ pageContext.request.contextPath }/danh-muc/${ cate._id }?page=1&limit=20">${ cate.categoryName }</a>
										</c:forEach>
									</div>
								  </div>								
							</div>
						</c:forEach>
					</div>
				</div></li>
                <li class="nav-item dropdown">
                    <a class="nav-link" data-toggle="dropdown" href="#">Độ tuổi</a>
                    <div class="dropdown-menu ">
                      <a class="dropdown-item" href="${ pageContext.request.contextPath }/san-pham/?tuoi=1-3-tuoi&page=1&limit=20">1 - 3 tuổi</a>
                      <a class="dropdown-item" href="${ pageContext.request.contextPath }/san-pham/?tuoi=4-6-tuoi&page=1&limit=20">4 - 6 tuổi</a>
                      <a class="dropdown-item" href="${ pageContext.request.contextPath }/san-pham/?tuoi=6-11-tuoi&page=1&limit=20">6 - 11 tuổi</a>
                      <a class="dropdown-item" href="${ pageContext.request.contextPath }/san-pham/?tuoi=12-tuoi-tro-len&page=1&limit=20">12 tuổi trở lên</a>
                    </div>
                </li>
                <li class="nav-item"><a class="nav-link" href="#">Giới thiệu</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Liên hệ</a></li>
            </ul>
        </div>
    </nav>
