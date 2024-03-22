

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

        <style>
            .errPhone{
                display : none;
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
                        <div class="col-md-10">
                            <div class="header-logo">
                                <a href="home" class="logo">
                                    CLOTHINGMAKER
                                </a>
                            </div>
                        </div>
                        <!-- /LOGO -->

                        <!-- ACCOUNT -->
                        <div class="col-md-2 clearfix">
                            <div class="header-ctn">
                                <!-- Cart -->
                                <div>
                                    <a href="cart">
                                        <i class="fa fa-shopping-cart"></i>
                                        <span>Shopping Cart</span>
                                        <div class="qty">${size}</div>
                                    </a>

                                </div>
                                <!-- /Cart -->
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
                    <c:if test="${mess!=''}">
                        <div class="alert alert-danger" role="alert">
                            ${mess}
                        </div>
                    </c:if>
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
                        <div class="h5 font-weight-bold px-md-2">${cart.getTotalMoney()} VND</div>
                    </div>
                </div>
            </div>

            <!--information user-->
            <div class="order-form">
                <form action="vnpay" method="post" class="form-signup">                                                                                   
                    <!--Payment-->
                    <div class="form-group pay" id="payment">
                        <label for="pay"> Select a payment method</label>
                        <div class="form-group">
                            <input class="" type="radio" id="cash" value="2" name="paymentMethod" value="cash" checked>
                            <label for="cash">Payment on delivery</label>
                            <br>
                            <input class="" type="radio" id="account" value="1" name="paymentMethod" value="account">
                            <label for="account">Bank transfer</label>
                        </div>
                        <div class="d-none" id="qr">
                            <img src="./img/qr2.jpg" alt="alt"/>
                        </div>
                    </div>
                        <button type="submit" class="site-btn">PLACE ORDER</button>                
                </form>

            </div>   
            <!--information user-->
        </div>
        <!--END MY CART-->

        <jsp:include page="footer.jsp"></jsp:include>
            <!-- /FOOTER -->

            <script>
                var regex = /^0[2-9]{3}[0-9]{6}$/;
                const phone = document.getElementById("phone");
                phone.addEventListener("blur", (e) => {
                    const errPhone = document.querySelector(".errPhone");
                    if (regex.test(e.target.value)) {
                        errPhone.style.display = "none";
                    } else {
                        errPhone.style.display = "block";
                    }
                })
                const payment = document.getElementById("payment");
                const transfer = payment.querySelector("input[value='account']");
                const cash = payment.querySelector("input[value='cash']");
                console.log(parseInt('${cart.getTotalMoney()}'));
                if (parseInt('${cart.getTotalMoney()}') >= 1000000) {
                    payment.innerHTML = '<input class="" hidden id="account" name="payment" value="account" /></div>'
                }


        </script>
<!--        <script>
    document.addEventListener("DOMContentLoaded", function() {
        // Lắng nghe sự kiện click trên nút "PLACE ORDER"
        document.querySelector('.site-btn').addEventListener('click', function(event) {
            // Lấy phương thức thanh toán được chọn
            var paymentMethod = document.querySelector('input[name="paymentMethod"]:checked').value;
            
            // Nếu phương thức thanh toán là VN pay
            if (paymentMethod === '2') {
                // Chuyển hướng đến link thanh toán của VNP
                window.location.href = 'https://sandbox.vnpayment.vn/paymentv2/vpcpay.html?vnp_Amount=55000&vnp_Command=pay&vnp_CreateDate=20240321221050&vnp_CurrCode=VND&vnp_ExpireDate=20240321222550&vnp_IpAddr=0%3A0%3A0%3A0%3A0%3A0%3A0%3A1&vnp_Locale=vn&vnp_OrderInfo=Thanh+toan+don+hang%3AA1006&vnp_OrderType=sale&vnp_ReturnUrl=http%3A%2F%2Flocalhost%3A9999%2Fswpproject%2Fhome&vnp_TmnCode=DUJ8ND6D&vnp_TxnRef=A1006&vnp_Version=2.1.0&vnp_SecureHash=7485f1bd2fa509cdefb8d267fbc7b9c679399b3ccc59ff17ecba73a94bc373d70b60e1211d986745c31c26ef20261daace629b101c78ce571d4af7706c9e5499';
                
                // Ngăn chặn hành vi mặc định của nút "PLACE ORDER" (nếu cần)
                event.preventDefault();
            }
        });
    });
</script>-->
        <a href="register.jsp"></a>
    </body>
</html>
