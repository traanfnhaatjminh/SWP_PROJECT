<%-- 
    Document   : EditProfile_thaythe
    Created on : 07-03-2024, 11:24:44
    Author     : nguye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <link rel="stylesheet" href="./new_assetss/css/main.css"/>
        <script src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js'></script>

        <style>
            body{
                margin-top:20px;
                background-color:#f2f6fc;
                color:#69707a;
            }
            .img-account-profile {
                height: 10rem;
            }
            .rounded-circle {
                border-radius: 50% !important;
            }
            .card {
                box-shadow: 0 0.15rem 1.75rem 0 rgb(33 40 50 / 15%);
            }
            .card .card-header {
                font-weight: 500;
            }
            .card-header:first-child {
                border-radius: 0.35rem 0.35rem 0 0;
            }
            .card-header {
                padding: 1rem 1.35rem;
                margin-bottom: 0;
                background-color: rgba(33, 40, 50, 0.03);
                border-bottom: 1px solid rgba(33, 40, 50, 0.125);
            }
            .form-control, .dataTable-input {
                display: block;
                width: 100%;
                padding: 0.875rem 1.125rem;
                font-size: 0.875rem;
                font-weight: 400;
                line-height: 1;
                color: #69707a;
                background-color: #fff;
                background-clip: padding-box;
                border: 1px solid #c5ccd6;
                -webkit-appearance: none;
                -moz-appearance: none;
                appearance: none;
                border-radius: 0.35rem;
                transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
            }

            .nav-borders .nav-link.active {
                color: #0061f2;
                border-bottom-color: #0061f2;
            }
            .nav-borders .nav-link {
                color: #69707a;
                border-bottom-width: 0.125rem;
                border-bottom-style: solid;
                border-bottom-color: transparent;
                padding-top: 0.5rem;
                padding-bottom: 0.5rem;
                padding-left: 0;
                padding-right: 0;
                margin-left: 1rem;
                margin-right: 1rem;
            }
        </style>
    </head>
    <body>
        <div class="app-title">
            <ul class="app-breadcrumb breadcrumb side">
                <li class="glyphicon glyphicon-lock text-primary"><a href="profile.jsp"><b>Profile</b></a></li>
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
        <div class="container-xl px-4 mt-4">
            <!-- Account page navigation-->

            <hr class="mt-0 mb-4">
            <div class="row">

                <div class="col-xl-4">
                    <!-- Profile picture card-->
                    <div class="card mb-4 mb-xl-0">
                        <div class="card-header">Profile Picture</div>
                        <div class="card-body text-center">
                            <!-- Hiển thị ảnh avatar hiện tại -->
                            <img id="avatarImage" class="img-account-profile rounded-circle mb-2" src="${sessionScope.accC.avatar}" alt="">                                                                               
                        </div>


                    </div>
                </div>

                <div class="col-xl-8">
                    <!-- Account details card-->
                    <div class="card mb-4">
                        <div class="card-header">Account Details</div>
                        <div class="card-body">
                            <form action="customer?action=updateinfor" method="POST">
                                <p style="color: green; align-content: center;">
                                    ${requestScope.messageinfor}
                                </p>
                                <!-- Form Group (username)-->
                                <div class="mb-3">
                                    <label class="small mb-1" for="">Username (how your name will appear to other users on the site)</label>
                                    <input class="form-control" id="inputUsername" type="text" placeholder="Enter your username" name="fullName" value="${sessionScope.accC.fullName}">
                                </div>
                                <!-- Form Row-->
                                <div class="row gx-3 mb-3">
                                    <!-- Form Group (first name)-->
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="">Phone</label>
                                        <input class="form-control" id="inputFirstName" type="tel" pattern="[0-9]{10}" placeholder="Enter your Phone" name="phone" value="${sessionScope.accC.phone}">
                                    </div>
                                    <!-- Form Group (last name)-->
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="">Email</label>
                                        <input class="form-control" id="inputLastName" type="text" readonly name="user_name" value="${sessionScope.accC.email}">
                                    </div>
                                </div>
                                <!-- Form Row        -->
                                <div class="row gx-3 mb-3">
                                    <!-- Form Group (organization name)-->
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="">Gender</label>
                                        <select class="form-control mb-1" name="gender">
                                            <option value="male" ${sessionScope.accC.gender == 'male' ? 'selected' : ''}>Male</option>
                                            <option value="female" ${sessionScope.accC.gender == 'female' ? 'selected' : ''}>Female</option>
                                            <option value="orther" ${sessionScope.accC.gender == 'Orther' ? 'selected' : ''}>Orther</option>
                                        </select>
                                    </div>
                                    <!-- Form Group (location)-->
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="">Location</label>
                                        <input class="form-control" id="inputLocation" type="text" placeholder="Enter your location" name="address" value="${sessionScope.accC.address}">
                                    </div>
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="">Avatar</label>
                                        <!-- Input để người dùng chọn ảnh -->
                                        <input class="form-control" id="inputLocation" type="text" placeholder="Enter your location" name="avatar" value="${sessionScope.accC.avatar}" accept="image/*">
                                        <!-- Hiển thị ảnh được chọn -->

                                    </div>
                                </div>
                                <!-- Form Group (email address)-->                             
                                <!-- Form Row-->                               
                                <!-- Save changes button-->
                                <button class="btn btn-primary" type="submit">Save changes</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function previewImage(event) {
                var reader = new FileReader();
                reader.onload = function () {
                    var output = document.getElementById('avatarPreview');
                    output.src = reader.result;
                    output.style.display = 'block'; // Hiển thị ảnh sau khi đã chọn
                };
                reader.readAsDataURL(event.target.files[0]);
            }
            ;
        </script>
        <script src='https://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js'></script>
    </body>
</html>
