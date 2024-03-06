

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Contact Page</title>

        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min_4.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"/>
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="./css/home.css"/>
        <link rel="stylesheet" href="./css/cart.css"/>
        <link rel="stylesheet" href="./css/checkout.css"/>
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
                                    <a href="cart" class="dropdown-toggle">
                                        <i class="fa fa-shopping-cart"></i>
                                        <span>Shopping Cart</span>
                                        <div class="qty">${size}</div>
                                    </a>
                                    <div class="cart-dropdown">
                                        <div class="cart-list">
                                            <div class="product-widget">
                                                <div class="product-img">
                                                    <img src="./img/product01.png" alt="">
                                                </div>
                                                <div class="product-body">
                                                    <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                                    <h4 class="product-price"><span class="qty">1x</span>$980.00</h4>
                                                </div>
                                                <button class="delete"><i class="fa fa-close"></i></button>
                                            </div>

                                            <div class="product-widget">
                                                <div class="product-img">
                                                    <img src="./img/product02.png" alt="">
                                                </div>
                                                <div class="product-body">
                                                    <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                                    <h4 class="product-price"><span class="qty">3x</span>$980.00</h4>
                                                </div>
                                                <button class="delete"><i class="fa fa-close"></i></button>
                                            </div>
                                        </div>
                                        <div class="cart-summary">
                                            <small>3 Item(s) selected</small>
                                            <h5>SUBTOTAL: $2940.00</h5>
                                        </div>
                                        <div class="cart-btns">
                                            <a href="#">View Cart</a>
                                            <a href="#">Checkout  <i class="fa fa-arrow-circle-right"></i></a>
                                        </div>
                                    </div>
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

        <!--MY CART-->

        <div class="wrapper container">
            <div class="d-flex align-items-center justify-content-between">
                <div class="d-flex flex-column mt-3 mb-3">
                    <div class="h3">Checkout</div>
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

                                        ${c.quantity}
                                    </td>
                                    <td class="d-flex flex-column">${c.product.sale_price}$
                                    </td>
                                    <td class="font-weight-bold">
                                        $${c.quantity*c.product.sale_price}
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="d-flex justify-content-between flex-wrap">
                <div class="text-muted">
                    <a class="btn btn-block bg-primary text-white" href="cart">
                        <i class="fa-solid fa-arrow-left"></i>
                        Change cart
                    </a>
                </div>
                <div class="d-flex flex-column justify-content-between align-items-end flex-wrap">
                    <div class="d-flex px-3 pr-md-5 subtotal col-12">
                        <div class="px-4">Subtotal:</div>
                        <div class="h5 font-weight-bold px-md-2">$${cart.getTotalMoney()}</div>
                    </div>
                </div>
            </div>

            <!--information user-->
            <div class="order-form">
                <form action="checkout" method="post" class="form-signup">
                    <h1 class="h3 mb-3 font-weight-normal text-info bg-light" style="text-align: center">Delivery information</h1>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="name">Full name</label>
                            <input name="name" id="name" type="text" value="${customer.fullName}" class="form-control" placeholder="Full name" required="" autofocus>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="name">Phone number</label>
                            <input name="phone" type="text" id="phone" value="${customer.phone}" class="form-control mb-2" placeholder="Phone number" pattern="^0[2-9]{3}[0-9]{6}" required autofocus>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="address">Address</label>
                        <input name="address" type="text" id="address" value="${customer.address}"  class="form-control mb-2" placeholder="Address" required autofocus>
                    </div>
                    <div class="form-group">
                        <label for="address">Email</label>
                        <input name="email" type="email" id="email" value="${customer.email}"  class="form-control mb-2" placeholder="Email" required autofocus>
                    </div>

                    <div class="form-group">
                        <label for="address">Gender</label>
                        <select id="id" class="form-control mb-2" name="gender">
                            <option value="female" ${customer.gender== 'female' ?  'selected' :'' }  >Female</option>
                            <option value="male" ${customer.gender== 'male' ?  'selected' :'' } >Male</option>
                            <option value="other">Others</option>
                        </select>

                    </div>
                    <div class="form-group">
                        <label for="notes">Notes</label>
                        <textarea class="form-control" name="notes" id="notes" rows="3"></textarea>
                    </div>


                    <!--Payment-->
                    <div class="form-group pay" id="payment">
                        <label for="pay"> Select a payment method</label>
                        <div class="form-group">
                            <input class="" type="radio" id="cash" name="payment" value="cash" checked>
                            <label for="cash">Payment on delivery</label>
                            <br>
                            <input class="" type="radio" id="account" name="payment" value="account">
                            <label for="account">Bank transfer</label>
                        </div>
                        <div class="d-none" id="qr">
                            <img src="./img/qr2.jpg" alt="alt"/>
                        </div>
                    </div>


                    <!--Payment-->
                    <button class="btn bg-success text-white">Submit</button>
                </form>
            </div>   
            <!--information user-->
        </div>
        <!--END MY CART-->

        <jsp:include page="footer.jsp"></jsp:include>
            <!-- /FOOTER -->

            <script>
                const payment = document.getElementById("payment");
                const transfer = payment.querySelector("input[value='account']");
                const cash = payment.querySelector("input[value='cash']");
                const qr = payment.querySelector("#qr");
                transfer.addEventListener("change", function () {
                    if (this.checked) {
                        qr.innerHTML = '<div class="text-center"><img src="https://api.vietqr.io/image/970418-4271013180-rZ9LU6u.jpg?accountName=NGUYEN%20QUANG%20TOAN&amount=${cart.getTotalMoney()}&addInfo=$Bank to"alt="QR thanh toán VietQR" /></div>'
                        qr.classList.add("d-block");
                    }
                });
                cash.addEventListener("change", function () {
                    if (this.checked) {
                        qr.classList.remove("d-block");
                    }
                });

        </script>

    </body>
</html>
