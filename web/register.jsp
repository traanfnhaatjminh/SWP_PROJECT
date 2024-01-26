<%-- 
    Document   : register
    Created on : Jan 14, 2024, 4:37:25 PM
    Author     : DUONG VIET DUY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Sign up</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="./css/home.css"/>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <style>
            body {
                font-family: 'Roboto', sans-serif;
            }
            .form-control {
                font-size: 16px;
                transition: all 0.4s;
                box-shadow: none;
            }
            .form-control:focus {
                border-color: #5cb85c;
            }
            .form-control, .btn {
                outline: none !important;
            }
            .signup-form {
                width: 480px;
                margin: 0 auto;
                padding: 30px 0;
            }
            .signup-form form {
                border-radius: 5px;
                margin-bottom: 20px;
                background: #f7f7f7;
                box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
                padding: 40px;
            }
            .signup-form a {
                color: #5cb85c;
            }
            .signup-form h2 {
                text-align: center;
                font-size: 34px;
                margin: 10px 0 15px;
            }
            .signup-form .hint-text {
                color: #999;
                text-align: center;
                margin-bottom: 20px;
            }
            .signup-form .form-group {
                margin-bottom: 20px;
            }
            .signup-form .btn {
                font-size: 18px;
                line-height: 26px;
                font-weight: bold;
                text-align: center;
            }
            .signup-btn {
                text-align: center;
                border-color: #5cb85c;
                transition: all 0.4s;
            }
            .signup-btn:hover {
                background: #5cb85c;
                opacity: 0.8;
            }
            .or-seperator {
                margin: 50px 0 15px;
                text-align: center;
                border-top: 1px solid #e0e0e0;
            }
            .or-seperator b {
                padding: 0 10px;
                width: 40px;
                height: 40px;
                font-size: 16px;
                text-align: center;
                line-height: 40px;
                background: #fff;
                display: inline-block;
                border: 1px solid #e0e0e0;
                border-radius: 50%;
                position: relative;
                top: -22px;
                z-index: 1;
            }
            .social-btn .btn {
                color: #fff;
                margin: 10px 0 0 15px;
                font-size: 15px;
                border-radius: 50px;
                font-weight: normal;
                border: none;
                transition: all 0.4s;
            }
            .social-btn .btn:first-child {
                margin-left: 0;
            }
            .social-btn .btn:hover {
                opacity: 0.8;
            }
            .social-btn .btn-primary {
                background: #507cc0;
            }
            .social-btn .btn-info {
                background: #64ccf1;
            }
            .social-btn .btn-danger {
                background: #df4930;
            }
            .social-btn .btn i {
                float: left;
                margin: 3px 10px;
                font-size: 20px;
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
                                    $MAKER
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
        <div class="signup-form">
            <form action="register" method="post">
                <p style="color: blue; text-align: center;">
                    ${requestScope.ms}
                </p>
                <h2>Create an Account</h2>
                <p style="color: red; text-align: center;">
                    ${requestScope.error_pass}
                </p>
                <div class="form-group">
                    <label>Full name</label>
                    <input type="text" class="form-control input-lg" name="full_name" required="required">
                </div>
                <div class="form-group">
                    <label>Gender</label>
                    <select class="form-control mb-2" name="gender">
                        <option value="female" ${customer.gender== 'female' ?  'selected' :'' }  >Female</option>
                        <option value="male" ${customer.gender== 'male' ?  'selected' :'' } >Male</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Phone</label>
                    <input type="tel" pattern="^09[0-9]{8}$" class="form-control input-lg" name="phone" required="required">
                </div>  
                <div class="form-group">
                    <label>Email</label>
                    <input type="email" class="form-control input-lg" name="email" required="required">
                </div>  
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" class="form-control input-lg" name="pass" required="required">
                </div> 
                <div class="form-group">
                    <label>Confirm Password</label>
                    <input type="password" class="form-control input-lg" name="confirm_pass" required="required">
                </div>  
                <div class="form-group">
                    <label>Address</label>
                    <input type="text" class="form-control input-lg" name="address" required="required">
                </div>  
                <div class="form-group">
                    <button type="submit" class="btn btn-success btn-lg btn-block signup-btn">Register</button>
                </div>
                <p style="color: red; text-align: center;">
                    ${requestScope.emailexisted}
                </p>
            </form>
            <div class="text-center">Already have an account? <a href="login.jsp">Login here</a></div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>