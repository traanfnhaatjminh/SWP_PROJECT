<%-- 
    Document   : profile
    Created on : 19-01-2024, 16:07:07
    Author     : nguye
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <link type="text/css" rel="stylesheet" href="css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="css/style.css"/>

        <link rel="stylesheet" href="./css/home.css"/>
    </head>
    <style>
        .dashboard_tab_button a {
            background-color: black;
            color: white;

        }
        .dashboard_tab_button li {
            border: 9px rgb(243, 247, 241);
            padding: 2px;
            margin-bottom: 10px;
        }
    </style>
    <body>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
            <div class="container">
                <div class="row">
                    <div class="col-6">
                        <ul>
                        <c:if test="${sessionScope.customer.avatar == null}">
                            <img
                                style="width: 255px; height: 140px"
                                src="https://vnn-imgs-f.vgcloud.vn/2020/03/23/11/trend-avatar-1.jpg"
                                alt
                                class="d-block ui-w-80"
                                />  
                        </c:if>

                        <c:if test="${sessionScope.customer.avatar != null}">
                            <img
                                style="width: 255px; height: 140px"
                                src="${sessionScope.customer.avatar}"
                                alt
                                class="d-block ui-w-80"
                                />   
                        </c:if>

                        <div class="col-lg-6 col-md-3 col-lg-3">
                            <div class="dashboard_tab_button">
                                <ul role="tablist" class="nav flex-column dashboard-list">
                                    <li><a href="profile.jsp" data-toggle="tab" class="nav-link">Profile</a></li>
                                    <li> <a href="changepass.jsp" data-toggle="tab" class="nav-link">Change PassWord</a></li>
                                    <li><a href="editprofile.jsp" data-toggle="tab" class="nav-link">Edit Profile</a></li>                                                  
                                </ul>
                            </div>    
                        </div>  
                    </ul>
                    <button style="background-color: black; color: white; margin-top: 100px; margin-left: 30px;">Back</button>
                </div>
                <div class="col-6">
                    <p style="background-color: rgb(63, 60, 60); color: white; padding: 30px 30px; text-align: center;">This is your personal page</p>
                    <h3 style="">About you</h3>
                    <label class="form-label">FullName</label>
                    <input type="text" class="form-control mb-1" name="user_name" value="${sessionScope.customer.fullName}">
                    <label class="form-label">Phone</label>
                    <input type="text" class="form-control mb-1" name="user_name" value="${sessionScope.customer.phone}"">
                    <label class="form-label">Email</label>
                    <input type="text" class="form-control mb-1" name="user_name" value="${sessionScope.customer.email}"">
                    <label class="form-label">Adress</label>
                    <input type="text" class="form-control mb-1" name="user_name" value="${sessionScope.customer.address}"">
                    <label class="form-label">Gender</label>
                    <input type="text" class="form-control mb-1" name="user_name" value="${sessionScope.customer.gender}"">
                </div>      
            </div>
        </div>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/nouislider.min.js"></script>
        <script src="js/jquery.zoom.min.js"></script>
        <script src="js/main.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </body>
</html>
