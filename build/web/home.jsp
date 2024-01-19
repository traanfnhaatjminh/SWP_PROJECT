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
                    <!-- row -->
                    <div class="row">

                        <div class="col-md-12">
                            <div class="slick-slider" style="text-align: center; background-color: whitesmoke">
                                <!-- Slide 1 -->
                                <div class="slide"> <!-- Set the width and margin for the image container -->
                                    <img src="https://scontent.fhan14-3.fna.fbcdn.net/v/t39.30808-6/407952110_373587438548216_4304779013064929915_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=dd5e9f&_nc_ohc=dLxGeeB1VKgAX8JZjBo&_nc_ht=scontent.fhan14-3.fna&oh=00_AfCOARYBwVwwKNXQJntzG0Rok6SneAJ9qYncbQ1oW0dXsg&oe=65ACB153" alt="Slide 1" style="width: 50%; margin: 0 auto;">
                                    <div class="slide-caption">
                                        <p style="font-size: 20px; margin-top: 1%">𝐓𝐄𝐓𝐕𝐎𝐕𝐄𝐍 𝐌𝐄𝐑𝐂𝐇 - Sự kết hợp chưa bao giờ có giữa $maker x Lonely Stonie!!!</p>
                                    </div>
                                </div>
                                <!-- Slide 2 -->
                                <div class="slide"> <!-- Set the width and margin for the image container -->
                                    <img src="https://scontent.fhan14-2.fna.fbcdn.net/v/t39.30808-6/407973804_373587568548203_1578083566043200816_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=dd5e9f&_nc_ohc=OkZHSoLXEBcAX9oOMtf&_nc_ht=scontent.fhan14-2.fna&oh=00_AfDPtQhzGqDayhMh1M_pugxxcmSy97Qefb2ATUu31EoCwQ&oe=65AD5FC3" alt="Slide 2" style="width: 50%; margin: 0 auto;">
                                    <div class="slide-caption">
                                        <p style="font-size: 20px; margin-top: 1%">$MAKER và LONELY Stonie chính thức ra mắt các sản phẩm thuộc BST vào ngày 04.12, bao gồm Tee in Black, Short in Black,Money Island Tee in Cream, Money Island Short in Cream </p>
                                    </div>
                                </div>

                                <div class="slide"> <!-- Set the width and margin for the image container -->
                                    <img src="https://scontent.fhan14-1.fna.fbcdn.net/v/t39.30808-6/407994871_373587491881544_5926347277153163150_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=dd5e9f&_nc_ohc=VSRBy4vNBBQAX_aRK8M&_nc_ht=scontent.fhan14-1.fna&oh=00_AfC6yhRdvPNkKfy6h8w119_UHwaBZhk6kkxuFu_fPOLsgA&oe=65ADA0CD" alt="Slide 2" style="width: 50%; margin: 0 auto;">
                                    <div class="slide-caption">
                                        <p style="font-size: 20px; margin-top: 1%">Toàn bộ các “SẢN PHẨM” đẹp nhất đã lên kệ tại website chính thức $maker, bạn có thể nhắn tin trực tiếp cho chúng mình để được tư vấn và trải nghiệm mua sắm Online.</p>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <!-- /Image Slider -->

                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->
            </div>
            <!-- /SECTION -->
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
                                <div class="products-tabs">
                                    <!-- tab -->
                                    <div id="tab1" class="tab-pane active">
                                        <div class="products-slick" data-nav="#slick-nav-1">
                                            <!-- product -->
                                        <c:forEach items="${listNewP}" var="c">
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
                                                        ${c.price} VND 
                                                        <!--<del class="product-old-price">990.00</del>-->
                                                    </h4>
                                                </div>
                                                <div class="add-to-cart">
                                                    <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <div id="slick-nav-1" class="products-slick-nav">
                                    </div>
                                </div>
                                <!-- /tab -->
                            </div>
                        </div>
                    </div>
                    <!-- Products tab & slick -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>

        <%--<jsp:include page="blog.jsp"></jsp:include>--%>

        <!-- NEWSLETTER -->
        <div id="newsletter" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="newsletter">
                            <p>Sign Up for the <strong>NEWSLETTER</strong></p>
                            <form>
                                <input class="input" type="email" placeholder="Enter Your Email">
                                <button class="newsletter-btn"><i class="fa fa-envelope"></i> Subscribe</button>
                            </form>
                            <ul class="newsletter-follow">
                                <li>
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /NEWSLETTER -->

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
                // Initialize Slick Slider
                $('.slick-slider').slick({
                    autoplay: true,
                    autoplaySpeed: 3000, // Set the autoplay speed in milliseconds
                    dots: true, // Show dots for navigation
                    arrows: false, // Hide arrows
                    responsive: [
                        {
                            breakpoint: 768,
                            settings: {
                                dots: false // Hide dots on smaller screens
                            }
                        }
                    ]
                });
            });
        </script>
    </body>
</html>
