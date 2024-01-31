<%-- 
    Document   : login
    Created on : Jan 13, 2024, 10:37:54 PM
    Author     : DUONG VIET DUY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title></title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <style>
            .login-form {
                width: 340px;
                margin: 30px auto;
                font-size: 15px;
            }
            .login-form form {
                margin-bottom: 15px;
                background: #f7f7f7;
                box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
                padding: 30px;
            }
            .login-form h2 {
                margin: 0 0 15px;
            }
            .login-form .hint-text {
                color: #777;
                padding-bottom: 15px;
                text-align: center;
                font-size: 13px;
            }
            .form-control, .btn {
                min-height: 38px;
                border-radius: 2px;
            }
            .login-btn {
                font-size: 15px;
                font-weight: bold;
            }
            .or-seperator {
                margin: 20px 0 10px;
                text-align: center;
                border-top: 1px solid #ccc;
            }
            .or-seperator i {
                padding: 0 10px;
                background: #f7f7f7;
                position: relative;
                top: -11px;
                z-index: 1;
            }
            .social-btn .btn {
                margin: 10px 0;
                font-size: 15px;
                text-align: left;
                line-height: 24px;
            }
            .social-btn .btn i {
                float: left;
                margin: 4px 15px  0 5px;
                min-width: 15px;
            }
            .input-group-addon .fa{
                font-size: 18px;
            }
        </style>
    </head>
    <body>
        <div class="login-form">
            <c:set var="cookie" value="${pageContext.request.cookies}" />
            <form action="customer?action=checkLogin" method="post">
                <p style="color: red; text-align: center;">
                    ${requestScope.error}
                </p>
                <h2 class="text-center">Sign in</h2>		
                <div class="form-group">
                    <div class="input-group">                
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                <span class="fa fa-user"></span>
                            </span>                    
                        </div>
                        <input type="email" class="form-control" name="c_email" placeholder="Email" required="required" value="${cookie.email.value}">
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                <i class="fa fa-lock"></i>
                            </span>                    
                        </div>
                        <input type="password" class="form-control" name="c_pass" placeholder="Password" required="required" value="${cookie.pass.value}">
                    </div>
                </div>        
                <div class="form-group">
                    <button type="submit" class="btn btn-success btn-block login-btn">Sign in</button>
                </div>
                <div class="clearfix">
                    <label class="float-left form-check-label" for="remember">
                        <input ${(cookie.rem.value eq 'ON')?"checked":""} type="checkbox" name="remember" value="ON" id="remember">
                    </label>
                    <label>
                        Remember
                    </label>
                    <a href="forgotPassword.jsp" class="float-right text-success">Forgot Password?</a>
                </div>  
            </form>
            <div class="hint-text">Don't have an account? <a href="register.jsp" class="text-success">Register Now!</a></div>
            <div class="text-center"><a href="loginMarketer.jsp" class="text-success">Login for marketer</a></div>
        </div>
    </body>
</html>
