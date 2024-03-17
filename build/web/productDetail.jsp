<%-- 
    Document   : productDetail
    Created on : Jan 15, 2024, 5:00:26 PM
    Author     : DUONG VIET DUY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.10.5/dist/sweetalert2.min.css">
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
        <jsp:include page="navigation.jsp"></jsp:include>
            <div class="section">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <!-- Product main img -->
                        <div class="col-md-5 col-md-push-2">
                            <div id="product-main-img">
                                <div class="product-preview">
                                    <img src="${detail.image}" alt="">
                            </div>
                        </div>
                    </div>
                    <!-- /Product main img -->

                    <!-- Product thumb imgs -->
                    <div class="col-md-2  col-md-pull-5">
                        <div id="product-imgs">
                            <div class="product-preview">
                                <img src="${detail.image}" alt="">
                            </div>
                        </div>
                    </div>
                    <!-- /Product thumb imgs -->

                    <!-- Product details -->
                    <div class="col-md-5">
                        <div class="product-details">
                            <h2 class="product-name">${detail.name}</h2>

                            <div>
                                <h3 class="product-price">${detail.sale_price} VND</h3>
                                <span class="product-available" style="font-size: 16px">(${detail.quantity} stock)</span>
                            </div>
                            <p>${detail.describe}</p>

                            <form action="buyProduct">
                                <div class="add-to-cart">
                                    <div class="qty-label">
                                        Qty
                                        <div class="input-number">
                                            <input type="number" name="num" value="1" max="${detail.quantity}" id="quantity">
                                            <input type="text" name="productId" value="${detail.id}" hidden/>
                                            <span class="qty-up">+</span>
                                            <span class="qty-down">-</span>
                                        </div>
                                    </div>
                                    <div class="add-to-cart">
                                        <c:if test="${sessionScope.accC == null}">
                                            <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i><a href="login.jsp">add to cart</a> </button>
                                                </c:if>
                                                <c:if test="${sessionScope.accC != null}">
                                            <button class="add-to-cart-btn" type="submit"><i class="fa fa-shopping-cart"></i> add to cart</button>
                                        </c:if> 
                                    </div>
                                </div>
                            </form>

                            <ul class="product-links">
                                <li>Category:</li>
                                    <c:forEach items="${listC}" var="c">
                                    <li><a href="categoryDetail?cid=${c.cid}">${c.cname}</a></li>
                                    </c:forEach>
                            </ul>

                            <ul class="product-links">
                                <li>Share:</li>
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                <li><a href="#"><i class="fa fa-envelope"></i></a></li>
                            </ul>

                        </div>
                    </div>
                    <!-- /Product details -->

                    <!-- Product tab -->
                    <div class="col-md-12">
                        <div id="product-tab">
                            <!-- product tab nav -->
                            <ul class="tab-nav">
                                <li><a data-toggle="tab" href="#tab2">Details</a></li>
                                <li><a data-toggle="tab" href="#tab3">Reviews</a></li>
                            </ul>
                            <!-- /product tab nav -->

                            <!-- product tab content -->
                            <div class="tab-content">

                                <!-- tab2  -->
                                <div id="tab2" class="tab-pane fade in">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <p>${detail.describe}</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- /tab2  -->

                                <!-- tab3  -->
                                <div id="tab3" class="tab-pane fade in">
                                    <div class="row">
                                        <!-- Rating -->
                                        <div class="col-md-3">

                                        </div>
                                        <!-- /Rating -->

                                        <!-- Reviews -->
                                        <c:if test="${noFeedback != null}">
                                            <div class="col-md-6">
                                                <h4 style="color: red">${noFeedback}</h4>
                                            </div>
                                        </c:if>
                                        <c:if test="${noFeedback == null}">
                                            <div class="col-md-6">
                                                <div id="reviews">
                                                    <ul class="reviews">
                                                        <c:forEach items="${listF}" var="c">
                                                            <li>
                                                                <div class="review-heading">
                                                                    <h5 class="name">${c.customerName}</h5>
                                                                    <p class="date">${c.postDate}</p>
                                                                    <div class="review-rating">
                                                                        <c:forEach begin="1" end="${c.ratedStar}">
                                                                            <i class="fa fa-star"></i>
                                                                        </c:forEach>
                                                                    </div>
                                                                </div>
                                                                <div class="review-body">
                                                                    <p>${c.content}</p>
                                                                </div>
                                                            </li>
                                                        </c:forEach>
                                                    </ul>
                                                    <ul class="reviews-pagination">
                                                        <c:forEach begin="1" end="${endIndex}" var="c">
                                                            <c:set var="isActive" value="${c eq currentPage ? 'active' : ''}" />
                                                            <li class="${isActive}"><a href="feedbackPage?index=${c}">${c}</a></li>
                                                            </c:forEach>
                                                    </ul>
                                                </div>
                                            </div> 
                                        </c:if>

                                    </div>
                                </div>
                                <!-- /tab3  -->
                            </div>
                            <!-- /product tab content  -->
                        </div>
                    </div>
                    <!-- /product tab -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->
        <!-- /SECTION -->
        <!-- Section -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <div class="col-md-12">
                        <div class="section-title text-center">
                            <h3 class="title">Latest Products</h3>
                        </div>
                    </div>
                    <c:forEach items="${listLast}" var="c">                   
                        <!-- product -->
                        <div class="col-md-3 col-xs-6">
                            <div class="product">
                                <div class="product-img">
                                    <img src="${c.image}" alt="">
                                    <!--                                <div class="product-label">
                                                                        <span class="sale">-30%</span>
                                                                    </div>-->
                                </div>
                                <div class="product-body">
                                    <p class="product-category">Category</p>
                                    <h3 class="product-name"><a href="detail?pid=${c.id}">${c.name}</a></h3>
                                    <h4 class="product-price">${c.sale_price} VND  <del class="product-old-price">${c.original_price}</del></h4>
                                    <div class="product-rating">
                                    </div>
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
                        <!-- /product -->
                    </c:forEach>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /Section -->
        <jsp:include page="footer.jsp"></jsp:include>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <!-- jQuery Plugins -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/nouislider.min.js"></script>
        <script src="js/jquery.zoom.min.js"></script>
        <script src="js/main.js"></script>

        <script type="text/javascript">

            const quantity = document.querySelector("input[name='num']");
            const max = parseInt(quantity.max);
            quantity.addEventListener("change", (e) => {

                if (e.target.value > max) {


                    Swal.fire({
                        icon: "error",
                        title: "Oops...",
                        text: "You can just buy " + max,
                        timer: 2000

                    });
                    e.target.value = max;



                }
                if (e.target.value <= 0) {


                    Swal.fire({
                        icon: "error",
                        title: "Oops...",
                        text: "You must be buy more than 0",
                        timer: 2000


                    }).then(() => {
                        e.target.value = 1;
                    })




                }

            });


        </script>

    </body>
</html>
