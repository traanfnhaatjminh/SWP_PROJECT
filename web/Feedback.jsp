<%-- 
    Document   : Feedback
    Created on : Mar 5, 2024, 10:49:27 PM
    Author     : HuynhPhan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Feed Back Page</title>
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

        <!-- Bootstrap -->

        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="css/style.css"/>

        <link rel="stylesheet" href="./css/home.css"/>
        <link rel="stylesheet" href="./css/detail.css"/>
        <style>
            #product-detail-review{
                opacity: 1;
                widows: 80%
            }
            #formComment {
                width: 80%;
                margin-left: 50px;
                margin-top: 20px;
            }
            .product-feedback{
                margin-left: 60px;
            }
        </style>
    </head>
    <body>
        <header>
            <!-- TOP HEADER -->
            <div id="top-header">
                <div class="container">
                    <ul class="header-links pull-left">
                        <li><a href="#"><i class="fa fa-phone"></i>0773 648 867</a></li>
                        <li><a href="#"><i class="fa fa-envelope-o"></i>smakerclothing@gmail.com</a></li>
                        <li><a href="#"><i class="fa fa-map-marker"></i>Hanoi</a></li>
                    </ul>
                    <ul class="header-links pull-right">
                        <!--<li><a href="#"><i class="fa fa-dollar"></i> USD</a></li>-->
                        <c:if test="${sessionScope.accC == null}">
                            <li><a href="register.jsp"><i class="fa fa-"></i> Register</a></li>
                            <li><a href="login.jsp"><i class="fa fa-"></i> Login</a></li>
                            </c:if>
                            <c:if test="${sessionScope.accC != null}">
                            <li><a href="profile.jsp"><i class="fa fa-user-o"></i> My Account</a></li>
                            <li><a href="customer?action=logout"><i class="fa fa-"></i> Logout</a></li>
                            </c:if>
                    </ul>
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
                            <div class="header-logo ">
                                <a href="home" class="logo">
                                    CLOTHINGMAKER
                                </a>
                            </div>
                        </div>
                        <!-- /LOGO -->
                    </div>
                    <!-- row -->
                </div>
                <!-- container -->
            </div>
            <!-- /MAIN HEADER -->
        </header>
        <!-- container -->
        <div class="tab-pane fade " id="product-detail-review" role="tabpanel" aria-labelledby="product-detail-review-tab">
            <div class="row  product-feedback align-items-center" >
                <img src="${p.image}" width="100" height="100" alt="alt"/>
                <h3>${p.name}</h3>
            </div>
            <form id="formComment" class="row g-3 needs-validation" novalidate="novalidate" action="feedback" method="post">
                <input type="text" id="id" name="productId" value="${p.id}" hidden="">
                <input type="text" id="id" name="detailID" value="${detailID}" hidden="">
                <input type="text" id="id" name="customerId" value="${accC.customerID}" hidden="">
                <div class="col-md-4">
                    <label for="FullName" class="form-label">Full Name</label>
                    <input type="text" class="form-control" id="FullName" name="FullName" value="${accC.fullName}" readonly="">

                </div>
                <div class="col-md-4">
                    <label for="Phone" class="form-label">Phone</label>
                    <input type="text" class="form-control" id="Phone" name="phone" value="${accC.phone}" readonly="">

                </div>
                <div class="col-md-4">
                    <label for="Email" class="form-label">Email</label>
                    <input type="text" class="form-control" id="Email" name="email" value="${accC.email}" readonly="">

                </div>
                <div class="col-md-12">
                    <label class="rating-label">
                        <span>Number of rated star</span>
                        <div class="rating">
                            <input type="radio" id="star5" name="rate" value="5" checked/>
                            <label for="star5" title="text"><i class="fa-solid fa-star"></i></label>
                            <input type="radio" id="star4" name="rate" value="4" />
                            <label for="star4" title="text"><i class="fa-solid fa-star"></i></label>
                            <input type="radio" id="star3" name="rate" value="3" />
                            <label for="star3" title="text"><i class="fa-solid fa-star"></i></label>
                            <input type="radio" id="star2" name="rate" value="2" />
                            <label for="star2" title="text"><i class="fa-solid fa-star"></i></label>
                            <input  type="radio" id="star1" name="rate" value="1" />
                            <label for="star1" title="text"><i class="fa-solid fa-star"></i></label>
                        </div>

                    </label>
                </div>
                <div class="col-md-12">
                    <label for="Content" class="form-label">Content</label>
                    <textarea class="form-control" id="Content" name="content" rows="3" required=""></textarea>
                </div>
                <div class="col-12 mt-3">
                    <button  class="btn btn-primary" id="btnSubmitComment">Send</button>
                </div>

                <div class="col-12 mt-3">
                    <h5 style="color: greenyellow">${success}</h5>
                </div>
                <div class="col-12 mt-3">
                    <h5 style="color: red">${fail}</h5>
                </div>
            </form>

        </div>
    </body>
</html>
