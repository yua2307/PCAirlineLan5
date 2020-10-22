<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<s:url var="bg" value="/resources/public/assets/img/background.jpg"/>
<%@page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <title>Index Page</title>
        <!-- Google Fonts -->
        <link href="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>" rel="stylesheet"  type="text/css" >
        <link  href="<c:url value="https://use.fontawesome.com/releases/v5.7.0/css/all.css" />" rel="stylesheet"  type="text/css" >

        <link href="<c:url value="/resources/public/assets/css/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet"  >
        <!--    load shortcut icon-->

        <link rel="shortcut icon" href="<c:url value="/resources/public/assets/img/logox.png"/>"   type="image/x-icon">
        <link rel="icon" href="<c:url value="/resources/public/assets/img/logox.png" />"    type="image/x-icon">
    <!--    <link  href="<c:url value="glider.css"/>" rel="stylesheet" stype="text/css">-->
        <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet" >

        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
        <link rel="stylesheet" href="<c:url value="/resources/css/linearicons.css"/>">
        <link rel="stylesheet" href="<c:url value="/resources/css/font-awesome.min.css"/>" >
        <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css"/>">
        <link rel="stylesheet" href="<c:url value="/resources/css/magnific-popup.css"/>">
        <link rel="stylesheet" href="<c:url value="/resources/css/jquery-ui.css"/>">			
        <link rel="stylesheet" href="<c:url value="/resources/css/nice-select.css"/>">						
        <link rel="stylesheet" href="<c:url value="/resources/css/animate.min.css"/>">
        <link rel="stylesheet" href="<c:url value="/resources/css/owl.carousel.css"/>">
        <link rel="stylesheet" href="<c:url value="/resources/css/bookTicket.css"/>">

    </head>

    <body>
                <header>
            <nav class="navbar navbar-expand-md navbar-dark fixed-top">
                <div class="container">
                    <a class="navbar-brand" href="<c:url value="/index"/>"><i class="fas fa-plane-departure"></i></i> PC Airlines</a>
                    <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse" data-target="#collapsibleNavId" aria-controls="collapsibleNavId" aria-expanded="false" aria-label="Toggle navigation"><i class="fas fa-bars"></i></button>
                    <div class="collapse navbar-collapse" id="collapsibleNavId">
                        <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
                            <c:choose>
                                <c:when test="${empty sessionScope.username}"> 
                                    <li class="nav-item active">
                                        <a class="nav-link" href="<c:url value="/login"/>">Đăng nhập <span class="sr-only">(current)</span></a>

                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="nav-item dropdown no-arrow">
                                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <span >Loged in by: ${sessionScope.username}</span>
                                        </a>
                                        <!-- Dropdown - User Information -->
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                                            <a class="dropdown-item" href="<c:url value="/userInformation"/>">
                                                <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                                Profile
                                            </a>
                                            <a class="dropdown-item" href="#">
                                                <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                                Settings
                                            </a>
                                            <a class="dropdown-item" href="#">
                                                <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                                Activity Log
                                            </a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                                Logout
                                            </a>
                                        </div>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="dropdownId" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Sân bay</a>
                                <div class="dropdown-menu" aria-labelledby="dropdownId">
                                    <a class="dropdown-item" href="#">Sân bay các tỉnh miền Bắc</a>
                                    <a class="dropdown-item" href="#">Sân bay các tỉnh miền Trung</a>
                                    <a class="dropdown-item" href="#">Sân bay các tỉnh miền Nam</a>
                                </div>
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link" href="#">Tuyến bay </a>
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link" href="#">Tin tức </a>
                            </li>
                            <li class="nav-item">
                                <button type="button" class="btn btn-light"><i class="fas fa-phone"></i> Hotline</button>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                        <div class="modal-footer">
                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                            <!--<a class="btn btn-primary" href="login.html">Logout</a> -->
                            <form action="<c:url value="/j_spring_security_logout" />" method="post">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <input type="submit" class="btn btn-warning" value="Logout" />
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <div class="wrap">
            <div class="wrap-admin" style="background-image:url(${bg})">
                <div class="container">
                     <section class="banner-area relative">
                    <div class="container contact-form">
                        <mvc:form method="POST" action="ticketInfo" modelAttribute="ticketInfo">
                            <c:choose>
                                <c:when test="${numberAdult > 0}">                         
                                    <h4>Thông tin cho người lớn</h4>
                                    <c:forEach var="i" begin="1" end="${numberAdult}">
                                        <mvc:hidden path="listId" value="${i}"/>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <mvc:input path="listNameAdultGo" class="form-control" placeholder="Enter your fullname"/>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <mvc:input path="listIdentify"  class="form-control" placeholder="Enter your Indetify Number"/>
                                                </div>
                                            </div>
                                        </div>    
                                    </c:forEach>
                                </c:when>
                            </c:choose>
                            <c:choose>
                                <c:when test="${numberChildren > 0}">
                                    <c:forEach var="i" begin="1" end="${numberChildren}">
                                        <h4>Thông tin cho Trẻ Em</h4>
                                        <mvc:hidden path="listId" value="${i}"/>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <mvc:input path="listNameChildrenGo" class="form-control" placeholder="Enter your Children Name"/>
                                                </div>
                                            </div>
                                        </div>    
                                    </c:forEach>
                                </c:when>        
                            </c:choose>              
                            <mvc:hidden path="flightId" value="${flight.flightID}"/>                
                            <mvc:hidden path="ticketClassId" value="${ticketClassId}"/>              
                            <mvc:hidden path="priceUnitAdult" value="${priceAdultUnit}"/>              
                            <mvc:hidden path="priceUnitChildren" value="${priceChildrenUnit}"/>              
                            <mvc:hidden path="bookingId" value="${booking.bookingId}"/>              
                            <mvc:button class="btnRegister">Book</mvc:button>
                        </mvc:form>    
                    </div>
                     </section>
                </div>
            </div>
        </div>
        <div class="promotion">
            <div class="container">
                <h2 class="text-uppercase font-bolder">Ưu Đãi</h2>
                <div class="row blog">
                    <div class="col-md-12 mx-auto">
                        <div id="blogCarousel" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#blogCarousel" data-slide-to="0" class="active"></li>
                                <li data-target="#blogCarousel" data-slide-to="1"></li>
                            </ol>
                            <!-- Carousel items -->
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <a href="#">
                                                <img src="http://placehold.it/250x250" alt="Image" style="max-width:100%;">
                                            </a>
                                        </div>
                                        <div class="col-md-3">
                                            <a href="#">
                                                <img src="http://placehold.it/250x250" alt="Image" style="max-width:100%;">
                                            </a>
                                        </div>
                                        <div class="col-md-3">
                                            <a href="#">
                                                <img src="http://placehold.it/250x250" alt="Image" style="max-width:100%;">
                                            </a>
                                        </div>
                                        <div class="col-md-3">
                                            <a href="#">
                                                <img src="http://placehold.it/250x250" alt="Image" style="max-width:100%;">
                                            </a>
                                        </div>
                                    </div>
                                    <!--.row-->
                                </div>
                                <!--.item-->

                                <div class="carousel-item">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <a href="#">
                                                <img src="http://placehold.it/250x250" alt="Image" style="max-width:100%;">
                                            </a>
                                        </div>
                                        <div class="col-md-3">
                                            <a href="#">
                                                <img src="http://placehold.it/250x250" alt="Image" style="max-width:100%;">
                                            </a>
                                        </div>
                                        <div class="col-md-3">
                                            <a href="#">
                                                <img src="http://placehold.it/250x250" alt="Image" style="max-width:100%;">
                                            </a>
                                        </div>
                                        <div class="col-md-3">
                                            <a href="#">
                                                <img src="http://placehold.it/250x250" alt="Image" style="max-width:100%;">
                                            </a>
                                        </div>
                                    </div>
                                    <!--.row-->
                                </div>
                                <!--.item-->

                            </div>
                            <!--.carousel-inner-->
                        </div>
                        <!--.Carousel-->

                    </div>
                </div>
            </div>
        </div>
        <div class="about-system">
            <div class="container">
                <div class="row">
                    <div class="contents col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                        <h3 class="about-title">
                            Giới thiệu
                        </h3>
                        <p class=" about-text">
                            Đà Nẵng là thành phố lớn thứ 3 tại Việt Nam vớ nhiều điểm đến du lịch hấp dẫn thu hút đông đảo khách du lịch trong và ngoài nước như Bà Nà Hill, Những cây cầu đẹp nhất Đà Nẵng, Biển Mỹ Khê, Vòng Xoay Măt Trời,….Chính vì thế mà nhu cầu mua vé máy bay tại
                            Đà Nẵng ngày một tăng cao. Để có thể dễ dàng kiếm thu nhập từ việc bán vé máy bay tại khu vực này một cách dễ dàng và được hỗ trợ tốt nhất trong quá trình đặt vé hãy ứng tuyển đại lý vé máy bay cấp 2 tại Đà Nẵng để nhật được nhiều dịch vụ ưu đãi mà Việt
                            Mỹ mang lại nhé. 
                        </p>
                    </div>
                    <div class="contents col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                        <h3 class="about-title">
                            Cam kết
                        </h3>
                        <p class=" about-text">
                            - Dịch vụ đặt vé hoàn hảo <br>
                            - Phục vụ quý khách 24/7 <br>
                            - Cam kết giá vé đi Đà Nẵng rẻ nhất <br>
                            - Giao vé tại địa chỉ khách hàng <br>
                            - Tư vấn để chọn đường bay tốt, giá tốt <br>
                            - Luôn gọi điện báo trước khi khởi hành <br>
                            - Tư vấn hỗ trợ miễn phí các thông tin liên quan <br>
                            - Chủ động báo khách khi chuyến bay thay đổi <br>
                        </p>
                    </div>
                    <div class="contents col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                        <h3 class="about-title">
                            Ưu đãi
                        </h3>
                        <p class=" about-text">
                            Vì nhiều lý do, có một số vé máy bay khuyến mãi được các hãng hàng không Vietnam Airlines, Vietjet, Jetstar, Air Asia tung ra trong một ngày bay nhất định, và điều này, chính các booker bán vé máy bay của đại lý cũng không biết được (vì có quá nhiều ngày,
                            nhiều chuyến). Nếu quý khách tình cờ phát hiện được ngày nào, chuyến bay nào có vé giá rẻ, khuyến mãi, và có nhu cầu book đúng vé máy bay đó, hãy gọi cho chúng tôi, chúng tôi sẽ book hộ bạn vé khuyến mãi, giao vé vé máy bay giá rẻ tận nơi và chỉ thu phí phục vụ.
                        </p>
                    </div>
                    <div class="contents col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                        <h3 class="about-title">
                            Lời cảm ơn
                        </h3>
                        <p class=" about-text">
                            Sự phát triển của công ty PC Airline phụ thuộc vào sự quan tâm và ủng hộ của quý khách. Trong suốt thời gian qua và hy vọng trong thời gian tới công ty sẽ có nhiều chính sách tốt nhất để mang đến sự hài lòng cho khách hàng.
                            <br>Xin trân trọng cảm ơn!
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer>
        <div class="footer">
            <div class="container">
                <div class="row">
                    <div class=" about-block col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
                        <h3>
                            About us
                        </h3>
                        <ul>
                            <li class=" contents-list">
                                <a href="">
                                    <i class="fas fa-arrow-circle-right links"></i> Giới thiệu trung tâm hàng không
                                </a>
                            </li>
                            <li class=" contents-list">
                                <a href="">
                                    <i class="fas fa-arrow-circle-right links"></i> Tuyển dụng
                                </a>
                            </li>
                            <li class=" contents-list">
                                <a href="">
                                    <i class="fas fa-arrow-circle-right links"></i> Liên Hệ
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class=" about-block col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
                        <h3>
                            Hỗ trợ
                        </h3>
                        <ul class="">
                            <li class=" contents-list">
                                <a href="">
                                    <i class="fas fa-arrow-circle-right links"></i> Hướng dẫn đăng kí</a>
                            </li>
                            <li class=" contents-list">
                                <a href="">
                                    <i class="fas fa-arrow-circle-right links"></i> Quy chế trung tâm hàng không
                                </a>
                            </li>
                            <li class=" contents-list">
                                <a href="">
                                    <i class="fas fa-arrow-circle-right links"></i> Liên Hệ
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class=" about-block col-12 col-sm-12 col-md-4 col-lg-4 col-xl-4">
                        <h3>
                            Kết nối với chúng tôi
                        </h3>
                        <ul class="mxh">
                            <li class="  contents-list">
                                <a href="">
                                    <i class="fab fa-facebook-square  mxh-icon"></i>
                                </a>
                            </li>
                            <li class=" contents-list">
                                <a href="">
                                    <i class="fab fa-instagram mxh-icon"></i>
                                </a>
                            </li>
                            <li class=" contents-list">
                                <a href="">
                                    <i class="fab fa-twitter-square mxh-icon"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <hr style="border:0.5px solid white; width: 50%; margin: auto;">
            <div class="container">
                <div class="row">
                    <span class="col-xl-12 col-md-12 col-sm-12 col-lg-12 col-12 text-center">©2020 by Chính & Phương</span>
                </div>
            </div>
        </div>
    </footer>
    <script src="<c:url value="/resources/public/assets/js/jquery.jcarousel.min.js"/>"></script>
    <script src="<c:url value="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"/>"></script>
    <script src="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"/>"></script>
    <script src="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"/>"></script>
    <script  src="<c:url value="/resources/public/assets/js/main.js"/>"></script>
    <script src="<c:url value="https://code.jquery.com/ui/1.8.22/jquery-ui.js"/>"></script>
</body>
</html>