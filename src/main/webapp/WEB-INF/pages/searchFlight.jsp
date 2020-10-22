<%@page import="com.mycompany.entity.Flight"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<s:url var="bg" value="./resources/public/assets/img/background.jpg"/>
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
        <link href="<c:url value="/resources/css/listFlight.css"/>" rel="stylesheet" >
        <!-- Google Fonts -->
        <link href="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>" rel="stylesheet"  type="text/css" >
        <link  href="<c:url value="https://use.fontawesome.com/releases/v5.7.0/css/all.css" />" rel="stylesheet"  type="text/css" >

        <link href="<c:url value="/resources/public/assets/css/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet"  >
        <!--    load shortcut icon-->

        <link rel="shortcut icon" href="<c:url value="/resources/public/assets/img/logox.png"/>"   type="image/x-icon">
        <link rel="icon" href="<c:url value="/resources/public/assets/img/logox.png" />"    type="image/x-icon">
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
                <div class="container bootstrap snippets bootdey">
                    <div class="overlay overlay-bg"></div>
                    <div class="col-md-16 col-sm-12 col-xs-12">
                        <div class="row">
                            <div class="col-md-12">
                                <c:choose >
                                    <c:when test="${listSearch.size() ==0}" >
                                        <div class="widget-box">
                                            <div class="widget-header bordered-bottom bordered-themesecondary">
                                                <i class="widget-icon fa fa-tags themesecondary"></i>

                                                <h2 class="widget-caption themesecondary">Date: ${Date} </h2>
                                            </div>
                                            <div class="widget-body">
                                                <div class="widget-main no-padding">
                                                    <div class="tickets-container">
                                                        <ul class="tickets-list">
                                                            <li class="ticket-item">
                                                                <div class="row">
                                                                    <div class="ticket-user col-md-12 col-sm-12">
                                                                        <span class="user-company">There is no available flight  with your search</span>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div><!--Widget Header-->
                                    </c:when>
                                    <c:otherwise >
                                        <div class="widget-box">
                                            <div class="widget-header bordered-bottom bordered-themesecondary">
                                                <i class="widget-icon fa fa-tags themesecondary"></i>
                                                <h2 class="widget-caption themesecondary">Date: ${Date} </h2>
                                            </div><!--Widget Header-->
                                            <div class="widget-body">
                                                <div class="widget-main no-padding">
                                                    <div class="tickets-container">
                                                        <ul class="tickets-list">
                                                            <c:forEach var="flight" items="${listSearch}">
                                                                <li class="ticket-item">
                                                                    <div class="row">
                                                                        <div class="ticket-user col-xl-5 col-lg-5 col-md-6 col-sm-12">
                                                                            <c:if test = "${flight.aircaft.getAirlineBrand().getBrandName()=='Vietnamairlines'}">
                                                                                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR-0-GRXnNqv6pAcslQUp-d2VkfF7_2DQoaVA&usqp=CAU" class="user-avatar"> 
                                                                            </c:if>
                                                                            <c:if test = "${flight.aircaft.getAirlineBrand().getBrandName()=='Vietjet'}">
                                                                                <img src="https://brasol.vn/public/uploads/1571733729-logo-vietjet-air.jpg" class="user-avatar"> 
                                                                            </c:if>
                                                                            <c:if test = "${flight.aircaft.getAirlineBrand().getBrandName()=='BambooAirway'}">
                                                                                <img src="https://upload.wikimedia.org/wikipedia/en/e/ed/Bamboo-logo.png" class="user-avatar"> 
                                                                            </c:if>
                                                                            <span class="user-at">From</span>
                                                                            <span class="user-company">${flight.flightRoute.getDeparturePlace().getCityName()}</span>
                                                                            <span class="user-at">to</span>
                                                                            <span class="user-company">${flight.flightRoute.getArrivalPlace().getCityName()}</span>
                                                                        </div>
                                                                        <div class="ticket-time col-xl-3 col-lg-3 col-md-6 col-sm-12 col-xs-12">
                                                                            <div class="divider hidden-md hidden-sm hidden-xs"></div>
                                                                            <i class="fa fa-clock-o"></i>
                                                                            <span class="time"><fmt:formatDate value="${flight.departureTime}" pattern="HH:mm:ss" /> - <fmt:formatDate value="${flight.arrivalTime}" pattern="HH:mm:ss" /> </span>
                                                                        </div>
                                                                        <div class="ticket-type col-xl-2 col-lg-2 col-md-6 col-sm-6 col-xs-12">
                                                                            <span class="divider hidden-xs"></span>
                                                                            <span class="type">Available: ${flight.availableSeat}/${flight.totalSeat}</span>
                                                                        </div>
                                                                        <div class="ticket-type col-xl-2 col-lg-2 col-md-6 col-sm-6 col-xs-12">
                                                                            <span class="divider hidden-xs"></span>
                                                                            <span class="type">
                                                                                <fmt:formatNumber currencySymbol="VNĐ" minFractionDigits="0" value = "${flight.flightRoute.getStandardPrice()}" type = "currency" />
                                                                            </span>
                                                                        </div>
                                                                        <c:url var="showInfoLink" value="showInfoTicket">
                                                                            <c:param name="flightId" value="${flight.flightID}" />
                                                                        </c:url>
                                                                        <div class="ticket-state bg-palegreen">
                                                                            <a href="${showInfoLink}"><i class="fas fa-arrow-right"></i></a>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                            </c:forEach>
                                                        </c:otherwise>
                                                    </c:choose>  
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div> </div>
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