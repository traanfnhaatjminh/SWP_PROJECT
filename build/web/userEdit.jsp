<%-- 
    Document   : form-add-san-pham
    Created on : 26-09-2023, 01:56:01
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title> Edit User Detail | Quản trị Admin</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <link rel="stylesheet" href="./new_assetss/css/main.css"/>
        <!-- Font-icon css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- or -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- <script type="text/javascript" src="/ckeditor/ckeditor.js"></script> -->
        <script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
        <script src="http://code.jquery.com/jquery.min.js" type="text/javascript"></script>
        <script>

            function readURL(input, thumbimage) {
                if (input.files && input.files[0]) { //Sử dụng  cho Firefox - chrome
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $("#thumbimage").attr('src', e.target.result);
                    }
                    reader.readAsDataURL(input.files[0]);
                } else { // Sử dụng cho IE
                    $("#thumbimage").attr('src', input.value);

                }
                $("#thumbimage").show();
                $('.filename').text($("#uploadfile").val());
                $('.Choicefile').css('background', '#14142B');
                $('.Choicefile').css('cursor', 'default');
                $(".removeimg").show();
                $(".Choicefile").unbind('click');

            }
            $(document).ready(function () {
                $(".Choicefile").bind('click', function () {
                    $("#uploadfile").click();

                });
                $(".removeimg").click(function () {
                    $("#thumbimage").attr('src', '').hide();
                    $("#myfileupload").html('<input type="file" id="uploadfile"  onchange="readURL(this);" />');
                    $(".removeimg").hide();
                    $(".Choicefile").bind('click', function () {
                        $("#uploadfile").click();
                    });
                    $('.Choicefile').css('background', '#14142B');
                    $('.Choicefile').css('cursor', 'pointer');
                    $(".filename").text("");
                });
            })
        </script>
    </head>

    <body class="app sidebar-mini rtl">
        <style>
            .Choicefile {
                display: block;
                background: #14142B;
                border: 1px solid #fff;
                color: #fff;
                width: 150px;
                text-align: center;
                text-decoration: none;
                cursor: pointer;
                padding: 5px 0px;
                border-radius: 5px;
                font-weight: 500;
                align-items: center;
                justify-content: center;
            }

            .Choicefile:hover {
                text-decoration: none;
                color: white;
            }

            #uploadfile,
            .removeimg {
                display: none;
            }

            #thumbbox {
                position: relative;
                width: 100%;
                margin-bottom: 20px;
            }

            .removeimg {
                height: 25px;
                position: absolute;
                background-repeat: no-repeat;
                top: 5px;
                left: 5px;
                background-size: 25px;
                width: 25px;
                /* border: 3px solid red; */
                border-radius: 50%;

            }

            .removeimg::before {
                -webkit-box-sizing: border-box;
                box-sizing: border-box;
                content: '';
                border: 1px solid red;
                background: red;
                text-align: center;
                display: block;
                margin-top: 11px;
                transform: rotate(45deg);
            }

            .removeimg::after {
                /* color: #FFF; */
                /* background-color: #DC403B; */
                content: '';
                background: red;
                border: 1px solid red;
                text-align: center;
                display: block;
                transform: rotate(-45deg);
                margin-top: -2px;
            }

            .container-user-detail {
                display: flex;
            }
            .form-group-input {
                margin-top: -3px;
            }
            .form-control-input {
                background-color: #f2f2f2;
                border: 1px solid #ccc;
                border-radius: 4px;
                width: 370px;
            }
            .after-first {
                margin-bottom: 6.5px;
            }



        </style>
        <style>
            .switch {
                position: relative;
                display: inline-block;
                width: 60px;
                height: 34px;
            }

            .switch input {
                opacity: 0;
                width: 0;
                height: 0;
            }

            .slider {
                position: absolute;
                cursor: pointer;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background-color: #ccc;
                -webkit-transition: .4s;
                transition: .4s;
            }

            .slider:before {
                position: absolute;
                content: "";
                height: 26px;
                width: 26px;
                left: 4px;
                bottom: 4px;
                background-color: white;
                -webkit-transition: .4s;
                transition: .4s;
            }

            input:checked + .slider {
                background-color: #2196F3;
            }

            input:focus + .slider {
                box-shadow: 0 0 1px #2196F3;
            }

            input:checked + .slider:before {
                -webkit-transform: translateX(26px);
                -ms-transform: translateX(26px);
                transform: translateX(26px);
            }

            /* Rounded sliders */
            .slider.round {
                border-radius: 34px;
            }

            .slider.round:before {
                border-radius: 50%;
            }
        </style>
        <!-- Navbar-->
        <header class="app-header">
            <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
                                            aria-label="Hide Sidebar"></a>
            <!-- Navbar Right Menu-->
            <ul class="app-nav">
                <!-- User Menu-->
                <li><a class="app-nav__item" href="logoutS"><i class='bx bx-log-out bx-rotate-180'></i> </a> </li>
            </ul>
        </header>
        <!-- Sidebar menu-->

        <!-- Sidebar menu end-->
        <main class="app-content">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb">
                    <li class="breadcrumb-item"><a href="userlist">User List</a></li>
                    <li class="breadcrumb-item"><a href="userDetail?userId=${user.userID}">User Detail</a></li>
                    <li class="breadcrumb-item"><a href="userEdit?userID=${user.userID}">User Edit</a></li>
                </ul>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="tile">                            
                        <h3 class="tile-title">Edit product</h3>
                        <div class="tile-body">
                            <div class="tile-body">
                                <div class="row element-button">
                                    <div class="col-sm-2">

                                        <a class="btn btn-add btn-sm" href="addUser" title="Thêm"><i class="fas fa-plus"></i>
                                            Tạo Tài Khoản Mới</a>
                                    </div>
                                    <div class="col-sm-2">

                                    </div>
                                </div>
                            </div>

                            <div class="container detail" style="display: flex; background-color: #f5f5f5; padding-bottom: 25px; padding-top: 25px; border-radius: 8px; filter: drop-shadow(0 0 3px grey)">
                                <div class="container-left col-md-4" style="border-radius: 30px; padding-top: 5px; padding-left: -2.5px; padding-right: -2.5px">

                                    <div><h6 style=" width: 112px; height: 25px; padding-top: 5px; padding-left: 5px;">Ảnh Đại Diện:</h6></div>
                                    <div class="image_feedback" style="width: 340px; height: 340px;  overflow: hidden; position: relative">
                                        <img style="width: 100%; display: absolute; border-radius: 10px; filter: drop-shadow(0 0 5px grey); object-fit: cover; position: absolute" src="${user.avatar}" alt="alt"/>
                                    </div>

                                </div>
                                <div class="container-right col-md-8">
                                    <div class="contact-name">
                                        <div style="display: flex" class="container-user-detail col-md-12">


                                        </div>
                                        <br>
                                        <div class="container-content col-md-12" style="background-color: white; padding-top: 13px; padding-bottom: 11px; border-radius: 10px; filter: drop-shadow(0 0 -3px grey); display: flex">
                                            <form action="userEdit" method="post">
                                                <h3 style="margin-right: 4px; padding-bottom: 10px">Họ Và Tên: ${user.userName}</h3>
                                                <input style="color: #226e20; width: 420px; height: 37px; " class="form-control" type="text" name="userFullname" value="${user.userName}">
                                                <h6>Giới tính:  ${user.gender}</h6>
                                                <select class="form-control-input first-input" id="gender" name="userGender">
                                                    <option value="male" ${user.gender == 'male' ? 'selected' : ''}>Male</option>
                                                    <option value="female" ${user.gender == 'female' ? 'selected' : ''}>Female</option>
                                                    <option value="other" ${user.gender == 'other' ? 'selected' : ''}>Other</option>
                                                </select>

                                                <br>
                                                <h6>Email:  ${user.email}</h6>
                                                <input class="form-control-input " type="email" name="userEmail" value="${user.email}">
                                                <br>
                                                <h6>SĐT: ${user.mobile}</h6>
                                                <input class="form-control-input " type="tel" pattern="[0-9]{10}" name="userMobile" value="${user.mobile}">
                                                <br>
                                                <h6>Vai Trò:
                                                    <select class="form-control-input" id="role" name="userRole" required>
                                                        <c:forEach items="${listUserRole}" var="r">
                                                            <option ${r.roleID==user.roleID?'selected':''} value="${r.roleID}">${r.roleName}</option>
                                                        </c:forEach>
                                                    </select>
                                                </h6>
                                                <br>
                                                <h6>Địa Chỉ: ${user.address}</h6>
                                                <input class="form-control-input" name="userAddress" type="text" value="${user.address}">
                                                <br>                                              

                                                <input class="form-control-input" type="text" name="userAvatar" value="${user.avatar}">                                             

                                                <input type="hidden" name="userId" value="${user.userID}">
                                                <div style="margin-right: auto; margin-top: 40px">
                                                    <button class="btn btn-save" type="submit" id="saveButton" style="margin-left: 15px; margin-right: 4px; margin-top: 20px"><i class="fas fa-sharp fa-light fa-check" style="margin-right: 2px"></i>Save</button>
                                                    <a class="btn btn-cancel" href="userlist" style="margin-top: 20px"><i class="fas fa-sharp fa-light fa-xmark"></i>Cancel</a>
                                                </div>
                                            </form>
                                        </div>

                                    </div>
                                </div>
                            </div>                                
                        </div>
                    </div>
                    <p style="color: blue ; background-color: white ; width: auto ; margin: auto ;padding: auto ; text-align: center ; border-radius: 50px;">${message}
                    </p>
                    </main>

                    <script src="new_assetss/js/jquery-3.2.1.min.js"></script>
                    <script src="new_assetss/js/popper.min.js"></script>
                    <script src="new_assetss/js/bootstrap.min.js"></script>
                    <script src="new_assetss/js/main.js"></script>
                    <script src="new_assetss/js/plugins/pace.min.js"></script>
                    <script>
            const inpFile = document.getElementById("inpFile");
            const loadFile = document.getElementById("loadFile");
            const previewContainer = document.getElementById("imagePreview");
            const previewContainer = document.getElementById("imagePreview");
            const previewImage = previewContainer.querySelector(".image-preview__image");
            const previewDefaultText = previewContainer.querySelector(".image-preview__default-text");
            inpFile.addEventListener("change", function () {
                const file = this.files[0];
                if (file) {
                    const reader = new FileReader();
                    previewDefaultText.style.display = "none";
                    previewImage.style.display = "block";
                    reader.addEventListener("load", function () {
                        previewImage.setAttribute("src", this.result);
                    });
                    reader.readAsDataURL(file);
                }
            });

                    </script>
                    <script>
                        // Lấy tất cả các phần tử input có name là "status"
                        const checkboxes = document.querySelectorAll('input[name="status"]');

                        // Lặp qua từng checkbox
                        checkboxes.forEach(checkbox => {
                            // Lắng nghe sự kiện "change" của checkbox
                            checkbox.addEventListener('change', function () {
                                // Tìm biểu mẫu (form) chứa checkbox hiện tại
                                const form = this.closest('form');

                                // Kiểm tra xem biểu mẫu có tồn tại không
                                if (form) {
                                    // Gửi biểu mẫu đi khi checkbox thay đổi
                                    form.submit();
                                }
                            });
                        });
                    </script>
                    <script>
                        // Function to perform the validation for Stock Price
                        function validateStockPrice() {
                            var inputValue = parseFloat(document.getElementById("floatValue1").value);
                            var maxFloatValue = 3.402823466E+38;

                            if (inputValue > maxFloatValue) {
                                alert("Value of 'Stock Price' exceeds the maximum allowed value. Please enter a lower value.");
                                document.getElementById("floatValue1").value = ""; // Clear the input field
                                return false; // Prevent the form from submitting
                            }
                            return true; // Allow the form to submit if validation passes
                        }

                        // Function to perform the validation for Sale Price
                        function validateSalePrice() {
                            var inputValue = parseFloat(document.getElementById("floatValue2").value);
                            var maxFloatValue = 3.402823466E+38;

                            if (inputValue > maxFloatValue) {
                                alert("Value of 'Sale Price' exceeds the maximum allowed value. Please enter a lower value.");
                                document.getElementById("floatValue2").value = ""; // Clear the input field
                                return false; // Prevent the form from submitting
                            }
                            return true; // Allow the form to submit if validation passes
                        }

                        // Function to perform the validation for Quantity
                        function validateQuantity() {
                            var inputValue = parseInt(document.getElementById("intValue").value);
                            var maxIntValue = 4294967295;

                            if (inputValue > maxIntValue) {
                                alert("Value of 'Quantity' exceeds the maximum allowed value. Please enter a lower value.");
                                document.getElementById("intValue").value = ""; // Clear the input field
                                return false; // Prevent the form from submitting
                            }
                            return true; // Allow the form to submit if validation passes
                        }

                        // Add a submit event listener to the form
                        document.querySelector('form').addEventListener('submit', function (e) {
                            // Call the validation functions and prevent form submission if validation fails
                            if (!validateStockPrice() || !validateSalePrice() || !validateQuantity()) {
                                e.preventDefault(); // Prevent the form from submitting if validation fails
                            }
                        });
                    </script>

                    <script>
                        //hiển thị mặc định detail của sản phẩm chỉnh sửa
                        document.addEventListener("DOMContentLoaded", function () {
                            CKEDITOR.replace('productDetail', {
                                on: {
                                    instanceReady: function (ev) {
                                        // Set the default content from the product object
                                        console.log("hello Thanhtung")
                                        ev.editor.setData("${product.productDetail}");
                                    }
                                }
                            });
                        });
                    </script>
                    <script>
                        // hiển thị mặc định summary sản phẩm chỉnh sửa
                        document.addEventListener("DOMContentLoaded", function () {
                            CKEDITOR.replace('summary', {
                                on: {
                                    instanceReady: function (ev) {
                                        // Set the default content from the product object
                                        ev.editor.setData("$");
                                    }
                                }
                            });
                        });
                    </script>
                    </body>

                    </html>
