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
        <title>Home Page</title>

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
        <jsp:include page="menu.jsp"></jsp:include>
            <div class="section">
                <!-- container -->
                <div class="container">
                    <div class="slick-slider" style="text-align: center; background-color: whitesmoke">
                    <c:forEach items="${listTopSlider}" var="c">
                        <div class="slide"> 
                            <a href="#"><img src="${c.sliderImage}" alt="Slide 1" style="width: 50%; margin: 0 auto;"></a>
                            <div class="slide-caption">
                                <p style="font-size: 20px; margin-top: 1%">${c.sliderTitle}</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <div class="container">
            <div class="row">
                <c:forEach items="${listTopPost}" var="c">
                    <div class="col-md-6">
                        <img src="${c.postImage}" class="img-fluid" alt="alt" style="width: 100%; height: auto;">
                        <div class="image-caption">
                            <h4 style="text-align: center">${c.postTitle}</h4>
                            <h5 style="text-align: center">${c.postContent}</h5>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>


        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <!-- section title -->
                    <div class="col-md-12">
                        <div class="section-title">
                            <h3 class="title">New Arrivals</h3>
                        </div>
                    </div>
                    <!-- /section title -->

                    <!-- Products tab & slick -->
                    <div class="col-md-12">
                        <div class="row">
                            <!-- tab -->
                            <div id="tab1" class="tab-pane active">
                                <div class="row">
                                    <c:forEach items="${listNewP}" var="c">
                                        <div class="col-md-3">
                                            <div class="product">
                                                <div class="product-img">
                                                    <img src="${c.image}" alt="">
                                                    <div class="product-label">
                                                        <!--<span class="sale">-30%</span>-->
                                                        <span class="new">NEW</span>
                                                    </div>
                                                </div>
                                                <div class="product-body">
                                                    <h3 class="product-name"><a href="detail?pid=${c.id}">${c.name}</a></h3>
                                                    <h4 class="product-price">
                                                        ${c.sale_price} VND 
                                                        <del class="product-old-price">${c.original_price}</del>
                                                    </h4>
                                                </div>
                                                <div class="add-to-cart">
                                                    <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <!-- /tab -->
                        </div>
                    </div>

                </div>

            </div>
            <!-- Products tab & slick -->
        </div>
        <!-- /row -->

        <%--<jsp:include page="blog.jsp"></jsp:include>--%>

        <jsp:include page="footer.jsp"></jsp:include>

        <!-- jQuery Plugins -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/nouislider.min.js"></script>
        <script src="js/jquery.zoom.min.js"></script>
        <script src="js/main.js"></script>
        <script>
            $(document).ready(function () {
                $('.slick-slider').slick({
                    dots: true, // Hiển thị chấm tròn chỉ số
                    infinite: true,
                    slidesToShow: 1,
                    slidesToScroll: 1,
                    autoplay: true,
                    autoplaySpeed: 2000
                });
            });
        </script>
    </body>
</html>
