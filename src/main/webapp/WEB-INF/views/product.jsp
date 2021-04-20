<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="./resources/css/main.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>
<body>
	<%@include file="navigationBar.jsp" %>
    <div id="wrapper">
        <ul class="navbar-nav sidebar" id="accordionSidebar">
            <!-- Heading -->
            <div class="sidebar-heading">
                Danh mục
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#van-dong"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <span>Đồ chơi vận động</span>
                </a>
                <div id="van-dong" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="#">Đồ chơi dã ngoại</a>
                        <a class="collapse-item" href="#">Đồ chơi dã ngoại</a>
                        <a class="collapse-item" href="#">Đồ chơi dã ngoại</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#van-dong2"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <span>Đồ chơi vận động</span>
                </a>
                <div id="van-dong2" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="#">Đồ chơi dã ngoại</a>
                        <a class="collapse-item" href="#">Đồ chơi dã ngoại</a>
                        <a class="collapse-item" href="#">Đồ chơi dã ngoại</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Giá
            </div>

            <form class="p-2">
                <input name="priceRange" id="priceRange" type="range" min="1" max="100" value="10" class="form-control-range">
                <div class="row">
                    <label class="col-12 col-sm-5 text-center">Min: <span id="minPrice">1</span></label>
                    <label class="col-12 col-sm-2 text-center" id="priceTag"></span>10</label>
                    <label class="col-12 col-sm-5 text-center">Max: <span id="maxPrice">100</span></label>
                </div>
            </form>
            
            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Tuổi
            </div>

            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <form class="p-3">
                    <div class="form-check">
                        <label class="form-check-label">
                          <input type="checkbox" class="form-check-input" value="">1-3 tuổi
                        </label>
                    </div>
                    <div class="form-check">
                        <label class="form-check-label">
                          <input type="checkbox" class="form-check-input" value="">4-6 tuổi
                        </label>
                    </div>
                    <div class="form-check">
                        <label class="form-check-label">
                          <input type="checkbox" class="form-check-input" value="">7-12 tuổi
                        </label>
                    </div>
                    <div class="form-check">
                        <label class="form-check-label">
                          <input type="checkbox" class="form-check-input" value="">12 tuổi trở lên
                        </label>
                    </div>
                </form>
            </li>

            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Giới tính
            </div>

            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <form class="p-3">
                    <div class="form-check">
                        <label class="form-check-label">
                          <input type="checkbox" class="form-check-input" value="">BOY
                        </label>
                    </div>
                    <div class="form-check">
                        <label class="form-check-label">
                          <input type="checkbox" class="form-check-input" value="">GIRL
                        </label>
                    </div>
                    <div class="form-check">
                        <label class="form-check-label">
                          <input type="checkbox" class="form-check-input" value="">UNISEX
                        </label>
                    </div>
                </form>
            </li>

            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="#">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Tables</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

        </ul>
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>
                    <div class="sorter">
                        Sắp xếp theo &nbsp;&nbsp;    
                        <a><i class="fas fa-sort-amount-up"></i>Giá cao</a> &nbsp;&nbsp;
                        <a><i class="fas fa-sort-amount-down"></i>Giá thấp</a> &nbsp;&nbsp;
                        <a><i class="fas fa-star"></i>Nổi bật</a>
                    </div>
                </nav>
                <div class="container">
                    <div class="list-product row">
                        <div class="product col-6 col-sm-3 p-1">
                            <div class="border p-2">
                                <a class="product-image" href="#">
                                    <img src="./resources/Images/lego_car.jpg" style="width: 100%;">
                                </a>
                                <div class="product-name text-left"><a href="#">Xe Địa Hình Điều Khiển Từ Xa</a></div>
                                <div class="rating text-left">
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star"></span>
                                    <span class="num-of-rate">(7)</span>
                                </div>
                                <div class="product-price text-left font-weight-bold"><span>3,359,000 VNĐ</span></div>
                            </div>
                        </div>
                        <div class="product col-6 col-sm-3 p-1">
                            <div class="border p-2">
                                <a class="product-image" href="#">
                                    <img src="./resources/Images/lego_car.jpg" style="width: 100%;">
                                </a>
                                <div class="product-name text-left"><a href="#">Xe Địa Hình Điều Khiển Từ Xa</a></div>
                                <div class="rating text-left">
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star"></span>
                                    <span class="num-of-rate">(7)</span>
                                </div>
                                <div class="product-price text-left font-weight-bold"><span>3,359,000 VNĐ</span></div>
                            </div>
                        </div>
                        <div class="product col-6 col-sm-3 p-1">
                            <div class="border p-2">
                                <a class="product-image" href="#">
                                    <img src="./resources/Images/lego_car.jpg" style="width: 100%;">
                                </a>
                                <div class="product-name text-left"><a href="#">Xe Địa Hình Điều Khiển Từ Xa</a></div>
                                <div class="rating text-left">
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star"></span>
                                    <span class="num-of-rate">(7)</span>
                                </div>
                                <div class="product-price text-left font-weight-bold"><span>3,359,000 VNĐ</span></div>
                            </div>
                        </div>
                        <div class="product col-6 col-sm-3 p-1">
                            <div class="border p-2">
                                <a class="product-image" href="#">
                                    <img src="./resources/Images/lego_car.jpg" style="width: 100%;">
                                </a>
                                <div class="product-name text-left"><a href="#">Xe Địa Hình Điều Khiển Từ Xa</a></div>
                                <div class="rating text-left">
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star"></span>
                                    <span class="num-of-rate">(7)</span>
                                </div>
                                <div class="product-price text-left font-weight-bold"><span>3,359,000 VNĐ</span></div>
                            </div>
                        </div>
                        <div class="product col-6 col-sm-3 p-1">
                            <div class="border p-2">
                                <a class="product-image" href="#">
                                    <img src="./resources/Images/lego_car.jpg" style="width: 100%;">
                                </a>
                                <div class="product-name text-left"><a href="#">Xe Địa Hình Điều Khiển Từ Xa</a></div>
                                <div class="rating text-left">
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star"></span>
                                    <span class="num-of-rate">(7)</span>
                                </div>
                                <div class="product-price text-left font-weight-bold"><span>3,359,000 VNĐ</span></div>
                            </div>
                        </div>
                        <div class="product col-6 col-sm-3 p-1">
                            <div class="border p-2">
                                <a class="product-image" href="#">
                                    <img src="./resources/Images/lego_car.jpg" style="width: 100%;">
                                </a>
                                <div class="product-name text-left"><a href="#">Xe Địa Hình Điều Khiển Từ Xa</a></div>
                                <div class="rating text-left">
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star"></span>
                                    <span class="num-of-rate">(7)</span>
                                </div>
                                <div class="product-price text-left font-weight-bold"><span>3,359,000 VNĐ</span></div>
                            </div>
                        </div>
                        <div class="product col-6 col-sm-3 p-1">
                            <div class="border p-2">
                                <a class="product-image" href="#">
                                    <img src="./resources/Images/lego_car.jpg" style="width: 100%;">
                                </a>
                                <div class="product-name text-left"><a href="#">Xe Địa Hình Điều Khiển Từ Xa</a></div>
                                <div class="rating text-left">
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star"></span>
                                    <span class="num-of-rate">(7)</span>
                                </div>
                                <div class="product-price text-left font-weight-bold"><span>3,359,000 VNĐ</span></div>
                            </div>
                        </div>
                        <div class="product col-6 col-sm-3 p-1">
                            <div class="border p-2">
                                <a class="product-image" href="#">
                                    <img src="./resources/Images/lego_car.jpg" style="width: 100%;">
                                </a>
                                <div class="product-name text-left"><a href="#">Xe Địa Hình Điều Khiển Từ Xa</a></div>
                                <div class="rating text-left">
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star"></span>
                                    <span class="num-of-rate">(7)</span>
                                </div>
                                <div class="product-price text-left font-weight-bold"><span>3,359,000 VNĐ</span></div>
                            </div>
                        </div>
                        
                    </div>
                </div>
        </div>
    </div><br>
    </div>
    <%@include file="footer.jsp" %>
    <script src="./resources/js/sb-admin-2.min.js"></script>
    <script>
        var slider = document.getElementById("priceRange");
        var output = document.getElementById("priceTag");
        output.innerHTML = slider.value; // Display the default slider value

        // Update the current slider value (each time you drag the slider handle)
        slider.oninput = function() {
            output.innerHTML = this.value;
        }
    </script>
</body>
</html>