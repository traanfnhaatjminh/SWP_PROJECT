<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Page</title>


        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min_4.css"/>

        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!-- Custom stlylesheet -->
        <link rel="stylesheet" href="./css/cart.css"/>
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
                        <c:if test="${sessionScope.customer == null}">
                            <li><a href="register.jsp"><i class="fa fa-"></i> Register</a></li>
                            <li><a href="login.jsp"><i class="fa fa-"></i> Login</a></li>

                        </c:if>
                        <c:if test="${sessionScope.customer != null}">
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
                                    $MAKER
                                </a>
                            </div>
                        </div>
                        <!-- /LOGO -->

                        <!-- SEARCH BAR -->
                        <div class="col-md-6">
                            <div class="header-search text-center">
                                <form action="searchcart">
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
                                    <a href="cart" class="">
                                        <i class="fa fa-shopping-cart"></i>
                                        <span>Shopping Cart</span>
                                        <div class="qty">${size}</div>
                                    </a>

                                </div>
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

        <!--MY CART-->

        <div class="wrapper container">
            <div class="d-flex align-items-center justify-content-between">
                <div class="d-flex flex-column">
                    <div class="h3">My Cart</div>
                </div>
            </div>

            <div id="table" class="bg-white rounded">
                <div class="table-responsive-md">
                    <table class="table table-hover">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col" class="text-uppercase header">ID</th>
                                <th scope="col" class="text-uppercase header">Title</th>
                                <th scope="col-lg-3" class="text-uppercase" style="
                                    width: 100px;">Quantity</th>
                                <th scope="col" class="text-uppercase">price each</th>
                                <th scope="col" class="text-uppercase">total</th>
                                <th scope="col" class="text-uppercase">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${cart.list}" var="c">
                                <tr>
                                    <td>${c.product.id}</td>
                                    <td class="item">
                                        <div class="d-flex align-items-start">
                                            <img src="${c.product.image}"
                                                 alt="">
                                            <div>
                                                ${c.product.name}
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <input type="number" product-id ="${c.product.id}" id="quantity" class="form-control form-control-lg text-center" name="num" value="${c.quantity}" 
                                               />
                                    </td>
                                    <td class="d-flex flex-column">${c.product.sale_price}$
                                    </td>
                                    <td class="font-weight-bold">
                                        $${c.quantity*c.product.sale_price}
                                    </td>
                                    <td>
                                        <div class="text-center">
                                            <a class="btn btn-black border-primary bg-white btn-md mb-2" style="opacity: 1" href="deleteItem?id=${c.product.id}"><i class="fas fa-trash"></i></a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="d-flex justify-content-between flex-wrap">
                <div class="text-muted">
                    <a class="btn btn-block" href="home">
                        Add product
                        <span class="fas fa-plus"></span>
                    </a>
                </div>
                <div class="d-flex flex-column justify-content-between align-items-end flex-wrap">
                    <div class="d-flex px-3 pr-md-5 subtotal col-12">
                        <div class="px-4">Subtotal:</div>
                        <div class="h5 font-weight-bold px-md-2">$${cart.getTotalMoney()}</div>
                    </div>
                </div>
                <div class="px-4">
                    <a href="checkout" class="btn btn-success btn-lg">Checkout<i class="fa-solid fa-arrow-right"></i></a>
                </div>
            </div>
        </div>
        <!--END MY CART-->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <!-- section title -->
                    <div class="col-md-12">
                        <div class="section-title">
                            <h3 class="title">Product be like</h3>
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
                                                    <a href="buyProduct?productId=${c.id}&num=1" class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</a>
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



            <jsp:include page="footer.jsp"></jsp:include>
            <!-- /FOOTER -->

            <script type="text/javascript">
                const quantity = document.querySelectorAll("input[name='num']");
                quantity.forEach((item) => {
                    item.addEventListener("change", (e) => {
                        const num = e.target.value;
                        const id = item.getAttribute("product-id");
                        console.log(id);
                        window.location.href = "process?num=" + num + "&id=" + id;
                    });
                });

            </script>
    </body>
</html>
