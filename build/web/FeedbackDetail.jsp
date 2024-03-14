<%-- 
    Document   : FeedbackList
    Created on : Mar 6, 2024, 7:38:17 PM
    Author     : minh1
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Feedback Detail Page</title>

        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

        <!-- Font Awesome Icon -->

        <link rel="stylesheet" href="css/font-awesome.min.css">
        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="css/style.css"/>

        <link rel="stylesheet" href="./css/home.css"/>

        <style type="text/css">
            body{
                background:#f3f3f3;
                margin-top:20px;
                color: #616f80;
            }
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
                margin-top: 30px;
                border-radius: .55rem;
                position: relative;
                width: 40%;
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

            .checkbox-group {
                display: flex;
                flex-direction: row;
            }

            .checkbox-post {
                margin-right: 10px; /* Điều chỉnh khoảng cách giữa các checkbox nếu cần thiết */
            }

            td .fa-star {
                display: inline-block;
                font-size: 16px; /* Điều chỉnh kích thước sao theo mong muốn */
                color: gold; /* Màu của sao */
            }

            td {
                white-space: nowrap;
            }

            .checkbox-group .fa-star {
                color: gold; /* Màu của sao */
            }

            .vertical-table {
                display: table;
            }

            .table-row {
                display: table-row;
            }

            .table-cell {
                display: table-cell;
                padding: 20px 10px;
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
                                <a href="feedbackList" class="logo">
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
        <nav id="navigation">
            <!-- container -->
            <div class="container">
                <!-- responsive-nav -->
                <div id="responsive-nav">
                    <c:if test="${sessionScope.accS != null}">
                        <ul class="main-nav nav navbar-nav">
                            <li class="${menu eq 'post' ? 'active' : ''}">
                                <a href="post">Manage Blogs</a>
                            </li>
                            <li class="${menu eq 'productList' ? 'active' : ''}">
                                <a href="productList">Manage Product</a>
                            </li>
                            <li class="${menu eq 'feedbackList' ? 'active' : ''}">
                                <a href="feedbackList">Manage Feedback</a>
                            </li>
                        </ul>
                    </c:if>

                    <!-- /NAV -->
                </div>
                <!-- /responsive-nav -->
            </div>
            <!-- /container -->
        </nav>

        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive project-list">
                                <div class="vertical-table">
                                    <div class="table-row">
                                        <div class="table-cell text-center" style="font-weight: bold">Full Name:</div>
                                        <div class="table-cell text-center">${feedback.customerName}</div>
                                    </div>
                                    <div class="table-row">
                                        <div class="table-cell text-center" style="font-weight: bold">Email:</div>
                                        <div class="table-cell text-center">${customer.email}</div>
                                    </div>
                                    <div class="table-row">
                                        <div class="table-cell text-center" style="font-weight: bold">Mobile:</div>
                                        <div class="table-cell text-center">${customer.phone}</div>
                                    </div>
                                    <div class="table-row">
                                        <div class="table-cell text-center" style="font-weight: bold">Product Name:</div>
                                        <div class="table-cell text-center">${feedback.productName}</div>
                                    </div>
                                    <div class="table-row">
                                        <div class="table-cell text-center" style="font-weight: bold">Content:</div>
                                        <div class="table-cell text-center">${feedback.content}</div>
                                    </div>
                                    <div class="table-row">
                                        <div class="table-cell text-center" style="font-weight: bold">Rated star:</div>
                                        <div class="table-cell text-center">
                                            <c:forEach begin="1" end="${feedback.ratedStar}">
                                                <i class="fa fa-star"></i>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <div class="table-row">
                                        <div class="table-cell text-center" style="font-weight: bold">Status:</div>
                                        <div class="table-cell text-center">
                                            <form action="changeStatusF" id="statusForm">
                                                <input type="hidden" name="fid" value="${feedback.feedbackID}"/>
                                                <select name="statusF" onchange="submitForm()">
                                                    <option value="1" ${feedback.status eq '1'?'selected':''}>Pending</option>
                                                    <option value="2" ${feedback.status eq '2'?'selected':''}>In Progress</option>
                                                    <option value="3" ${feedback.status eq '3'?'selected':''}>Resolved</option>
                                                    <option value="4" ${feedback.status eq '4'?'selected':''}>Rejected</option>
                                                </select>
                                            </form>
                                            <script>
                                                function submitForm() {
                                                    document.getElementById("statusForm").submit();
                                                }
                                            </script>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end row -->
        </div>


        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
