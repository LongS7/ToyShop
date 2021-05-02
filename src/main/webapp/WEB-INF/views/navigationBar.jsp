<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<nav class="navbar navbar-expand-md bg-4 navbar-dark">
        <!-- Links -->
        <a class="navbar-brand" href="#"><i class="fas fa-paw fa-2x"></i></a>
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
                        <a class="nav-link active" data-toggle="dropdown">
                            <i class="fas fa-user-alt"></i> Tài khoản
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="user/register">Tạo tài khoản</a>
                            <a class="dropdown-item" href="user/login">Đăng nhập</a>
                        </div>
                    </div>
                </li>
                <li class="nav-item active"><a class="nav-link" href="#"><i class="fas fa-shopping-cart"></i> Giỏ hàng </a></li>
            </ul>
        </div>
    </nav>
    <nav class="navbar navbar-expand-md bg-1 navbar-dark second-nav">
        <div class="collapse navbar-collapse justify-content-center" id="collapsibleNavbar">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="#">Sản phẩm</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Thương hiệu</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Danh mục</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link" data-toggle="dropdown" href="#">Độ tuổi</a>
                    <div class="dropdown-menu ">
                      <a class="dropdown-item" href="#">0 - 12 tháng</a>
                      <a class="dropdown-item" href="#">1 - 3 tuổi</a>
                      <a class="dropdown-item" href="#">4 - 6 tuổi</a>
                      <a class="dropdown-item" href="#">6 - 11 tuổi</a>
                      <a class="dropdown-item" href="#">12 tuổi trở lên</a>
                    </div>
                </li>
                <li class="nav-item"><a class="nav-link" href="#">Giới thiệu</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Liên hệ</a></li>
            </ul>
        </div>
    </nav>
