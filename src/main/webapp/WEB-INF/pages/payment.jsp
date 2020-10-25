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

    <body class="theme-green" >
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
                        <a href="<c:url value="/customer/paymentMethod"/>">
                            <span>Phương thức thanh toán</span>
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

        <mvc:form action="payTicket" method="POST" modelAttribute="paymentInfo" > 
            <section class="content">
                <div class="container-fluid">
                    <div class="block-header align-center">
                        <h2>Phương thức thanh toán</h2>
                    </div>
                    <!-- Basic Table -->

                    <div class="row clearfix">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="card">
                                <div class="body table-responsive" style="padding:0px">
                                    <table class="table table-bordered table-striped">
                                        <thead class="btn-success">
                                            <tr class="text-center">                                           


                                                <th style="width: 15%">Tên người đi</th>
                                                <th style="width: 17%">Nơi Đi</th>
                                                <th style="width: 17%">Nơi Đến</th>
                                                <th style="width: 7%">Hạng vé</th>
                                                <th style="width: 7%">Loại vé</th>
                                                <th style="width: 10%">Giá</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="ticket" items="${listTicket}">
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
                                                    <td>${ticket.ticketType.getTicketTypeName()} </td> 
                                                    <td> ${ticket.ticketClass.getClassName()}</td> 
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

                    <!-- #END# Basic Table -->

                </div>
            </section>
            <div class="container" style="width:0px">

                <button style="margin-left: 100px" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Thanh Toán</button>

                <!-- Modal -->
                <div class="modal fade" id="myModal" role="dialog">
                    <div class="modal-dialog ">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>

                            </div>
                            <div class="modal-body">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-xs-10 col-md-5">
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h3 class="panel-title">
                                                        Payment Details
                                                    </h3>
                                                </div>
                                                <div class="panel-body">
                                                    <form role="form">
                                                        <div class="form-group">
                                                            <label for="cardNumber">
                                                                CARD NUMBER</label>
                                                            <div class="input-group">
                                                                <mvc:input path="creditCardNumber" type="text" class="form-control" id="cardNumber" placeholder="Valid Card Number" required="required" autofocus="autofocus" />
                                                                <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-xs-7 col-md-7">
                                                                <div class="form-group">
                                                                    <div class="col-xs-6 col-lg-10 pl-ziro">
                                                                        <label for="expityMonth">
                                                                            EXPIRY DATE</label>
                                                                    </div>
                                                                    <div class="col-xs-6 col-lg-6 pl-ziro" >
                                                                        <mvc:input path="month" type="number" min="1" max="12"  class="form-control" id="expityMonth" placeholder="MM" required="required" />
                                                                    </div>
                                                                    <div class="col-xs-6 col-lg-6 pl-ziro">
                                                                        <mvc:input path="year" type="number" min="2020" max="2024" class="form-control" id="expityYear" placeholder="YY" required="required" /></div>
                                                                </div>
                                                            </div>
                                                            <div class="col-xs-5 col-md-5 pull-right">
                                                                <div class="form-group">
                                                                    <label for="cvCode">
                                                                        CV CODE</label>
                                                                        <mvc:password path="CCV" class="form-control" id="cvCode" placeholder="CV" required="required" />
                                                                </div>
                                                            </div>
                                                            <div class="col-xs-12 col-md-12 ">
                                                                <div class="form-group">
                                                                    <label for="name">
                                                                        Name On Card</label>
                                                                        <mvc:input path="nameOnCard" type="text" class="form-control" id="name" placeholder="Name On Card" required="required" />
                                                                </div>
                                                            </div>    
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                            <ul class="nav nav-pills nav-stacked">
                                                <li class="active"><a href="#"><span class="badge pull-right">
                                                            <fmt:formatNumber currencySymbol="VNĐ" minFractionDigits="0" value = "${listTicket.get(0).booking.getTotalMoney()}" type = "currency" />
                                                        </span>Final Payment</a>
                                                </li>
                                            </ul>
                                            <ul>
                                                <li>
                                                    <a href="<c:url value="/customer/paymentMethod"/>">
                                                        <span> Thêm phương thức thanh toán</span>
                                                    </a>
                                                </li>
                                            </ul>
                                            <br>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="modal-footer">
                                <mvc:button class="btn btn-success m-t-15 w-90 waves-effect">Pay</mvc:button>   
                                    <button type="button" class="btn btn-warning m-t-15 w-90 waves-effect">Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </mvc:form>   
        <h1 style="display:none" id="messagesError"> ${message}</h1>
    </body>
    <!-- Jquery Core Js -->

</script>

<script src="<c:url value="/resources/plugins/jquery/jquery.min.js" />"></script>
<script src="<c:url value="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js" />"></script>
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
    $('input[type="hidden"][value="on"]').remove();</script>
<script>
    function formatVND(var number) {
    return  number.toLocaleString('vi-VN', {currency: 'VND', style: 'currency'});
    }
</script>

<script type="text/javascript">
        var error = document.getElementById("messagesError");
           window.onload = function(){
              if (error!=null) alert("${message}");
           }
       
</script>
</html>
