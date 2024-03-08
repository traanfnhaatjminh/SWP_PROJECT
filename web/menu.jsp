<%-- 
    Document   : menu
    Created on : Jan 16, 2024, 6:38:00 PM
    Author     : minh1
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

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
                <c:if test="${sessionScope.accC == null && sessionScope.accS == null}">
                    <li><a href="register.jsp"><i class="fa fa-"></i> Register</a></li>
                    <li><a href="login.jsp"><i class="fa fa-"></i> Login</a></li>
                    </c:if>
                    <c:if test="${sessionScope.accC != null}">
                    <li><a href="profile.jsp"><i class="fa fa-user-o"></i> My Account</a></li>
                    <li><a href="customer?action=logout"><i class="fa fa-"></i> Logout</a></li>
                    </c:if>
                    <c:if test="${sessionScope.accS != null}">
                    <li><a href="loginSystem?action=logout"><i class="fa fa-"></i> Logout</a></li>
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
                        <a style="color: whitesmoke" href="home" class="logo">
                            CLOTHINGMAKER
                        </a>
                    </div>
                </div>
                <!-- /LOGO -->

                <!-- ACCOUNT -->
                <div class="col-md-3 clearfix" style="float: right">
                    <div class="header-ctn">
                        <!-- Cart -->
                        <div class="dropdown">
                            <c:if test="${sessionScope.accC == null}">
                                <a href="login.jsp" class="">
                                    <i class="fa fa-shopping-cart"></i>
                                    <span>Shopping Cart</span>
                                    <div class="qty">${size}</div>
                                </a>
                            </c:if>
                            <c:if test="${sessionScope.accC != null}">
                                <a href="cart" class="">
                                    <i class="fa fa-shopping-cart"></i>
                                    <span>Shopping Cart</span>
                                    <div class="qty">${size}</div>
                                </a>
                            </c:if>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>


</header>
<!-- /HEADER -->