<%-- 
    Document   : success
    Created on : Oct 22, 2023, 8:50:57 AM
    Author     : DELL
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Success</title>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="./css/home.css"/>
    </head>
    <body>
        <header>
            <!-- TOP HEADER -->
            <div id="top-header">
                <div class="container">
                    <div class="row">
                        <div class="col-md-10">
                            <ul class="header-links pull-left">
                                <li><a href="#"><i class="fa fa-phone"></i>0773 648 867</a></li>
                                <li><a href="#"><i class="fa fa-envelope-o"></i>smakerclothing@gmail.com</a></li>
                                <li><a href="#"><i class="fa fa-map-marker"></i>Hanoi</a></li>
                            </ul>
                        </div>
                        <div class="col-md-2">
                            <ul class="header-links pull-right">
                                <c:if test="${sessionScope.accC != null}">
                                    <li><a href="profile.jsp"><i class="fa fa-user-o"></i> My Account</a></li>
                                    <li><a href="customer?action=logout"><i class="fa fa-"></i> Logout</a></li>

                                </c:if>
                            </ul>
                        </div>
                    </div>

                </div>
            </div>
            <!-- /TOP HEADER -->

            <!-- MAIN HEADER -->
            <div id="header">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <!-- LOGO -->
                        <div class="col-md-3">
                            <div class="header-logo">
                                <a href="home" class="logo">
                                    CLOTHINGMAKER
                                </a>
                            </div>
                        </div>
                        <!-- /LOGO -->
                        <!-- /ACCOUNT -->
                    </div>
                    <!-- row -->
                </div>
                <!-- container -->
            </div>
            <!-- /MAIN HEADER -->
        </header>
        <!-- /HEADER -->

        <div class="info container">
            <div class="row text-center">
                <div class="col-12 order-success"><h1>Order Success!</h1></div>
            </div>
            <div>
                <h3>Congratulations on your successful order! We will process the order as soon as possible.</h3>
            </div>
            <div class="row">
                <div class="col-12">
                    <h4 class="mb-2 bg-light">Information</h4>
                    <table class="table table-bordered">
                        <tbody>
                            <tr>
                                <td>Full name</td>
                                <td>${requestScope.name}</td>
                            </tr>
                            <tr>
                                <td>Phone Number</td>
                                <td>${requestScope.phone}</td>
                            </tr>
                            <tr>
                                <td>Address</td>
                                <td>${requestScope.address}</td>
                            </tr>
                            <tr>
                                <td>Email</td>
                                <td>${requestScope.email}</td>
                            </tr>
                            <tr>
                                <td>Gender</td>
                                <td>${requestScope.gender}</td>
                            </tr>
                            <tr>
                                <td>Notes</td>
                                <td>${requestScope.notes}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <c:if test="${ methodPayment == 'account'}">
                    <div class="col-12">
                        <h3>Please Paid to be confirm order</h3>
                        <div class="form-group pay" id="payment" style="width: 50%">
                            <div id="qr" style="
                                 width: 40%;
                                 height: 50%">
                                <img style="margin-left: 100%" src="https://api.vietqr.io/image/970418-4271013180-rZ9LU6u.jpg?accountName=NGUYEN%20QUANG%20TOAN&amount=${total}&addInfo=$Bank to"alt="QR thanh toán VietQR" alt="alt" />
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>                 
        <script>
        </script>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
