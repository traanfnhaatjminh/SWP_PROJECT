<%-- 
    Document   : Profile_thaythe
    Created on : 07-03-2024, 10:58:10
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <link rel='stylesheet' href='https://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css'>
        <script src='https://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js'></script>
        <link rel="stylesheet" href="./new_assetss/css/main.css"/>
        <style>
            .inf-content{
                border:1px solid #DDDDDD;
                -webkit-border-radius:10px;
                -moz-border-radius:10px;
                border-radius:10px;
                box-shadow: 7px 7px 7px rgba(0, 0, 0, 0.3);
            }
        </style>
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
                                <a style="color: whitesmoke" href="home" class="logo">
                                    CLOTHINGMAKER
                                </a>
                            </div>
                        </div>
                        <!-- /LOGO -->
                    </div>
                </div>
            </div>


        </header>
                            
        <div class="app-title">
            <ul class="app-breadcrumb breadcrumb side">
                <li class="glyphicon glyphicon-user text-primary"><a href="profile.jsp"><b>Profile</b></a></li>
            </ul>
            <ul class="app-breadcrumb breadcrumb side">
                <li class="glyphicon glyphicon-lock text-primary"><a href="changepass.jsp"><b>Change Password</b></a></li>
            </ul>
            <ul class="app-breadcrumb breadcrumb side">
                <li class="glyphicon glyphicon-wrench"><a href="editprofile.jsp"><b>Edit Profile</b></a></li>
            </ul>
            <ul class="app-breadcrumb breadcrumb side">
                <li class="glyphicon glyphicon-shopping-cart text-primary"><a href="order"><b>My Order</b></a></li>
            </ul>
            <ul class="app-breadcrumb breadcrumb side">
                <li class="glyphicon glyphicon-home "><a href="home"><b>Back To Home</b></a></li>
            </ul>
            <div id="clock"></div>
        </div>
        <div class="container bootstrap snippets bootdey">
            <div class="panel-body inf-content">
                <div class="row">
                    <div class="col-md-4">
                        <img alt="Avatar" style="width:600px;" title="" class="img-circle img-thumbnail isTooltip" src="${sessionScope.accC.avatar}" data-original-title="Usuario">                       
                    </div>
                    <div class="col-md-6">
                        <strong>Information</strong><br>
                        <div class="table-responsive">
                            <table class="table table-user-information">
                                <tbody>
                                    <tr>        
                                        <td>
                                            <strong>
                                                <span class="glyphicon glyphicon-asterisk text-primary"></span>
                                                Identificacion                                                
                                            </strong>
                                        </td>
                                        <td class="text-primary">
                                            ${sessionScope.accC.customerID}     
                                        </td>
                                    </tr>
                                    <tr>    
                                        <td>
                                            <strong>
                                                <span class="glyphicon glyphicon-user  text-primary"></span>    
                                                Name                                                
                                            </strong>
                                        </td>
                                        <td class="text-primary">
                                            ${sessionScope.accC.fullName}     
                                        </td>
                                    </tr>
                                    <tr>        
                                        <td>
                                            <strong>
                                                <span class="glyphicon glyphicon-bookmark text-primary"></span> 
                                                Phone                                                
                                            </strong>
                                        </td>
                                        <td class="text-primary">
                                            ${sessionScope.accC.phone} 
                                        </td>
                                    </tr>


                                    <tr>        
                                        <td>
                                            <strong>
                                                <span class="glyphicon glyphicon-user text-primary"></span> 
                                                Gender                                                
                                            </strong>
                                        </td>
                                        <td class="text-primary">
                                            ${sessionScope.accC.gender}
                                        </td>
                                    </tr>
                                    <tr>        
                                        <td>
                                            <strong>
                                                <span class="glyphicon glyphicon-envelope text-primary"></span> 
                                                Email                                                
                                            </strong>
                                        </td>
                                        <td class="text-primary">
                                            ${sessionScope.accC.email} 
                                        </td>
                                    </tr>

                                    <tr>        
                                        <td>
                                            <strong>
                                                <span class="glyphicon glyphicon-map-marker text-primary"></span>
                                                Address                                                
                                            </strong>
                                        </td>
                                        <td class="text-primary">
                                            ${sessionScope.accC.address}
                                        </td>
                                    </tr>                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div> 
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
