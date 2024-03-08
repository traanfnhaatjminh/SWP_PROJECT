<%-- 
    Document   : table-user-table
    Created on : 26-09-2023, 01:49:44
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <title>ChangePass</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <link rel="stylesheet" href="./new_assetss/css/main.css"/>
        <link rel='stylesheet' href='https://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css'>
        <style>
            body{
                background:#eee;
            }
            .separator {
                border-right: 1px solid #dfdfe0;
            }
            .icon-btn-save {
                padding-top: 0;
                padding-bottom: 0;
            }
            .input-group {
                margin-bottom:10px;
            }
            .btn-save-label {
                position: relative;
                left: -12px;
                display: inline-block;
                padding: 6px 12px;
                background: rgba(0,0,0,0.15);
                border-radius: 3px 0 0 3px;
            }
        </style>
        <style>
            .error-message {
                color: red;
                font-size: 14px;
                font-weight: bold;
            }
        </style>
    </head>

    <body>
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
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-6 col-md-offset-2">
                    <form action="customer?action=changepassword" method="POST">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h3 class="panel-title">
                                    <span class="glyphicon glyphicon-th"></span>
                                    Change password   
                                </h3>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-xs-6 col-sm-6 col-md-6 separator social-login-box"> <br>
                                        <img alt="" class="img-thumbnail" src="${sessionScope.accC.avatar}">                        
                                    </div>
                                    <div style="margin-top:80px;" class="col-xs-6 col-sm-6 col-md-6 login-box">
                                        <input type="hidden" class="form-control mb-1" name="email" value="${sessionScope.accC.email}">
                                        <p style="color:red">${requestScope.ms}</p>
                                        <p style="color:red">${requestScope.mess}</p>
                                        <p style="color:red">${requestScope.mss}</p>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <div class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></div>
                                                <input class="form-control" type="password" placeholder="Current Password" name="oldpass">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <div class="input-group-addon"><span class="glyphicon glyphicon-log-in"></span></div>
                                                <input class="form-control" type="password" placeholder="New Password" name="newpass">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <div class="input-group-addon"><span class="glyphicon glyphicon-log-in"></span></div>
                                                <input class="form-control" type="password" placeholder="repeat New Password" name="repass">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <div class="row">
                                    <div class="col-xs-6 col-sm-6 col-md-6"></div>
                                    <div class="col-xs-6 col-sm-6 col-md-6">
                                        <button class="btn icon-btn-save btn-success" type="submit">
                                            <span class="btn-save-label"><i class="glyphicon glyphicon-floppy-disk"></i></span>save</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>       
                </div>
            </div>
        </div>

        <script src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js'></script>
    </body>

</html>

