<%-- 
    Document   : changePassword
    Created on : Oct 19, 2020, 5:46:05 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <title>Change password</title>
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
            <div class="container bootstrap snippets bootdey">
                <div class="col-md-16 col-sm-12 col-xs-12">
                    <div class="row">
                        <div class="col-md-12">
                            <br><br><br>
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-12">
                                        <mvc:form action="changePassProcess" method="POST" id="fileForm" role="form" modelAttribute="changePassInfo">
                                            <div class="form-group">
                                                <label for="password"><span class="req">* </span> Current password:  </label><p style="color:red;">${ms}</p>
                                                <mvc:password path="currentPassword" required="required" name="password" class="form-control inputpass" minlength="4" maxlength="16" /> </p>
                                            </div>
                                            <div class="form-group">
                                                <label for="password"><span class="req">* </span>New password: </label>
                                                <input required name="password" type="password" class="form-control inputpass" minlength="4" id="pass1" /> </p>

                                            </div>

                                            <div class="form-group">
                                                <label><span class="req">* </span>New password confirm: </label>
                                                <mvc:password required="required" path="newPassword" class="form-control inputpass" minlength="4" placeholder="Enter again to validate"  id="pass2" onkeyup="checkPass(); return false;" />
                                                <span id="confirmMessage" class="confirmMessage"></span>
                                            </div> 

                                            <div class="form-group">

                                                <?php //$date_entered = date('m/d/Y H:i:s'); ?>
                                                <input type="hidden" value="<?php //echo $date_entered; ?>" name="dateregistered">
                                                <input type="hidden" value="0" name="activate" />
                                                <hr>
                                            </div>

                                            <div class="form-group">
                                                <mvc:button class="btn btn-success" type="submit" name="submit_reg">Change password</mvc:button>
                                                </div>
                                                <h5>You will receive an email to complete the registration and validation process. </h5>
                                                <h5>Be sure to check your spam folders. </h5>
                                                </fieldset>
                                        </mvc:form>
                                        <script type="text/javascript">
                                            document.getElementById("field_terms").setCustomValidity("Please indicate that you accept the Terms and Conditions");
                                        </script>
                                    </div><!-- ends col-6 -->



                                </div>
                            </div>
                        </div> </div>
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
        <script src="<c:url value="/resources/public/assets/js/jquery.jcarousel.min.js"/>"></script>
        <script src="<c:url value="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"/>"></script>
        <script src="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"/>"></script>
        <script src="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"/>"></script>
        <script  src="<c:url value="/resources/public/assets/js/main.js"/>"></script>
        <script src="<c:url value="https://code.jquery.com/ui/1.8.22/jquery-ui.js"/>"></script>
        <script language="JavaScript">
                                                    function checkPass()
                                                    {

                                                        var pass1 = document.getElementById('pass1');
                                                        var pass2 = document.getElementById('pass2');
                                                        var message = document.getElementById('confirmMessage');
                                                        //Set the colors we will be using ...
                                                        var goodColor = "#66cc66";
                                                        var badColor = "#ff6666";
                                                        if (pass1.value == pass2.value) {

                                                            pass2.style.backgroundColor = goodColor;
                                                            message.style.color = goodColor;
                                                            message.innerHTML = "Passwords Match"
                                                        } else {

                                                            pass2.style.backgroundColor = badColor;
                                                            message.style.color = badColor;
                                                            message.innerHTML = "Passwords Do Not Match!"
                                                        }
                                                    }
                                                    function validatephone(phone)
                                                    {
                                                        var maintainplus = '';
                                                        var numval = phone.value
                                                        if (numval.charAt(0) == '+')
                                                        {
                                                            var maintainplus = '';
                                                        }
                                                        curphonevar = numval.replace(/[\\A-Za-z!"£$%^&\,*+_={};:'@#~,.Š\/<>?|`¬\]\[]/g, '');
                                                        phone.value = maintainplus + curphonevar;
                                                        var maintainplus = '';
                                                        phone.focus;
                                                    }
// validates text only
                                                    function Validate(txt) {
                                                        txt.value = txt.value.replace(/[^a-zA-Z-'\n\r.]+/g, '');
                                                    }
// validate email
                                                    function email_validate(email)
                                                    {
                                                        var regMail = /^([_a-zA-Z0-9-]+)(\.[_a-zA-Z0-9-]+)*@([a-zA-Z0-9-]+\.)+([a-zA-Z]{2,3})$/;
                                                        if (regMail.test(email) == false)
                                                        {
                                                            document.getElementById("status").innerHTML = "<span class='warning'>Email address is not valid yet.</span>";
                                                        } else
                                                        {
                                                            document.getElementById("status").innerHTML = "<span class='valid'>Thanks, you have entered a valid Email address!</span>";
                                                        }
                                                    }
// validate date of birth
                                                    function dob_validate(dob)
                                                    {
                                                        var regDOB = /^(\d{1,2})[-\/](\d{1,2})[-\/](\d{4})$/;
                                                        if (regDOB.test(dob) == false)
                                                        {
                                                            document.getElementById("statusDOB").innerHTML = "<span class='warning'>DOB is only used to verify your age.</span>";
                                                        } else
                                                        {
                                                            document.getElementById("statusDOB").innerHTML = "<span class='valid'>Thanks, you have entered a valid DOB!</span>";
                                                        }
                                                    }
// validate address
                                                    function add_validate(address)
                                                    {
                                                        var regAdd = /^(?=.*\d)[a-zA-Z\s\d\/]+$/;
                                                        if (regAdd.test(address) == false)
                                                        {
                                                            document.getElementById("statusAdd").innerHTML = "<span class='warning'>Address is not valid yet.</span>";
                                                        } else
                                                        {
                                                            document.getElementById("statusAdd").innerHTML = "<span class='valid'>Thanks, Address looks valid!</span>";
                                                        }
                                                    }
        </script>
    </body>
</html>
