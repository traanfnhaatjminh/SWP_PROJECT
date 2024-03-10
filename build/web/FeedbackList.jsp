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
        <title>Feedback List Page</title>

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
                                <a href="post" class="logo">
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
                <div class="col-xl-3 col-md-6">
                    <div class="card bg-pattern">
                        <div class="card-body addnewblog">
                            <form action="sortCustomerName">
                                <label>SORT BY:</label>
                                <select name="sortSelect">
                                    <option value="atoz">Full Name from A to Z</option>
                                    <option value="ztoa">Full Name from Z to A</option>
                                    <option value="atozP">Product Name from A to Z</option>
                                    <option value="ztoaP">Product Name from Z to A</option>
                                </select>
                                <button type="submit" class="btn btn-default">Sort</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6">
                    <div class="card">
                        <div class="card-body addnewblog">
                            <form action="searchFeedback">
                                <div class="form-group mb-0">
                                    <div class="input-group mb-0">
                                        <input style="width: 520px" type="text" name="searchFeedback" class="form-control" value="${searchValue}" placeholder="Search..." aria-describedby="project-search-addon" />
                                        <div class="input-group-append searchblog">
                                            <button class="btn btn-danger" type="submit" id="project-search-addon"><i class="fa fa-search search-icon font-12"></i></button>
                                                <c:if test="${error != null}">
                                                <h5 class="text-danger">${error}</h5>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end row -->
            <div class="col-md-12">
                <div class="col-md-4">
                    <h2 style="margin-top: 40px" class="grid-title"><i class="fa fa-filter"></i> Filters</h2> 
                </div>

                <hr>
                <div class="col-md-8" style="margin-left: -108px; margin-top: -50px; margin-bottom: 10px;">
                    <form id="categoryFilterForm" action="filterFeedback">
                        <div style="display: flex">
                            <h4>By rated star:</h4>
                            <div class="checkbox-group" style="margin-left: 10px;">
                                <div class="checkbox-post">
                                    <label><input name="ratedstar" type="checkbox" value="1" class="icheck" ${'1' eq selectedStar ? 'checked' : ''} ${selectedStarAll != null ? 'checked' : ''}>
                                        <i class="fa fa-star"></i>
                                    </label>
                                    <label><input name="ratedstar" type="checkbox" value="2" class="icheck" ${'2' eq selectedStar ? 'checked' : ''} ${selectedStarAll != null ? 'checked' : ''}>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </label>
                                    <label><input name="ratedstar" type="checkbox" value="3" class="icheck" ${'3' eq selectedStar ? 'checked' : ''} ${selectedStarAll != null ? 'checked' : ''}>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </label>
                                    <label><input name="ratedstar" type="checkbox" value="4" class="icheck" ${'4' eq selectedStar ? 'checked' : ''} ${selectedStarAll != null ? 'checked' : ''}>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </label>
                                    <label><input name="ratedstar" type="checkbox" value="5" class="icheck" ${'5' eq selectedStar ? 'checked' : ''} ${selectedStarAll != null ? 'checked' : ''}>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div style="display: flex">
                            <h4>By status:</h4>
                            <div class="checkbox-group" style="margin-left: 10px;">
                                <div class="checkbox-post">
                                    <label><input name="status" type="checkbox" value="1" class="icheck" ${'1' eq selectedStatus ? 'checked' : ''} ${selectedStatusAll != null ? 'checked' : ''}>Pending</label>
                                </div>
                                <div class="checkbox-post">
                                    <label><input name="status" type="checkbox" value="2" class="icheck" ${'2' eq selectedStatus ? 'checked' : ''} ${selectedStatusAll != null ? 'checked' : ''}>In Progress</label>
                                </div>
                                <div class="checkbox-post">
                                    <label><input name="status" type="checkbox" value="3" class="icheck" ${'3' eq selectedStatus ? 'checked' : ''} ${selectedStatusAll != null ? 'checked' : ''}>Resolved</label>
                                </div>
                                <div class="checkbox-post">
                                    <label><input name="status" type="checkbox" value="4" class="icheck" ${'4' eq selectedStatus ? 'checked' : ''} ${selectedStatusAll != null ? 'checked' : ''}>Rejected</label>
                                </div>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-default">Submit</button>
                    </form> 
                </div>

                <div class="padding"></div>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive project-list">
                                <table class="table project-table table-centered table-nowrap">
                                    <thead>
                                        <tr>
                                            <th scope="col">Full Name</th>
                                            <th scope="col">Product Name</th>
                                            <th scope="col">Content</th>
                                            <th scope="col">Rated star</th>
                                            <th scope="col">Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listFeedback}" var="c">
                                            <tr>
                                                <th scope="row">${c.customerName}</th>
                                                <td>${c.productName}</td>
                                                <td>${c.content}</td>
                                                <td>
                                                    <c:forEach begin="1" end="${c.ratedStar}">
                                                        <i class="fa fa-star"></i>
                                                    </c:forEach>
                                                </td>
                                                <td>
                                                    <form action="changeStatusF" id="statusForm">
                                                        <input type="hidden" name="fid" value="${c.feedbackID}"/>
                                                        <select name="statusF" onchange="submitForm()">
                                                            <option value="1" ${c.status eq '1'?'selected':''}>Pending</option>
                                                            <option value="2" ${c.status eq '2'?'selected':''}>In Progress</option>
                                                            <option value="3" ${c.status eq '3'?'selected':''}>Resolved</option>
                                                            <option value="4" ${c.status eq '4'?'selected':''}>Rejected</option>
                                                        </select>
                                                    </form>

                                                </td>
                                            </tr>
                                        <script>
                                            function submitForm() {
                                                document.getElementById("statusForm").submit();
                                            }
                                        </script>
                                    </c:forEach>

                                    </tbody>
                                </table>
                            </div>
                            <!-- end project-list -->

                            <div class="pt-3">
                                <c:if test="${error == null}">
                                    <ul class="pagination justify-content-end mb-0">
                                        <!--                                        <li class="page-item disabled">
                                                                                    <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                                                                                </li>-->
                                        <c:forEach begin="1" end="${endIndex}" var="c">
                                            <c:set var="isActive" value="${c eq currentPage ? 'active' : ''}" />
                                            <li class="${isActive}"><a class="page-link" href="feedbackListPage?index=${c}">${c}</a></li>
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


        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
