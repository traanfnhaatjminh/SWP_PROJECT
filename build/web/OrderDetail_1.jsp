<%-- 
    Document   : blog
    Created on : Jan 18, 2024, 11:36:21 AM
    Author     : minh1
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Order  Detail Page</title>

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

        <link rel="stylesheet" href="css/font-awesome.min.css">
        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="css/style.css"/>

        <link rel="stylesheet" href="./css/home.css"/>

        <style type="text/css">

            .card {
                border: none;
                margin-bottom: 24px;
                -webkit-box-shadow: 0 0 13px 0 rgba(236,236,241,.44);
                box-shadow: 0 0 13px 0 rgba(236,236,241,.44);
            }

            .avatar-xs {
                height: 2.3rem;
                width: 2.3rem;
            }

            .card {
                background: #fff;
                transition: .5s;
                border: 0;
                margin-bottom: 30px;
                border-radius: .55rem;
                position: relative;
                width: 100%;
                box-shadow: 0 1px 2px 0 rgb(0 0 0 / 10%);
            }
            .card .body {
                color: #444;
                padding: 20px;
                font-weight: 400;
            }

            .container .addnewblog{
                margin-top: 45px;
            }

            .container .searchblog{
                width: 0;
            }
            tr , th , td {
                padding: 5px;
            }
        </style>
    </head>
    <body class="p-4">
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
                                <a href="home" class="logo">
                                    CLOTHINGMAKER
                                </a>
                            </div>
                        </div>
                        <!-- /LOGO -->

                        <!-- ACCOUNT -->
                        <div class="col-md-3 clearfix" style="float: right">
                            <div class="header-ctn">

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
        <!-- container -->

        <div class="row mt-4">
            <div class="col-lg-12">
                <div class="card ml-4 mr-4">
                    <div class="card-body">
                        <div class="table-responsive">
                            <div class="card">
                                <div class="card-header">
                                    <table>
                                        <tr>
                                            <th>Name</th>
                                            <td>${order.orderName}</td>
                                        </tr>
                                        <tr>
                                            <th>Email</th>
                                            <td>${accC.email}</td>
                                        </tr>
                                        <tr>
                                            <th>Phone</th>
                                            <td>${order.orderPhone}</td>
                                        </tr>
                                        <tr>
                                            <th>Address</th>
                                            <td>${order.orderAddress}</td>
                                        </tr>
                                        <tr>
                                            <th>Note</th>
                                            <td>${order.notes}</td>
                                        </tr>
                                        <tr>
                                            <th>Total Cost</th>
                                            <td>${order.totalCost}</td>
                                        </tr>
                                        <tr>
                                            <th>Order Status</th>
                                            <td>${order.orderStatus=='1'?'Confirming':''}</td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="card-body row">
                                    <table class="table project-table table-centered table-nowrap">
                                        <thead>
                                            <tr>
                                                <th scope="col">STT</th>
                                                <th scope="col">Image</th>
                                                <th scope="col">Title</th>
                                                <th scope="col">Price</th>
                                                <th scope="col">Quantity</th>
                                                <th scope="col">Total</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listOrderDetail}" var="od" varStatus="loop1">
                                                <tr>
                                                    <th scope="row">${loop1.index+1}</th>
                                                    <td style="width: 20%">
                                                        <img style="width: 25%" class="d-block img-fluid" src="${od.product.getImage()}" alt="">
                                                    </td>
                                                    <td>${od.product.name}</td>
                                                    <td>${od.productPrice}</td>
                                                    <td>${od.quantity}</td>
                                                    <td>${od.totalCost}</td>
                                                    <td>  <a href="feedback?productId=${od.product.id}" class="btn btn-primary">Feedback</a></td>
                                                </tr>    
                                            </c:forEach>

                                        </tbody>
                                    </table>
                                </div>

                            </div>

                        </div>
                        <!-- end project-list -->
                        <div class="row justify-content-lg-between mt-3">
                            <a href="re-buy?orderId=${order.orderID}" class="btn btn-warning">Re-Buy</a>

                        </div>
                        <div class="pt-3">
                            <c:if test="${error == null}">
                                <ul class="pagination justify-content-end mb-0">
                                    <!--                                        <li class="page-item disabled">
                                                                                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                                                                            </li>-->
                                    <c:forEach begin="1" end="${endIndex}" var="c">
                                        <c:set var="isActive" value="${c eq currentPage ? 'active' : ''}" />
                                        <li class="${isActive}"><a class="page-link" href="postListPage?index=${c}">${c}</a></li>
                                        </c:forEach>
                                    <!--                                        <li class="page-item">
                                                                                <a class="page-link" href="#">Next</a>
                                                                            </li>-->
                                </ul>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end row -->
    </div>

    <script>
        function confirmDelete(blogID, currentPage) {
            var confirmDelete = confirm("Are you sure you want to delete this blog?");
            if (confirmDelete) {
                window.location.href = "deleteBlog?id=" + blogID + "&&index=" + currentPage;
            }
        }
    </script>

    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>

