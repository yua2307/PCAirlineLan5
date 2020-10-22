
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<s:url var="bg" value="/resources/public/assets/img/background.jpg"/>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <title>Update information</title>
        <!-- Google Fonts -->
        <link href="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>" rel="stylesheet"  type="text/css" >
        <link  href="<c:url value="https://use.fontawesome.com/releases/v5.7.0/css/all.css" />" rel="stylesheet"  type="text/css" >

        <link href="<c:url value="/resources/public/assets/css/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet"  >
        <!--    load shortcut icon-->

        <link rel="shortcut icon" href="<c:url value="/resources/public/assets/img/logox.png"/>"   type="image/x-icon">
        <link rel="icon" href="<c:url value="/resources/public/assets/img/logox.png" />"    type="image/x-icon">
    <!--    <link  href="<c:url value="glider.css"/>" rel="stylesheet" stype="text/css">-->
        <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet" >
        <link href="<c:url value="/resources/css/signupCss.css"/>" rel="stylesheet" >
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
        <link rel="stylesheet" href="<c:url value="/resources/css/linearicons.css"/>">
        <link rel="stylesheet" href="<c:url value="/resources/css/font-awesome.min.css"/>" >
        <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css"/>">
        <link rel="stylesheet" href="<c:url value="/resources/css/magnific-popup.css"/>">
        <link rel="stylesheet" href="<c:url value="/resources/css/jquery-ui.css"/>">			
        <link rel="stylesheet" href="<c:url value="/resources/css/nice-select.css"/>">						
        <link rel="stylesheet" href="<c:url value="/resources/css/animate.min.css"/>">
        <link rel="stylesheet" href="<c:url value="/resources/css/owl.carousel.css"/>">
        <link rel="stylesheet" href="<c:url value="/resources/css/paymentReceipt.css"/>">
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
            <div class="container bootstrap snippets bootdeys">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="panel panel-default invoice" id="invoice">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-sm-6 top-left">
                                        <i class="fa fa-rocket"></i>
                                    </div>                             
                                    
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-xs-4 from" style="
    padding: 0px 470px 11px 20px"
">
                                        <p class="lead marginbottom">From : ${listTicket.get(0).flight.getFlightRoute().getDeparturePlace().getCityName()}</p>
                                        <p class="lead marginbottom">Sân Bay : ${listTicket.get(0).flight.getFlightRoute().getDeparturePlace().getAirportName()}</p>
                                        
                                        <p class="lead marginbottom">To : ${listTicket.get(0).flight.getFlightRoute().getArrivalPlace().getCityName()}</p
                                        <p class="lead marginbottom">Sân Bay : ${listTicket.get(0).flight.getFlightRoute().getArrivalPlace().getAirportName()}</p>
                                    </div>

                                    <div class="col-xs-4 text-right payment-details">
                                        <p class="lead marginbottom payment-info">Payment details</p>
                                        <p>Date: ${currentDate}</p>
                                        <p>Total Amount:  <fmt:formatNumber currencySymbol="VNĐ" minFractionDigits="0" value = "${booking.totalMoney}" type = "currency" /></p>
                                        <p>Account Name: ${sessionScope.username}</p>
                                    </div>

                                </div>
                                    <div class="col-lg-11 col-md-11 col-sm-11 col-xs-11">    
                                <div class="row table-row">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th style="width:5%" class="text-center">Mã Vé</th>
                                                <th style="width:30%">Tên người đi</th>
                                                <th class="text-right" style="width:10%">Giá vé</th>

                                            </tr>
                                        </thead>
                                        
                                        <tbody>
                                            <tr>
                                            <c:forEach var="ticket" items="${listTicket}">    
                                                <td class="text-center">1</td>
                                                <td>${ticket.namePersonBuyTicket}</td>
                                                <td class="text-right">
                                                     <fmt:formatNumber currencySymbol="VNĐ" minFractionDigits="0" value = "${ticket.price}" type = "currency" />
                                                </td>
                                            </tr>
                                            </c:forEach>
                                            <tr>
                                                <td></td>
                                                <td class="text-right"> Total Money : </td>
                                                <td class="text-right"><fmt:formatNumber currencySymbol="VNĐ" minFractionDigits="0" value = "${booking.totalMoney}" type = "currency" /> </td>
                                            </tr>
                                        </tbody>
                                        
                                    </table>
                                </div>
                                </div>        
                                <div class="row">
                                    <div class="col-xs-6 margintop">
                                        <p class="lead marginbottom">THANK YOU!</p>
                                     
                                        <a href="<c:url value="/customer/history"/>"><button class="btn btn-success" id="invoice-print" ><i class="fa fa-print"></i> Lịch sử thanh toán </button></a>
                                        
                                        <button class="btn btn-danger"><i class="fa fa-envelope-o"></i> Mail Invoice</button>
                                    </div>
                                    
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>    
        <br>
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
    <script src="<c:url value="/resources/public/assets/js/jquery.jcarousel.min.js"/>"></script>
    <script src="<c:url value="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"/>"></script>
    <script src="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"/>"></script>
    <script src="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"/>"></script>
    <script  src="<c:url value="/resources/public/assets/js/main.js"/>"></script>
    <script src="<c:url value="https://code.jquery.com/ui/1.8.22/jquery-ui.js"/>"></script>
</html>