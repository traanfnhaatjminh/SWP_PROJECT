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
        <title>Blog Page</title>

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

        <style type="text/css">
            body {
                background-color: #f4f7f6;
                margin-top: 20px;
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

            .card .header {
                color: #444;
                padding: 20px;
                position: relative;
                box-shadow: none;
            }

            .single_post {
                -webkit-transition: all .4s ease;
                transition: all .4s ease
            }

            .single_post .body {
                padding: 30px
            }

            .single_post .img-post {
                position: relative;
                overflow: hidden;
                max-height: 500px;
                margin-bottom: 30px
            }

            .single_post .img-post>img {
                -webkit-transform: scale(1);
                -ms-transform: scale(1);
                transform: scale(1);
                opacity: 1;
                -webkit-transition: -webkit-transform .4s ease, opacity .4s ease;
                transition: transform .4s ease, opacity .4s ease;
                max-width: 100%;
                filter: none;
                -webkit-filter: grayscale(0);
                -webkit-transform: scale(1.01)
            }

            .single_post .img-post:hover img {
                -webkit-transform: scale(1.02);
                -ms-transform: scale(1.02);
                transform: scale(1.02);
                opacity: .7;
                filter: gray;
                -webkit-filter: grayscale(1);
                -webkit-transition: all .8s ease-in-out
            }

            .single_post .img-post:hover .social_share {
                display: block
            }

            .single_post .footer {
                padding: 0 30px 30px 30px
            }

            .single_post .footer .actions {
                display: inline-block
            }

            .single_post .footer .stats {
                cursor: default;
                list-style: none;
                padding: 0;
                display: inline-block;
                float: right;
                margin: 0;
                line-height: 35px
            }

            .single_post .footer .stats li {
                border-left: solid 1px rgba(160, 160, 160, 0.3);
                display: inline-block;
                font-weight: 400;
                letter-spacing: 0.25em;
                line-height: 1;
                margin: 0 0 0 2em;
                padding: 0 0 0 2em;
                text-transform: uppercase;
                font-size: 13px
            }

            .single_post .footer .stats li a {
                color: #777
            }

            .single_post .footer .stats li:first-child {
                border-left: 0;
                margin-left: 0;
                padding-left: 0
            }

            .single_post h3 {
                font-size: 20px;
                text-transform: uppercase
            }

            .single_post h3 a {
                color: #242424;
                text-decoration: none
            }

            .single_post p {
                font-size: 16px;
                line-height: 26px;
                font-weight: 300;
                margin: 0
            }

            .single_post .blockquote p {
                margin-top: 0 !important
            }

            .single_post .meta {
                list-style: none;
                padding: 0;
                margin: 0
            }

            .single_post .meta li {
                display: inline-block;
                margin-right: 15px
            }

            .single_post .meta li a {
                font-style: italic;
                color: #959595;
                text-decoration: none;
                font-size: 12px
            }

            .single_post .meta li a i {
                margin-right: 6px;
                font-size: 12px
            }

            .single_post2 {
                overflow: hidden
            }

            .single_post2 .content {
                margin-top: 15px;
                margin-bottom: 15px;
                padding-left: 80px;
                position: relative
            }

            .single_post2 .content .actions_sidebar {
                position: absolute;
                top: 0px;
                left: 0px;
                width: 60px
            }

            .single_post2 .content .actions_sidebar a {
                display: inline-block;
                width: 100%;
                height: 60px;
                line-height: 60px;
                margin-right: 0;
                text-align: center;
                border-right: 1px solid #e4eaec
            }

            .single_post2 .content .title {
                font-weight: 100
            }

            .single_post2 .content .text {
                font-size: 15px
            }

            .right-box .categories-clouds li {
                display: inline-block;
                margin-bottom: 5px
            }

            .right-box .categories-clouds li a {
                display: block;
                border: 1px solid;
                padding: 6px 10px;
                border-radius: 3px
            }

            .right-box .instagram-plugin {
                overflow: hidden
            }

            .right-box .instagram-plugin li {
                float: left;
                overflow: hidden;
                border: 1px solid #fff
            }

            .comment-reply li {
                margin-bottom: 15px
            }

            .comment-reply li:last-child {
                margin-bottom: none
            }

            .comment-reply li h5 {
                font-size: 18px
            }

            .comment-reply li p {
                margin-bottom: 0px;
                font-size: 15px;
                color: #777
            }

            .comment-reply .list-inline li {
                display: inline-block;
                margin: 0;
                padding-right: 20px
            }

            .comment-reply .list-inline li a {
                font-size: 13px
            }

            @media (max-width: 640px) {
                .blog-page .left-box .single-comment-box>ul>li {
                    padding: 25px 0
                }

                .blog-page .left-box .single-comment-box ul li .icon-box {
                    display: inline-block
                }

                .blog-page .left-box .single-comment-box ul li .text-box {
                    display: block;
                    padding-left: 0;
                    margin-top: 10px
                }

                .blog-page .single_post .footer .stats {
                    float: none;
                    margin-top: 10px
                }

                .blog-page .single_post .body,
                .blog-page .single_post .footer {
                    padding: 30px
                }
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
                        <div class="col-md-3">
                            <div class="header-logo ">
                                <a href="blog?menu=blog" class="logo">
                                    CLOTHINGMAKER
                                </a>
                            </div>
                        </div>
                        <!-- /LOGO -->

                        <div class="col-md-3 clearfix" style="float: right">
                            <div class="header-ctn">
                                <!-- Cart -->
                                <div class="dropdown">
                                    <c:if test="${sessionScope.accC == null}">
                                        <a href="login.jsp" class="">
                                            <i class="fa fa-shopping-cart"></i>
                                            <span>Shopping Cart</span>
                                            <div class="qty">${size}</div>
                                        </a>
                                    </c:if>
                                    <c:if test="${sessionScope.accC != null}">
                                        <a href="cart" class="">
                                            <i class="fa fa-shopping-cart"></i>
                                            <span>Shopping Cart</span>
                                            <div class="qty">${size}</div>
                                        </a>
                                    </c:if>
                                </div>

                            </div>
                        </div>

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
        <jsp:include page="navigation.jsp"></jsp:include>
            <div id="main-content" class="blog-page">
                <div class="container">
                    <div class="row clearfix">
                        <div class="col-lg-9 col-md-12 left-box">
                        <c:if test="${error == null}">
                            <form action="sortBlog" style="margin: 2% 0">
                                <label for="sortSelect">Sort by:</label>
                                <select name="sortSelect" id="sortSelect">
                                    <option value="postDateRecent">Recent Updated Date</option>
                                </select>
                                <input type="submit" value="Sort">
                            </form>
                        </c:if>
                        <c:forEach items="${listBlog}" var="c">
                            <div class="col-md-4">
                                <div class="card single_post">
                                    <div class="body">
                                        <div class="img-post">
                                            <img class="d-block img-fluid" src="${c.blogImage}" alt="First slide">
                                        </div>
                                        <h3 class="product-name"><a href="blogDetail?id=${c.blogID}">${c.blogTitle}</a></h3>
                                        <p class="product-name">${c.content}</p>
                                        <p>Date: ${c.postDate}</p>
                                        <p>Author: ${c.author}</p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <c:if test="${error == null}">
                            <div class="store-filter clearfix col-md-12">
                                <ul class="store-pagination">
                                    <c:forEach begin="1" end="${endIndex}" var="c">
                                        <c:set var="isActive" value="${c eq currentPage ? 'active' : ''}" />
                                        <li class="${isActive}"><a href="blogListPage?index=${c}">${c}</a></li>
                                        </c:forEach>
                                </ul>
                            </div>
                        </c:if>
                    </div>
                    <div class="col-lg-3 col-md-12 right-box">
                        <div class="card">
                            <div class="body search">
                                <form action="searchBlog">
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
                        <div class="card">
                            <div class="header">
                                <h2>Categories</h2>
                            </div>
                            <div class="body widget">
                                <ul class="list-unstyled categories-clouds m-b-0">
                                    <c:forEach items="${listBlogCategory}" var="c">
                                        <li><a href="blogCategory?id=${c.id}&&menu=blog">${c.name}</a></li>
                                        </c:forEach>
                                </ul>
                            </div>
                        </div>
                        <div class="card">
                            <div class="header">
                                <h2>Latest Blog</h2>
                            </div>
                            <div class="body widget popular-post">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="single_post">
                                            <h3><a href="blogDetail?id=${latestBlog.blogID}">${latestBlog.blogTitle}</a></h3>
                                            <p class="product-name">${latestBlog.content}</p>
                                            <p>Date: ${latestBlog.postDate}</p>
                                            <p>Author: ${latestBlog.author}</p>
                                            <div class="img-post">
                                                <img src="${latestBlog.blogImage}"
                                                     alt=" Image">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>

