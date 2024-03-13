<%-- 
    Document   : home
    Created on : Jan 13, 2024, 3:14:26 PM
    Author     : minh1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Category Detail Page</title>

        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="css/style.css"/>

        <link rel="stylesheet" href="./css/home.css"/>

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
                            <div class="header-logo">
                                <a href="home" class="logo">

                                </a>
                            </div>
                        </div>
                        <!-- /LOGO -->

                        <!-- SEARCH BAR -->
                        <div class="col-md-6">
                            <div class="header-search text-center">
                                <form action="searchProduct">
                                    <input name="keyword" type="text" class="input" placeholder="Search here">
                                    <button type="submit" class="search-btn">Search</button>
                                </form>
                            </div>
                        </div>
                        <!-- /SEARCH BAR -->

                        <!-- ACCOUNT -->
                        <div class="col-md-3 clearfix">
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
                                <!-- /Cart -->

                                <!-- Menu Toogle -->
                                <div class="menu-toggle">
                                    <a href="#">
                                        <i class="fa fa-bars"></i>
                                        <span>Menu</span>
                                    </a>
                                </div>
                                <!-- /Menu Toogle -->
                            </div>
                        </div>
                        <!-- /ACCOUNT -->
                    </div>
                    <!-- row -->
                </div>
                <!-- container -->
            </div>
            <!-- /MAIN HEADER -->
        </header>
        <!-- /HEADER -->

        <jsp:include page="navigation.jsp"></jsp:include>

            <!-- SECTION -->
            <div class="section">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <!-- ASIDE -->
                        <div id="aside" class="col-md-3">
                            <!-- aside Widget -->


                            <div class="aside">
                                <h3 class="aside-title">Latest Product</h3>
                            <c:forEach items="${listLast}" var="c">   
                                <div class="product-widget">
                                    <div class="product-img">
                                        <img src="${c.image}" alt="">
                                    </div>
                                    <div class="product-body">
                                        <h3 class="product-name"><a href="detail?pid=${c.id}">${c.name}</a></h3>
                                        <h4 class="product-price">${c.sale_price} VND  <del class="product-old-price">${c.original_price}</del></h4>
                                    </div>
                                </div>
                            </c:forEach>        
                        </div>

                    </div>
                    <!-- /ASIDE -->

                    <!-- STORE -->
                    <div id="store" class="col-md-9">
                        <!-- store top filter -->
                        <div class="store-filter clearfix">
                            <div class="store-sort">
                                <form action="sortProduct">
                                    <label>
                                        Sort By:
                                        <input type="hidden" name="cid" value="${cateID}">
                                        <select name="sortSelect" class="input-select">
                                            <option value="atoz" ${atozSelected}>Name product from A to Z</option>
                                            <option value="ztoa" ${ztoaSelected}>Name product from Z to A</option>
                                        </select>
                                        <button type="submit" class="btn btn-default">Sort</button>
                                    </label>
                                </form>
                            </div>
                        </div>
                        <!-- /store top filter -->

                        <!-- store products -->
                        <div class="row">
                            <!-- product -->
                            <c:forEach items="${listP}" var="c">
                                <div class="col-md-4 col-xs-6">
                                    <div class="product">
                                        <div class="product-img">
                                            <img src="${c.image}" alt="">
                                        </div>
                                        <div class="product-body">
                                            <h3 class="product-name"><a href="detail?pid=${c.id}">${c.name}</a></h3>
                                            <h4 class="product-price">
                                                ${c.sale_price} VND 
                                                <del class="product-old-price">${c.original_price}</del>
                                            </h4>
                                        </div>
                                        <div class="add-to-cart">
                                            <c:if test="${sessionScope.accC == null}">
                                                <a href="login.jsp" class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</a>
                                            </c:if>
                                            <c:if test="${sessionScope.accC != null}">
                                                <a href="buyProduct?productId=${c.id}&num=1" class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</a>
                                            </c:if>                                         
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <div class="store-filter clearfix col-md-12">
                                <ul class="store-pagination">
                                    <c:forEach begin="1" end="${endIndex}" var="c">
                                        <c:set var="isActive" value="${c eq currentPage ? 'active' : ''}" />
                                        <li class="${isActive}"><a href="blogListPage?index=${c}">${c}</a></li>
                                        </c:forEach>
                                </ul>
                            </div>
                            <!-- /product -->
                        </div>
                        <!-- /store products -->

                    </div>
                    <!-- /STORE -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- FOOTER -->
        <footer id="footer">
            <!-- top footer -->
            <div class="section">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">About Us</h3>
                                <ul class="footer-links">
                                    <li><a href="#"><i class="fa fa-map-marker"></i>Hanoi</a></li>
                                    <li><a href="#"><i class="fa fa-phone"></i>0773 648 867</a></li>
                                    <li><a href="#"><i class="fa fa-envelope-o"></i>smakerclothing@gmail.com</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">Categories</h3>
                                <ul class="footer-links">
                                    <li><a href="#">Hot deals</a></li>
                                        <c:forEach items="${listC}" var="c">
                                        <li><a href="categoryDetail?cid=${c.cid}">${c.cname}</a></li>
                                        </c:forEach>
                                </ul>
                            </div>
                        </div>

                        <div class="clearfix visible-xs"></div>

                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">Information</h3>
                                <ul class="footer-links">
                                    <li><a href="#">About Us</a></li>
                                    <li><a href="#">Contact Us</a></li>
                                    <li><a href="#">Privacy Policy</a></li>
                                    <li><a href="#">Orders and Returns</a></li>
                                    <li><a href="#">Terms & Conditions</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">Service</h3>
                                <ul class="footer-links">
                                    <li><a href="#">My Account</a></li>
                                    <li><a href="#">View Cart</a></li>
                                    <li><a href="#">Track My Order</a></li>
                                    <li><a href="#">Help</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->
            </div>
            <!-- /top footer -->
        </footer>

        <!-- jQuery Plugins -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/nouislider.min.js"></script>
        <script src="js/jquery.zoom.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
