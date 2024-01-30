<%-- 
    Document   : blog
    Created on : Jan 18, 2024, 11:36:21 AM
    Author     : minh1
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            body{
                margin-top:20px;
            }
            .blog-listing {
                padding-top: 30px;
                padding-bottom: 30px;
            }
            .gray-bg {
                background-color: #f5f5f5;
            }
            /* Blog 
            ---------------------*/
            .blog-grid {
                box-shadow: 0 0 30px rgba(31, 45, 61, 0.125);
                border-radius: 5px;
                overflow: hidden;
                background: #ffffff;
                margin-top: 15px;
                margin-bottom: 15px;
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

            .blog-grid .blog-img {
                position: relative;
            }
            .blog-grid .blog-img .date {
                position: absolute;
                background: #fc5356;
                color: #ffffff;
                padding: 8px 15px;
                left: 10px;
                top: 10px;
                border-radius: 4px;
            }
            .blog-grid .blog-img .date span {
                font-size: 22px;
                display: block;
                line-height: 22px;
                font-weight: 700;
            }
            .blog-grid .blog-img .date label {
                font-size: 14px;
                margin: 0;
            }
            .blog-grid .blog-info {
                padding: 20px;
            }
            .blog-grid .blog-info h5 {
                font-size: 22px;
                font-weight: 700;
                margin: 0 0 10px;
            }
            .blog-grid .blog-info h5 a {
                color: #20247b;
            }
            .blog-grid .blog-info p {
                margin: 0;
            }
            .blog-grid .blog-info .btn-bar {
                margin-top: 20px;
            }


            /* Blog Sidebar
            -------------------*/
            .blog-aside .widget {
                box-shadow: 0 0 30px rgba(31, 45, 61, 0.125);
                border-radius: 5px;
                overflow: hidden;
                background: #ffffff;
                margin-top: 15px;
                margin-bottom: 15px;
                width: 100%;
                display: inline-block;
                vertical-align: top;
            }
            .blog-aside .widget-body {
                padding: 15px;
            }
            .blog-aside .widget-title {
                padding: 15px;
                border-bottom: 1px solid #eee;
            }
            .blog-aside .widget-title h3 {
                font-size: 20px;
                font-weight: 700;
                color: #fc5356;
                margin: 0;
            }
            .blog-aside .widget-author .media {
                margin-bottom: 15px;
            }
            .blog-aside .widget-author p {
                font-size: 16px;
                margin: 0;
            }
            .blog-aside .widget-author .avatar {
                width: 70px;
                height: 70px;
                border-radius: 50%;
                overflow: hidden;
            }
            .blog-aside .widget-author h6 {
                font-weight: 600;
                color: #20247b;
                font-size: 22px;
                margin: 0;
                padding-left: 20px;
            }
            .blog-aside .post-aside {
                margin-bottom: 15px;
            }
            .blog-aside .post-aside .post-aside-title h5 {
                margin: 0;
            }
            .blog-aside .post-aside .post-aside-title a {
                font-size: 18px;
                color: #20247b;
                font-weight: 600;
            }
            .blog-aside .post-aside .post-aside-meta {
                padding-bottom: 10px;
            }
            .blog-aside .post-aside .post-aside-meta a {
                color: #6F8BA4;
                font-size: 12px;
                text-transform: uppercase;
                display: inline-block;
                margin-right: 10px;
            }
            .blog-aside .latest-post-aside + .latest-post-aside {
                border-top: 1px solid #eee;
                padding-top: 15px;
                margin-top: 15px;
            }
            .blog-aside .latest-post-aside .lpa-right {
                width: 90px;
            }
            .blog-aside .latest-post-aside .lpa-right img {
                border-radius: 3px;
            }
            .blog-aside .latest-post-aside .lpa-left {
                padding-right: 15px;
            }
            .blog-aside .latest-post-aside .lpa-title h5 {
                margin: 0;
                font-size: 15px;
            }
            .blog-aside .latest-post-aside .lpa-title a {
                color: #20247b;
                font-weight: 600;
            }
            .blog-aside .latest-post-aside .lpa-meta a {
                color: #6F8BA4;
                font-size: 12px;
                text-transform: uppercase;
                display: inline-block;
                margin-right: 10px;
            }

            .tag-cloud a {
                padding: 4px 15px;
                font-size: 13px;
                color: #ffffff;
                background: #20247b;
                border-radius: 3px;
                margin-right: 4px;
                margin-bottom: 4px;
            }
            .tag-cloud a:hover {
                background: #fc5356;
            }

            .blog-single {
                padding-top: 30px;
                padding-bottom: 30px;
            }

            .article {
                box-shadow: 0 0 30px rgba(31, 45, 61, 0.125);
                border-radius: 5px;
                overflow: hidden;
                background: #ffffff;
                padding: 15px;
                margin: 15px 0 30px;
            }
            .article .article-title {
                padding: 15px 0 20px;
            }
            .article .article-title h6 {
                font-size: 14px;
                font-weight: 700;
                margin-bottom: 20px;
            }
            .article .article-title h6 a {
                text-transform: uppercase;
                color: #fc5356;
                border-bottom: 1px solid #fc5356;
            }
            .article .article-title h2 {
                color: #20247b;
                font-weight: 600;
            }
            .article .article-title .media {
                padding-top: 15px;
                border-bottom: 1px dashed #ddd;
                padding-bottom: 20px;
            }
            .article .article-title .media .avatar {
                width: 45px;
                height: 45px;
                border-radius: 50%;
                overflow: hidden;
            }
            .article .article-title .media .media-body {
                padding-left: 8px;
            }
            .article .article-title .media .media-body label {
                font-weight: 600;
                color: #fc5356;
                margin: 0;
            }
            .article .article-title .media .media-body span {
                display: block;
                font-size: 12px;
            }
            .article .article-content h1,
            .article .article-content h2,
            .article .article-content h3,
            .article .article-content h4,
            .article .article-content h5,
            .article .article-content h6 {
                color: #20247b;
                font-weight: 600;
                margin-bottom: 15px;
            }
            .article .article-content blockquote {
                max-width: 600px;
                padding: 15px 0 30px 0;
                margin: 0;
            }
            .article .article-content blockquote p {
                font-size: 20px;
                font-weight: 500;
                color: #fc5356;
                margin: 0;
            }
            .article .article-content blockquote .blockquote-footer {
                color: #20247b;
                font-size: 16px;
            }
            .article .article-content blockquote .blockquote-footer cite {
                font-weight: 600;
            }
            .article .tag-cloud {
                padding-top: 10px;
            }

            .article-comment {
                box-shadow: 0 0 30px rgba(31, 45, 61, 0.125);
                border-radius: 5px;
                overflow: hidden;
                background: #ffffff;
                padding: 20px;
            }
            .article-comment h4 {
                color: #20247b;
                font-weight: 700;
                margin-bottom: 25px;
                font-size: 22px;
            }
            img {
                max-width: 100%;
            }
            img {
                vertical-align: middle;
                border-style: none;
            }

            /* Contact Us
            ---------------------*/
            .contact-name {
                margin-bottom: 30px;
            }
            .contact-name h5 {
                font-size: 22px;
                color: #20247b;
                margin-bottom: 5px;
                font-weight: 600;
            }
            .contact-name p {
                font-size: 18px;
                margin: 0;
            }

            .social-share a {
                width: 40px;
                height: 40px;
                line-height: 40px;
                border-radius: 50%;
                color: #ffffff;
                text-align: center;
                margin-right: 10px;
            }
            .social-share .dribbble {
                box-shadow: 0 8px 30px -4px rgba(234, 76, 137, 0.5);
                background-color: #ea4c89;
            }
            .social-share .behance {
                box-shadow: 0 8px 30px -4px rgba(0, 103, 255, 0.5);
                background-color: #0067ff;
            }
            .social-share .linkedin {
                box-shadow: 0 8px 30px -4px rgba(1, 119, 172, 0.5);
                background-color: #0177ac;
            }

            .contact-form .form-control {
                border: none;
                border-bottom: 1px solid #20247b;
                background: transparent;
                border-radius: 0;
                padding-left: 0;
                box-shadow: none !important;
            }
            .contact-form .form-control:focus {
                border-bottom: 1px solid #fc5356;
            }
            .contact-form .form-control.invalid {
                border-bottom: 1px solid #ff0000;
            }
            .contact-form .send {
                margin-top: 20px;
            }
            @media (max-width: 767px) {
                .contact-form .send {
                    margin-bottom: 20px;
                }
            }

            .section-title h2 {
                font-weight: 700;
                color: #20247b;
                font-size: 45px;
                margin: 0 0 15px;
                border-left: 5px solid #fc5356;
                padding-left: 15px;
            }
            .section-title {
                padding-bottom: 45px;
            }
            .contact-form .send {
                margin-top: 20px;
            }
            .px-btn {
                padding: 0 50px 0 20px;
                line-height: 60px;
                position: relative;
                display: inline-block;
                color: #20247b;
                background: none;
                border: none;
            }
            .px-btn:before {
                content: "";
                position: absolute;
                top: 0;
                left: 0;
                display: block;
                border-radius: 30px;
                background: transparent;
                border: 1px solid rgba(252, 83, 86, 0.6);
                border-right: 1px solid transparent;
                -moz-transition: ease all 0.35s;
                -o-transition: ease all 0.35s;
                -webkit-transition: ease all 0.35s;
                transition: ease all 0.35s;
                width: 60px;
                height: 60px;
            }
            .px-btn .arrow {
                width: 13px;
                height: 2px;
                background: currentColor;
                display: inline-block;
                position: absolute;
                top: 0;
                bottom: 0;
                margin: auto;
                right: 25px;
            }
            .px-btn .arrow:after {
                width: 8px;
                height: 8px;
                border-right: 2px solid currentColor;
                border-top: 2px solid currentColor;
                content: "";
                position: absolute;
                top: -3px;
                right: 0;
                display: inline-block;
                -moz-transform: rotate(45deg);
                -o-transform: rotate(45deg);
                -ms-transform: rotate(45deg);
                -webkit-transform: rotate(45deg);
                transform: rotate(45deg);
            }
        </style>
    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
        <jsp:include page="navigation.jsp"></jsp:include>
            <div id="main-content" class="blog-page">
                <div class="container">
                    <div class="row clearfix">
                        <div class="col-lg-9 col-md-12 left-box">
                            <article class="article">
                                <div class="article-img">
                                    <img src="${blogDetail.blogImage}" title="" alt="">
                            </div>
                            <div class="article-title">
                                <h6><a href="#">${blogCategoryName}</a></h6>
                                <h2>${blogDetail.blogTitle}</h2>
                                <div class="media">
                                    <div class="avatar">
                                        <img src="https://bootdey.com/img/Content/avatar/avatar1.png" title="" alt="">
                                    </div>
                                    <div class="media-body">
                                        <label>${blogDetail.author}</label>
                                        <span>${blogDetail.postDate}</span>
                                    </div>
                                </div>
                            </div>
                            <div class="article-content">
                                <p>${blogDetail.content}</p>
                            </div>
                        </article>
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
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>

