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
                                <a href="blog?menu=blog" class="logo">
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
                    <!-- NAV -->
                    <c:if test="${sessionScope.accS == null}">
                        <ul class="main-nav nav navbar-nav">
                            <li class="${menu == null ? 'active' : ''}"><a href="home">Home</a></li>
                            <!--<li><a href="#">Hot Deals</a></li>-->
                            <li class="${menu eq 'blog' ? 'active' : ''}">
                                <a href="blog?menu=blog">Blogs</a>
                            </li>
                            <c:forEach items="${listC}" var="c">
                                <li class="${cateID == c.cid ? 'active' : ''}">   
                                    <a href="categoryDetail?cid=${c.cid}&&menu=home">${c.cname}</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </c:if>
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
                <div class="col-xl-3 col-md-3">
                    <div class="card bg-pattern">
                        <div class="card-body addnewblog">
                            <label style="margin-top: 2%" for="addPost">ADD A NEW BLOG:</label>
                            <button type="button" class="btn btn-default">
                                <a href="addBlog" target="target">Add</a>
                            </button>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-5">
                    <div class="card bg-pattern">
                        <div class="card-body addnewblog">
                            <form action="sortPost">
                                <label>SORT BY:</label>
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
                </div>
                <div class="col-xl-3 col-md-4">
                    <div class="card">
                        <div class="card-body addnewblog">
                            <form action="searchPost">
                                <div class="form-group mb-0">
                                    <div class="input-group mb-0">
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
                </div>
            </div>
            <!-- end row -->
            <div class="col-md-12">
                <div class="col-md-4">
                    <h2 style="margin-top: 40px" class="grid-title"><i class="fa fa-filter"></i> Filters</h2> 
                </div>

                <hr>
                <div class="col-md-8" style="margin-left: -108px; margin-top: -50px; margin-bottom: 10px;">
                    <form id="categoryFilterForm" action="filterPost">
                        <div style="display: flex">
                            <h4>By category:</h4>
                            <div class="checkbox-group" style="margin-left: 2px;">
                                <c:forEach items="${listBlogCategory}" var="c">
                                    <div class="checkbox-post">
                                        <label><input name="categories" type="checkbox" value="${c.name}" class="icheck">${c.name}</label>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div style="display: flex">
                            <h4>By status:</h4>
                            <div class="checkbox-group" style="margin-left: 10px;">
                                <div class="checkbox-post">
                                    <label><input name="status" type="checkbox" value="Public" class="icheck" ${'Public' eq selectedStatus ? 'checked' : ''} ${selectedStatusAll != null ? 'checked' : ''}>Public</label>
                                </div>
                                <div class="checkbox-post">
                                    <label><input name="status" type="checkbox" value="Private" class="icheck" ${'Private' eq selectedStatus ? 'checked' : ''} ${selectedStatusAll != null ? 'checked' : ''}>Private</label>
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
                                            <th scope="col">ID</th>
                                            <th scope="col">Image</th>
                                            <th scope="col">Title</th>
                                            <th scope="col">Category</th>
                                            <th scope="col">Author</th>
                                            <th scope="col">Status</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listBlog}" var="c">
                                            <tr>
                                                <th scope="row">${c.blogID}</th>
                                                <td style="width: 20%">
                                                    <img style="width: 20%" class="d-block img-fluid" src="${c.blogImage}" alt="First slide">
                                                </td>
                                                <td>${c.blogTitle}</td>
                                                <c:if test="${c.blogCategoryID == 1}">
                                                    <td>Fashion Trends</td>
                                                </c:if>
                                                <c:if test="${c.blogCategoryID == 2}">
                                                    <td>Mix-Match Guides</td>
                                                </c:if>
                                                <c:if test="${c.blogCategoryID == 3}">
                                                    <td>Size and style guides</td>
                                                </c:if>
                                                <c:if test="${c.blogCategoryID == 4}">
                                                    <td>Clothing Care</td>
                                                </c:if>
                                                <td>${c.author}</td>
                                                <td>
                                                    <c:if test="${c.status eq 'Public'}">
                                                        <button type="button" class="btn btn-success">${c.status}</button>
                                                    </c:if>
                                                    <c:if test="${c.status eq 'Private'}">
                                                        <button type="button" class="btn btn-danger">${c.status}</button>
                                                    </c:if>
                                                </td>
                                                <td>
                                                    <div class="action">
                                                        <a href="editBlog?id=${c.blogID}" class="text-success mr-4" data-toggle="tooltip" data-placement="top" title="" data-original-title="Edit"> <i class="fa fa-pencil h5 m-0"></i></a>
                                                        <a href="javascript:void(0);" class="text-danger" data-toggle="tooltip" data-placement="top" title="" data-original-title="Close" onclick="confirmDelete(${c.blogID}, ${currentPage});"> <i class="fa fa-remove h5 m-0"></i></a>
                                                    </div>
                                                </td>
                                            </tr>    
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
        <script>
            import { Ripple, initMDB } from "mdb-ui-kit";

            initMDB({Ripple});
        </script>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>

