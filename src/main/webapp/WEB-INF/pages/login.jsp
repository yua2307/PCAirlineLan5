<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<s:url var="bg" value="./resources/public/assets/img/background.jpg"/>
<%@page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <title>Login Page</title>
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
        <link rel="stylesheet" href="<c:url value="resources/css/jquery-ui.css"/>"	>			
        <link rel="stylesheet" href="<c:url value="resources/css/nice-select.css"/>"	>						
        <link rel="stylesheet" href="<c:url value="resources/css/animate.min.css"/>">
        <link rel="stylesheet" href="<c:url value="resources/css/owl.carousel.css"/>"	>
    </head>
    <body>
        <!-- <header>
    
        </header> -->
        <div class="wrap-admin" style="background-image:url(${bg})">
            <div class="opacity-background">

            </div>
            <div class="login-block">
                <h3 class="login-title">đăng nhập</h3>
                <c:if test="${not empty error}">
                    <div class="error" style="color: white;">${error}</div>
                </c:if>
                <c:if test="${not empty msg}">
                    <div class="msg" style="color: white;">${msg}</div>
                </c:if>
                <form id="login-form" name='loginForm'
                      action="<c:url value='/j_spring_security_check' />" method="POST">
                    <div class="form-group">
                        <div class="input-group ">
                            <input type="text" type="text" name='username' class="form-control" placeholder="Username"/>
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                            </div>
                        </div>
                        <div class="input-group">
                            <input type="password" class="form-control" name='password' id="" placeholder="Password"/>
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-key"></i></span>
                            </div>
                        </div>
                        <div class="row align-items-center remember">
                            <input type="checkbox">Remember Me
                        </div>
                        <div class="form-group">
                            <input name="submit" type="submit" value="Login" class="btn float-right login_btn">
                        </div>
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                </form>
                <div class="card-footer">
                    <div class="d-flex justify-content-center">
                        Don't have an account? 
                        <a href="<c:url value="/signupPage"/>" class="links"> Sign Up</a>
                    </div>
                    <div class="d-flex justify-content-center">
                        <a href="#" class="links">Forgot your password?</a>
                    </div>
                </div>
            </div>
            <div class="login-footer">
                <div class="row">
                    <span class="col-xl-12 col-md-12 col-sm-12 col-lg-12 col-12 text-center">©2020 by Chính & Phương</span>
                </div>
            </div>
        </div>
    </body>

</html>