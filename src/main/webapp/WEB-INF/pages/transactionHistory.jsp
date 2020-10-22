<%-- 
    Document   : index
    Created on : 7 thg 8, 2020, 13:09:51
    Author     : macbookpro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%> 
<%@page import="javax.servlet.http.HttpSession"%>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <title>Ticket Payment</title>
        <!-- Favicon-->
        <link rel="icon" href="/resources/images/favicon.ico" type="image/x-icon">

        <!-- Google Fonts -->
        <link href="<c:url value="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" />"rel="stylesheet" type="text/css">
        <link href="<c:url value="https://fonts.googleapis.com/icon?family=Material+Icons"/>" rel="stylesheet" type="text/css">
        <link href="<c:url value="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"/>" rel="stylesheet" type="text/css">

        <!-- Bootstrap Core Css -->
        <link href="<c:url value="/resources/plugins/bootstrap/css/bootstrap.css"/>" rel="stylesheet">

        <!-- Waves Effect Css -->
        <link href="<c:url value="/resources/plugins/node-waves/waves.css" />" rel="stylesheet" />

        <!-- Animation Css -->
        <link href="<c:url value="/resources/plugins/animate-css/animate.css" />"rel="stylesheet" />

        <!-- Custom Css -->
        <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">

        <!-- AdminBSB Themes. You can choose a theme from css/themes instead of get all themes -->
        <link href="<c:url value="/resources/css/themes/theme-green.css" />" rel="stylesheet" />

        <link href="<c:url value="/resources/css/custom.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/css/paymentDetail.css" />" rel="stylesheet">


    </head>

    <body class="theme-green">
        <!-- Page Loader -->
        <div class="page-loader-wrapper">
            <div class="loader">
                <div class="preloader">
                    <div class="spinner-layer pl-green">
                        <div class="circle-clipper left">
                            <div class="circle"></div>
                        </div>
                        <div class="circle-clipper right">
                            <div class="circle"></div>
                        </div>
                    </div>
                </div>
                <p>Please wait...</p>
            </div>
        </div>
        <!-- #END# Page Loader -->
        <!-- Overlay For Sidebars -->
        <div class="overlay"></div>
        <!-- #END# Overlay For Sidebars -->
        <!-- Search Bar -->
        <div class="search-bar">
            <div class="search-icon">
                <i class="material-icons">search</i>
            </div>
            <input type="text" placeholder="START TYPING...">
            <div class="close-search">
                <i class="material-icons">close</i>
            </div>
        </div>
        <!-- #END# Search Bar -->
        <!-- Top Bar -->
        <nav class="navbar">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a href="javascript:void(0);" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false"></a>
                    <a href="javascript:void(0);" class="bars"></a>
                    <a class="navbar_brand" href="<c:url value="/admin/trang_chu"/>"></a>
                </div>
            </div>
        </nav>
        <!-- #Top Bar -->
        
            <!-- Left Sidebar -->
            <aside id="leftsidebar" class="sidebar">
                <!-- Menu -->
               <div class="menu">
                    <ul class="list">
                        <li class="header">MENU</li>
                        <li>
                            <a href="<c:url value="/index"/>">
                                <span>Trang chủ</span>
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value="/userInformation"/>">
                                <span>Thông tin cá nhân</span>
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value="/customer/history"/>">
                                <span>Lịch sử giao dịch</span>
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value="/changePassword/"/>">
                                <span>Đổi mật khẩu</span>
                            </a>
                        </li>
                    </ul>
                </div>
                <!-- #Menu -->
                <!-- Footer -->
                <div class="legal">
                    <div class="copyright">
                        &copy; 2020 <a href="javascript:void(0);">Phương & Chính</a>.
                    </div>
                    <div class="version">
                        <b>Version: </b> 1.0.0
                    </div>
                </div>
                <!-- #Footer -->
            </aside>
            <!-- #END# Left Sidebar -->
              
        
            <section class="content">
                <div class="container-fluid">
                    <div class="block-header align-center">
                        <h2>Lịch sử thanh toán</h2>
                    </div>
                    <!-- Basic Table -->
                    <c:forEach var="booking" items="${listBooking}">
                    <div class="row clearfix">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="card">
                                <div class="body table-responsive" style="padding:0px">
                                    <table class="table table-bordered table-striped">
                                        <h3> <b> Ngày đặt vé : </b> <fmt:formatDate value="${booking.paymentDate}" pattern="dd-MM-YYYY HH:mm aa"/>     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                 Ngày bay : <fmt:formatDate value="${booking.listTicket.get(0).flight.getDepartureTime()}" pattern="dd-MM-YYYY HH:mm aa"/></h3>
                                        <thead class="btn-success">
                                            <tr class="text-center">                                           
                                                <th style="width: 15%">Tên người đi</th>
                                                <th style="width: 17%">Nơi Đi</th>
                                                <th style="width: 17%">Nơi Đến</th>
                                                <th style="width: 7%">Ngày đặt vé</th>
                                                <th style="width: 7%">Ngày bay</th>
                                                <th style="width: 10%">Giá</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="ticket" items="${booking.listTicket}">
                                              <tr>
                                                    <td> ${ticket.namePersonBuyTicket}</td>
                                                    <td> ${ticket.flight.getFlightRoute().getDeparturePlace().getCityName()}
                                                        <br>
                                                        Sân bay ${ticket.flight.getFlightRoute().getDeparturePlace().getAirportName()}
                                                    </td>
                                                    <td> ${ticket.flight.getFlightRoute().getArrivalPlace().getCityName()}
                                                        <br>
                                                        Sân bay ${ticket.flight.getFlightRoute().getArrivalPlace().getAirportName()}
                                                    </td>
                                                    <td><fmt:formatDate value="${ticket.dateBuyTicket}" pattern="HH:mm aa"/>  <fmt:formatDate value="${ticket.dateBuyTicket}" pattern="dd-MM-YYYY"/> </td> 
                                                    <td><fmt:formatDate value="${ticket.flight.getDepartureTime()}" pattern="HH:mm aa"/>  <fmt:formatDate value="${ticket.flight.getDepartureTime()}" pattern="dd-MM-YYYY"/> </td> 
                                                    <td> 
                                                        <fmt:formatNumber currencySymbol="VNĐ" minFractionDigits="0" value = "${ticket.price}" type = "currency" />
                                                    </td>
                                                </tr>    
                                           </c:forEach>
                                                <tr>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td> Tổng tiền : </td>
                                                    <td>  <fmt:formatNumber currencySymbol="VNĐ" minFractionDigits="0" value = "${booking.totalMoney}" type = "currency" /></td>
                                                </tr>     
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                    <!-- #END# Basic Table -->

                </div>
            </section>                
    </body>
    <!-- Jquery Core Js -->

</script>

<script src="<c:url value="/resources/plugins/jquery/jquery.min.js" />"></script>

<!-- Bootstrap Core Js -->
<script src="<c:url value="/resources/plugins/bootstrap/js/bootstrap.js" />"></script>

<!-- Select Plugin Js -->
<script src="<c:url value="/resources/plugins/bootstrap-select/js/bootstrap-select.js"/>"></script>

<!-- Slimscroll Plugin Js -->
<script src="<c:url value="/resources/plugins/jquery-slimscroll/jquery.slimscroll.js"/>"></script>

<!-- Waves Effect Plugin Js -->
<script src="<c:url value="/resources/plugins/node-waves/waves.js"/>"></script>

<!-- Custom Js -->
<script src="<c:url value="/resources/js/admin.js"/>"></script>
<script src="<c:url value="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="//code.jquery.com/jquery-1.11.1.min.js"/>"></script>
<script>
    $('input[type="hidden"][value="on"]').remove();
</script>
<script>
    function formatVND(var number) {
        return  number.toLocaleString('vi-VN', {currency: 'VND', style: 'currency'});
    }
</script>
<script>
    function getCurrentYear(){
       var year = currentTime.getFullYear()
    }
</script>
</html>
