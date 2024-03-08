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
        <title>My Order Page</title>

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
            tr , th , td {
                padding: 5px;
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
        <!-- responsive-nav -->
        <div id="responsive-nav">
            <!-- NAV -->
            <c:if test="${sessionScope.marketer != null}">
                <ul class="main-nav nav navbar-nav">
                    <li class="${menu == null ? 'active' : ''} ${menu eq 'blog' ? 'active' : ''}">
                        <a href="blog?menu=blog">Blogs</a>
                    </li>
                    <li class="${menu eq 'post' ? 'active' : ''}">
                        <a href="post?menu=post">Manage Blogs</a>
                    </li>
                </ul>
            </c:if>

            <!-- /NAV -->
        </div>
        <!-- /responsive-nav -->
    </div>
    <!-- /container -->
</nav>
<!--            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3">
                        <h2 style="margin-top: 7%" class="grid-title"><i class="fa fa-filter"></i> Filters</h2>
                        <hr>

                        <form id="categoryFilterForm" action="filterPost">
                            <h4>By category:</h4>
<c:forEach items="${listBlogCategory}" var="c">
    <div class="checkbox">
        <label><input name="categories" type="checkbox" value="${c.name}" class="icheck">${c.name}</label>
    </div>
</c:forEach>
<h4>By status:</h4>
<div class="checkbox">
    <label><input name="status" type="checkbox" value="Public" class="icheck" ${'Public' eq selectedStatus ? 'checked' : ''} ${selectedStatusAll != null ? 'checked' : ''}>Public</label>
    <label><input name="status" type="checkbox" value="Private" class="icheck" ${'Private' eq selectedStatus ? 'checked' : ''} ${selectedStatusAll != null ? 'checked' : ''}>Private</label>
</div>
<button type="submit" class="btn btn-default">Submit</button>
</form>

END FILTER BY CATEGORY 

<div class="padding"></div>
</div>
END FILTERS 
<div id="main-content" class="blog-page col-md-9">
<div class="container">
<div class="row clearfix">
    <div class="col-lg-9 col-md-12 left-box">
        <label style="margin-top: 2%" for="addPost">ADD A NEW BLOG:</label>
        <button type="button" class="btn btn-default">
            <a href="addBlog" target="target">Add</a>
        </button>
        <div class="store-filter clearfix">
            <div class="store-sort">
                <form action="sortPost">
                    SORT BY:
                    <select name="sortSelect">
                        <option value="atoz">Title from A to Z</option>
                        <option value="ztoa">Title from Z to A</option>
<c:forEach items="${listBlogCategory}" var="c">
    <option value="${c.id}">Category: ${c.name}</option>
</c:forEach>
<option value="Public">Status: Public</option>
<option value="Private">Status: Private</option>
</select>
<button type="submit" class="btn btn-default">Sort</button>
</form>
</div>
</div>
<div class="card">
<div class="body search">
<form action="searchPost">
<div class="input-group m-b-0">
<div class="input-group-prepend">
    <span class="input-group-text"><i class="fa fa-search"></i></span>
</div>
<input type="text" class="form-control" name="searchBlog" value="${searchValue}" placeholder="Search...">
<button type="submit" class="btn btn-primary">Search</button>
<c:if test="${error != null}">
    <h5 class="text-danger">${error}</h5>
</c:if>
</div>
</form>
</div>
</div>

                
<c:if test="${error == null}">
    <div class="store-filter clearfix col-md-12">
        <ul class="store-pagination">
    <c:forEach begin="1" end="${endIndex}" var="c">
        <c:set var="isActive" value="${c eq currentPage ? 'active' : ''}" />
        <li class="${isActive}"><a href="postListPage?index=${c}">${c}</a></li>
    </c:forEach>
</ul>
</div>
</c:if>
</div>
</div>
</div>
</div>
</div>
</div>-->

<div class="container mt-4 mb-5">
    <div class="row justify-content-end pr-5">
        <div class="col-4">
            <form action="searchOrder pr-4">
                <div class="form-group mb-0 " >
                    <div class="input-group mb-0 flex-nowrap">
                        <input style="width: 360px" type="text" name="searchBlog" class="form-control" value="${searchValue}" placeholder="Search..." aria-describedby="project-search-addon" />
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
    <!-- end row -->

    <div class="row mt-4">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive project-list">
                        <div class="card">
                            <c:forEach items="${listOrder}" var="o" varStatus="loop"> 
                                <c:set value="1" var="index" />
                                <b>${loop.index+1}</b>
                                <div class="card-header ml-3 d-flex justify-content-between">
                                    <table border="1">
                                        <tr class="p-2">
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Address</th>
                                            <th>Phone</th>
                                            <th>Date Buy</th>
                                            <th>Total Cost</th>
                                        </tr>
                                        <tr>
                                            <td>${o.orderID}</td>
                                            <td>${o.orderName}</td>
                                            <td>${o.orderAddress}</td>
                                            <td>${o.orderPhone}</td>
                                            <td>${o.orderDate}</td>
                                            <td>$${o.totalCost}</td>
                                        </tr>

                                    </table>
                                        <div><a href="orderDetail?orderID=${o.orderID}">Detail</a></div>
                                </div>
                                <div class="card-body">
                                    <table class="table project-table table-centered table-nowrap">
                                        <thead>
                                            <tr>
                                                <th scope="col">STT</th>
                                                <th scope="col">Image</th>
                                                <th scope="col">Title</th>
                                                <th scope="col">Price</th>
                                                <th scope="col">Quantity</th>
                                                <th scope="col">Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listOrderDetail}" var="od" varStatus="loop1">
                                                <c:if test="${o.orderID == od.orderID}">
                                                    <tr>
                                                    <th scope="row">${index}</th>
                                                    <td style="width: 20%">
                                                        <img style="width: 25%" class="d-block img-fluid" src="${od.product.getImage()}" alt="">
                                                    </td>
                                                    <td>${od.product.name}</td>
                                                    <td>${od.productPrice}</td>
                                                    <td>${od.quantity}</td>
                                                    <td>${od.totalCost}</td>
                                                    <c:set value="${index+1}" var="index" />
                                                </tr>    
                                                </c:if>
                                            </c:forEach>

                                        </tbody>
                                    </table>
                                </div>
                            </c:forEach>

                        </div>

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

