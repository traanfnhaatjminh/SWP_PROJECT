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
        <title> Add User | Quản trị Admin</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <link rel="stylesheet" type="text/css" href="./css/main.css">
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
    </head>

    <body class="app sidebar-mini rtl">
        
        <!-- Navbar-->
        <header class="app-header">
            <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
                                            aria-label="Hide Sidebar"></a>
            <!-- Navbar Right Menu-->
            <ul class="app-nav">
                <!-- User Menu-->
                <li><a class="app-nav__item" href=""><i class='bx bx-log-out bx-rotate-180'></i> </a> </li>
            </ul>
        </header>
        <!-- Sidebar menu-->
       
            <!-- Sidebar menu end-->
            <main class="app-content">
                <div class="app-title">
                    <ul class="app-breadcrumb breadcrumb">
                        <li class="breadcrumb-item"><a href="userlist">User List</a></li>
                        <li class="breadcrumb-item"><a href="addUser">Add User</a></li>
                </ul>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="tile">                            
                        <h3 class="tile-title">Add User</h3>
                        <div class="tile-body">
                            <div class="tile-body">
                                <div class="row element-button">
                                    <div class="col-sm-2">

                                        <a class="btn btn-add btn-sm" href="userlist" title="Thêm">
                                            <i class="fas fa-sharp fa-light fa-angle-left"></i> User List</a>
                                    </div>
                                    <div class="col-sm-2">

                                    </div>
                                </div>
                            </div>

                            <div class="container detail" style="display: flex; background-color: #f5f5f5; padding-bottom: 25px; padding-top: 25px; border-radius: 8px; filter: drop-shadow(0 0 3px grey)">
                                <div class="container-right col-md-12">
                                    <div class="contact-name">
                                        <!--<div style="display: flex" class="container-user-detail col-md-12">
                                             

                                        </div>
                                        <br>-->
                                        <div class="container-content col-md-12" style="background-color: white; padding-top: 13px; padding-bottom: 11px; border-radius: 10px; filter: drop-shadow(0 0 -3px grey); display: flex">
                                            <div class="col-md-3">
                                                <h3 style="margin-right: 4px; padding-bottom: 10px">Họ Và Tên: </h3>
                                                
                                                <br>
                                                <h6>Giới tính:</h6>
                                                <br>
                                                <h6>Avatar:</h6>
                                                <br>
                                                <h6>Email:</h6>
                                                <br>
                                                <h6>SĐT: </h6>
                                                <br>
                                                <h6>Vai Trò:</h6>
                                                <br>
                                                <h6>Địa Chỉ:</h6>
                                                <br>
                                                <h6>Status: 
                                                    <c:choose>
                                                        <c:when test="${user.user_status == 1}">
                                                            Present
                                                        </c:when>
                                                        <c:otherwise>
                                                            Hidden
                                                        </c:otherwise>
                                                    </c:choose>
                                                </h6>
                                                <br>
                                            </div>
                                            <div class="col-md-9">
                                                <form action="addUser" method="post">
                                                    <!--Fullname-->
                                                    
                                                    <div class="form-group-input after-first col-md-6" style="margin-top: 25px;">
                                                        <input class="form-control-input" type="text" name="userUsername" placeholder="Nhập username" value="${user.userName}" required>
                                                    </div>
                                                    <br>
                                                    <!--Gender-->
                                                    <div class="form-group-input col-md-6">
                                                        <select class="form-control-input first-input" id="gender" name="userGender" required>
                                                            <option ${user.gender=="male"?'select':''} value="male">Male</option>
                                                            <option ${user.gender=="female"?'select':''} value="female">Female</option>
                                                            <option ${user.gender=="other"?'select':''} value="other">Other</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group-input after-first col-md-6" style="margin-top: 25px;">
                                                        <input class="form-control-input" type="text" name="userAvatar" placeholder="Nhập đường dẫn avatar" value="${user.avatar}" required>
                                                    </div>
                                                    <br>
                                                    <!--Email-->
                                                    <div class="form-group-input after-first col-md-6">
                                                        <input class="form-control-input " type="email" name="userEmail" placeholder="Nhập email của bạn" value="${user.email}" required >
                                                    </div>
                                                    <br>
                                                    <!--SDT-->
                                                    <div class="form-group-input after-first col-md-6">
                                                        <input class="form-control-input " type="text" name="userMobile" placeholder="Nhập SĐT của bạn" value="${user.mobile}" required pattern="[0-9]{10}">
                                                    </div>
                                                    <br>
                                                    <input name="userPassword" value="${user.password}" type="hidden">
                                                    <!--Vai Tro-->
                                                    <div class="form-group-input after-first col-md-6">
                                                        <select class="form-control-input" id="role" name="userRole" required>
                                                            <c:forEach items="${listUserRole}" var="r">
                                                                <option ${r.roleID==user.roleID?'selected':''} value="${r.roleID}">${r.roleName}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <br>
                                                    <!--Dia Chi-->
                                                    <div class="form-group-input after-first col-md-6">
                                                        <input class="form-control-input" type="text" name="userAddress" placeholder="Nhập vào địa chỉ của bạn" value="${user.address}" required>
                                                    </div>
                                                    <div class="form-group-input after-first col-md-6" style="margin-top: 25px;">
                                                        <select class="form-control-input" id="status" name="userStatus" required>
                                                            <option ${user.user_status=="1"?'selected':''} value="1">Present</option>
                                                            <option ${user.user_status=="0"?'selected':''} value="0">Hidden</option>
                                                        </select>
                                                    </div>
                                                    <div style="margin-right: auto; margin-top: 40px">
                                                        <button class="btn btn-save" type="submit" id="saveButton" style="margin-left: 15px; margin-right: 4px; margin-top: 20px"><i class="fas fa-sharp fa-light fa-check" style="margin-right: 2px"></i>Save</button>
                                                        <a class="btn btn-cancel" href="userList" style="margin-top: 20px"><i class="fas fa-sharp fa-light fa-xmark"></i>Cancel</a>
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
