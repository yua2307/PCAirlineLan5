<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<s:url var="bg" value="./resources/public/assets/img/background.jpg"/>
<%@page import="javax.servlet.http.HttpSession"%>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <title>Index Page</title>
        <!-- Google Fonts -->
        <link href="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>" rel="stylesheet"  type="text/css" >
        <link  href="<c:url value="https://use.fontawesome.com/releases/v5.7.0/css/all.css" />" rel="stylesheet"  type="text/css" >

        <link href="<c:url value="resources/public/assets/css/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet"  >
        <!--    load shortcut icon-->

        <link rel="shortcut icon" href="<c:url value="resources/public/assets/img/logox.png"/>"   type="image/x-icon">
        <link rel="icon" href="<c:url value="resources/public/assets/img/logox.png" />"    type="image/x-icon">
    <!--    <link  href="<c:url value="glider.css"/>" rel="stylesheet" stype="text/css">-->
        <link href="<c:url value="resources/css/main.css"/>" rel="stylesheet" >

        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
        <link rel="stylesheet" href="<c:url value="resources/css/linearicons.css"/>">
        <link rel="stylesheet" href="<c:url value="resources/css/font-awesome.min.css"/>" >
        <link rel="stylesheet" href="<c:url value="resources/css/bootstrap.css"/>">
        <link rel="stylesheet" href="<c:url value="resources/css/magnific-popup.css"/>">
        <link rel="stylesheet" href="<c:url value="resources/css/jquery-ui.css"/>">			
        <link rel="stylesheet" href="<c:url value="resources/css/nice-select.css"/>">						
        <link rel="stylesheet" href="<c:url value="resources/css/animate.min.css"/>">
        <link rel="stylesheet" href="<c:url value="resources/css/owl.carousel.css"/>">
        <link rel="stylesheet" href="<c:url value="resources/css/ticketInfo.css"/>">

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
                        <section class="container">
                            <h3>Chọn loại vé và số ghế cho chuyến bay của bạn</h3>
                            <div class="row">
                                <article class="card fl-left">
                                    <section class="date">
                                        <c:if test = "${flight.aircaft.getAirlineBrand().getBrandName()=='Vietnamairlines'}">
                                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR-0-GRXnNqv6pAcslQUp-d2VkfF7_2DQoaVA&usqp=CAU" class="user-avatar"> 
                                            <h3>Vietnam Airlines</h3>
                                        </c:if>
                                        <c:if test = "${flight.aircaft.getAirlineBrand().getBrandName()=='Vietjet'}">
                                            <img src="https://brasol.vn/public/uploads/1571733729-logo-vietjet-air.jpg" class="user-avatar"> 
                                            <h3>Vietjet Airlines</h3>
                                        </c:if>
                                        <c:if test = "${flight.aircaft.getAirlineBrand().getBrandName()=='BambooAirway'}">
                                            <img src="https://upload.wikimedia.org/wikipedia/en/e/ed/Bamboo-logo.png" class="user-avatar"> 
                                            <h3>Bamboo airways</h3>
                                        </c:if>
                                    </section>
                                    <section class="card-cont1">
                                        <div id="info">
                                            <h4>From: ${flight.flightRoute.getDeparturePlace().getCityName()}</h4>
                                            <h4>To: ${flight.flightRoute.getArrivalPlace().getCityName()}</h4>
                                            <div class="even-date">
                                                <i class="fa fa-calendar"></i>
                                                <time>
                                                    <span>Departure time: ${flight.departureTime}</span>                                               
                                                </time>
                                            </div>
                                            <div class="even-date">
                                                <i class="fa fa-calendar"></i>
                                                <time>
                                                    <span>Arrival time: ${flight.arrivalTime}</span>                                               
                                                </time>

                                            </div>
                                            <div class="even-info">
                                                <i class="fa fa-map-marker"></i>
                                                <p>Standard Price: <fmt:formatNumber type="number" maxFractionDigits="2" value="${flight.flightRoute.getStandardPrice()}" /> VNĐ</p>
                                            </div>
                                            <div class="even-info">
                                                <mvc:form action="${pageContext.request.contextPath}/customer/bookTicket" method="POST" modelAttribute="ticketBooked"> 

                                                    <mvc:hidden path="flightId" value="${flight.flightID}"/>
                                                    <mvc:radiobutton path="seatClassId"  name="radioPrice" value="1" onclick="limitTicket();totalPrice();statusButton()" id="radioFirstClass" />
                                                    <label>First Class </label>

                                                    <mvc:radiobutton path="seatClassId" name="radioPrice" value="3" onclick="limitTicket();totalPrice();statusButton()" id="radioEconomyClass" />
                                                    <label>Economy Class</label>

                                                    <mvc:radiobutton path="seatClassId" name="radioPrice" value="2" onclick="limitTicket();totalPrice();statusButton()" id="radioBusinessClass" />
                                                    <label>Business Class</label>
                                                    <br>
                                                    <mvc:input path="numberAdult" max="200" min="0"  oninput="limitTicket();totalPrice();statusButton()" value="0" type="number" name="radioPriceType" onchange="showTotalPrice()" id="radioAdultType" placeholder="0"/>
                                                    <label>Adult</label><br>
                                                    <mvc:input path="numberChildren" max="200" min="0"  oninput="limitTicket();totalPrice();statusButton()" value="0" type="number" name="radioPriceType" onchange="showTotalPrice()" id="radioChildrenType" placeholder="0"/>
                                                    <label>Children</label> 
                                                    <h4>Total Price : <label id="totalPrice" value="${totalPrice}"> </label></h4>
                                                    <mvc:hidden id="priceAdultUnit" path="priceAdultUnit" />
                                                    <mvc:hidden id="priceChildrenUnit" path="priceChildrenUnit" />
                                                    <p id="errorNumberTicket" style="display:none;">Khong du slot!</p>
                                                    <mvc:button style="
                                                                text-decoration: none;
                                                                width: 80px;
                                                                height: 30px;
                                                                background-color: #037FDD;
                                                                color: #fff;
                                                                text-align: center;
                                                                line-height: 35px;
                                                                border-radius: 2px;
                                                                position: absolute;
                                                                right: 10px;
                                                                bottom: 10px" id="buttonBook" disabled="true">Book
                                                    </mvc:button>
                                                </mvc:form> 
                                            </div>
                                        </div>
                                    </section>		
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
                            </body>
                            <script src="<c:url value="resources/public/assets/js/jquery.jcarousel.min.js"/>"></script>
                            <script src="<c:url value="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"/>"></script>
                            <script src="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"/>"></script>
                            <script src="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"/>"></script>
                            <script  src="<c:url value="resources/public/assets/js/main.js"/>"></script>
                            <script src="<c:url value="https://code.jquery.com/ui/1.8.22/jquery-ui.js"/>"></script>
                            <script lang="JavaScript">
                                function totalPrice() {
                                    //lấy biến rateClass
                                    var rateClass;
                                    if (document.getElementById("radioFirstClass").checked == true) {
                                        rateClass = ${rateFirst};
                                    }
                                    if (document.getElementById("radioEconomyClass").checked == true) {
                                        rateClass = ${rateEconomy};
                                    }
                                    if (document.getElementById("radioBusinessClass").checked == true) {
                                        rateClass = ${rateBusiness};
                                    }
                                    //lấy biến số người
                                    var numberAdult = document.getElementById("radioAdultType").value;
                                    var numberChildren = document.getElementById("radioChildrenType").value;
                                    var numberPeople = numberAdult + numberChildren;
                                    //số tiền cho mỗi lứa tuổi
                                    var adultUnitPrice = ${flight.flightRoute.getStandardPrice()} * rateClass * ${rateAdult};
                                    var childrenUnitPrice = ${flight.flightRoute.getStandardPrice()} * rateClass * ${rateChildren};
                                    // số tiền cho tổng lứa tuổi
                                    var adultPrice = ${flight.flightRoute.getStandardPrice()} * rateClass * numberAdult * ${rateAdult};
                                    var childrenPrice = ${flight.flightRoute.getStandardPrice()} * rateClass * numberChildren * ${rateChildren};

                                    const formatter = new Intl.NumberFormat('vi-VN', {
                                        style: 'currency',
                                        currency: 'VND',
                                        minimumFractionDigits: 0
                                    })
                                    var totalPrice = formatter.format(adultPrice + childrenPrice);
                                    if (!Number.isNaN(totalPrice)) {
                                        document.getElementById("totalPrice").innerHTML = totalPrice;
                                        document.getElementById("priceAdultUnit").value = adultUnitPrice;
                                        document.getElementById("priceChildrenUnit").value = childrenUnitPrice;

                                    } else {
                                        document.getElementById("totalPrice").innerHTML = "Vui lòng chọn đủ hạng vé và số lượng người!";
                                    }
                                    //document.getElementById("totalPrice").innerHTML = totalPrice;
                                }
                                function limitTicket() {
                                    var numberAdult = document.getElementById("radioAdultType").value;
                                    var numberChildren = document.getElementById("radioChildrenType").value;
                                    var numberPeople = numberAdult + numberChildren;
                                    if (numberPeople > ${flight.availableSeat} * 10 -10) {
                                        document.getElementById("errorNumberTicket").style.display = "block";
                                    } else {
                                        document.getElementById("errorNumberTicket").style.display = "none";
                                    }
                                }
                                function statusButton() {
                                    var rateClass;
                                    if (document.getElementById("radioFirstClass").checked == true) {
                                        rateClass = ${rateFirst};
                                    }
                                    if (document.getElementById("radioEconomyClass").checked == true) {
                                        rateClass = ${rateEconomy};
                                    }
                                    if (document.getElementById("radioBusinessClass").checked == true) {
                                        rateClass = ${rateBusiness};
                                    }

                                    //lấy biến số người
                                    var numberAdult = document.getElementById("radioAdultType").value;
                                    var numberChildren = document.getElementById("radioChildrenType").value;
                                    var numberPeople = numberAdult + numberChildren;

                                    //số tiền cho mỗi lứa tuổi
                                    var adultPrice = ${flight.flightRoute.getStandardPrice()} * rateClass * numberAdult * ${rateAdult};
                                    var childrenPrice = ${flight.flightRoute.getStandardPrice()} * rateClass * numberChildren * ${rateChildren};
                                    var totalPrice = adultPrice + childrenPrice;

                                    var numberAdult = document.getElementById("radioAdultType").value;
                                    var numberChildren = document.getElementById("radioChildrenType").value;
                                    var numberPeople = numberAdult + numberChildren;

                                    if (!Number.isNaN(totalPrice) && numberPeople <= ${flight.availableSeat} * 10)
                                    {
                                        document.getElementById("buttonBook").disabled = false;
                                    } else
                                        document.getElementById("buttonBook").disabled = true;
                                }
                            </script>
                            </html>