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

        <title>Profile</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <link rel="stylesheet" href="./new_assetss/css/main.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- or -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

        <!-- Font-icon css-->
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
        <style>/* Style for the search form container */
            .search-form {
                margin: 10px; /* Add margin for spacing */
            }

            /* Style for the date input fields and labels */
            .date-input {
                width: 150px; /* Adjust the width as needed */
                padding: 5px; /* Add padding for spacing */
                margin-right: 10px; /* Add margin between input fields */
                border: 1px solid #ccc; /* Add a border for input fields */
                border-radius: 5px; /* Add rounded corners */
            }

            .search-label {
                font-weight: bold; /* Make labels bold */
            }

            /* Style for the search button */
            .search-button {
                background-color: #007bff; /* Button background color */
                color: #fff; /* Text color */
                border: none; /* Remove button border */
                border-radius: 5px; /* Rounded corners */
                padding: 10px 20px; /* Add padding to the button */
                cursor: pointer; /* Change cursor on hover */
            }

            /* Hover effect for the search button */
            .search-button:hover {
                background-color: #0056b3; /* Darker background color on hover */
            }</style>
        <style>
            /* Định dạng div chứa form */
            .search-form {
                display: flex;
                align-items: center;
            }

            /* Định dạng select box */
            #group {
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
                background-color: #fff;
                font-size: 14px;
                margin-right: 5px;
            }

            /* Định dạng nút tìm kiếm */
            .search-button {
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 4px;
                padding: 8px 12px;
                cursor: pointer;
                font-size: 14px;
            }

            /* Hiệu ứng hover cho nút tìm kiếm */
            .search-button:hover {
                background-color: #0056b3;
            }

            /* Để căn giữa div chứa form, bạn có thể sử dụng các thuộc tính sau trong class col-sm-8 */
            .col-sm-8 {
                display: flex;
                justify-content: center;
                align-items: center;
            }

            /* Để tạo khoảng cách giữa label và select box */
            optgroup {
                margin-top: 10px;
            }
        </style>
        <style>/* Style for the search box container */
            .search-box {
                display: flex;
                align-items: center;
                background-color: #f5f5f5; /* Background color for the search box container */
                border-radius: 5px; /* Rounded corners */
                padding: 5px 10px; /* Add padding to the container */
            }

            /* Style for the input field */
            .input-search {
                flex-grow: 1; /* Allow the input field to grow and take available space */
                border: none; /* Remove input border */
                padding: 8px; /* Add padding to the input field */
                font-size: 14px; /* Adjust font size */
                outline: none; /* Remove the input outline */
            }

            /* Style for the search button */
            .btn-search {
                background-color: #007bff; /* Button background color */
                color: #fff; /* Text color */
                border: none; /* Remove button border */
                border-radius: 5px; /* Rounded corners */
                margin-left: 5px; /* Add spacing between input and button */
                padding: 5px 10px; /* Add padding to the button */
                cursor: pointer; /* Change cursor on hover */
            }

            /* Hover effect for the search button */
            .btn-search:hover {
                background-color: #0056b3; /* Darker background color on hover */
            }
            /* Tùy chỉnh kiểu phân trang */
            .pagination {
                display: flex;
                list-style: none;
                padding: 0;
            }

            .pagination li {
                margin-right: 10px;
            }

            .pagination a {
                color: #007bff;
                background-color: #fff;
                border: 1px solid #ddd;
                padding: 2px 5px; /* Điều chỉnh kích thước padding tại đây */
                text-decoration: none;
                transition: background-color 0.3s;
                font-size: 5px; /* Điều chỉnh kích thước font tại đây */
            }

            .pagination a:hover {
                background-color: #007bff;
                color: #fff;
            }

            .pagination .active a {
                background-color: #007bff;
                color: #fff;
            }

            /* Tùy chỉnh kiểu nút trước và nút sau */
            .pagination .prev-next a {
                font-weight: bold;
            }

            /* Tùy chỉnh kiểu nút đầu và nút cuối */
            .pagination .first-last a {
                font-weight: bold;
            }

            /* Tùy chỉnh kiểu nút không hoạt động */
            .pagination .disabled a {
                cursor: not-allowed;
                pointer-events: none;
                color: #ccc;
                background-color: transparent;
            }</style>
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

    <body onload="time()" class="app sidebar-mini rtl">
        <!-- Navbar-->
        <header class="app-header">
            <a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
               aria-label="Hide Sidebar"></a>

            <ul class="app-nav">
                <c:if test="${sessionScope.accC != null }">    <li><a class="app-nav__item" href="home"><i class='bx bx-log-out bx-rotate-180'></i> </a>
                    </li></c:if>
                </ul>
            </header>

            <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
            <aside class="app-sidebar">
                <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="${sessionScope.accC.avatar}" width="50px"
                                                alt="User Image">
                <div>
                    <a href="Profile.jsp"><p class="app-sidebar__user-name"><b style="color: yellow"> ${sessionScope.accC.fullName}</b></p></a>   
                    <p class="app-sidebar__user-designation">WelCome</p>
                </div>

            </div>
            <ul class="app-menu">
                <li><a class="app-menu__item haha">
                        <span class="app-menu__label">My Account</span></a></li>
                <li><a class="app-menu__item" href="changepass.jsp"><i
                            class='app-menu__icon bx bx-user-circle'></i><span class="app-menu__label">Change PassWord</span></a>
                </li>
                <li><a class="app-menu__item" href="editprofile.jsp"><i
                            class='app-menu__icon bx bx-wrench'></i><span class="app-menu__label">Edit Profile</span></a>
                </li>
            </ul>


        </aside>
        <main class="app-content">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb side">
                    <li><a href="" data-toggle="tab" class="nav-link">Profile/Information</a></li>
                </ul>
                <div id="clock"></div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">                      
                        <div class="container detail" style="display: flex; background-color: #f5f5f5; padding-bottom: 25px; padding-top: 25px; border-radius: 8px; filter: drop-shadow(0 0 3px grey)">
                            <div class="container-left col-md-4" style="border-radius: 30px; padding-top: 5px; padding-left: -2.5px; padding-right: -2.5px">

                                <div><h6 style=" width: 112px; height: 25px; padding-top: 5px; padding-left: 5px;">Ảnh Đại Diện:</h6></div>
                                <div class="image_feedback" style="width: 340px; height: 340px;  overflow: hidden; position: relative">
                                    <img style="width: 100%; display: absolute; border-radius: 10px; filter: drop-shadow(0 0 5px grey); object-fit: cover; position: absolute" src="${sessionScope.customer.avatar}" alt="alt"/>
                                </div>

                            </div>
                            <div class="container-right col-md-8">
                                <div class="contact-name">
                                    <div style="display: flex" class="col-md-12">
                                        <h3>FullName: </h3> 
                                        <h3 style="color: #226e20"> ${sessionScope.accC.fullName}</h3>                                      
                                    </div>
                                    <br>
                                    <div class="container-content col-md-12" style="background-color: white; padding-top: 13px; padding-bottom: 11px; border-radius: 10px; filter: drop-shadow(0 0 -3px grey)">
                                        <h6>Giới tính: ${sessionScope.accC.gender}</h6>
                                        <br>
                                        <h6>Email: ${sessionScope.accC.email}</h6>
                                        <br>
                                        <h6>Phone: ${sessionScope.accC.phone}</h6>
                                        <br>                                                                            
                                        <h6>Adress: ${sessionScope.accC.address}</h6>
                                        <br>
                                        <h6>Gender: ${sessionScope.accC.gender}</h6>
                                        <br>        
                                    </div>
                                </div>
                            </div>
                        </div>                    
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
                    </div>
                </div>
            </div>
        </main>



        <script>
        document.addEventListener('DOMContentLoaded', function () {
            const selectBox = document.getElementById('group');
            const filterForm = document.getElementById('filterForm');

            selectBox.addEventListener('change', function () {
                filterForm.submit();
            });
        });
        </script>
        <script>
            // Lắng nghe sự kiện khi bất kỳ nút "Giao hàng thành công" nào được nhấn
            document.addEventListener('DOMContentLoaded', function () {
                // Lấy danh sách tất cả các nút có cùng lớp "mark-delivered"
                const markDeliveredButtons = document.querySelectorAll('.mark-delivered');

                markDeliveredButtons.forEach(button => {
                    button.addEventListener('click', function () {
                        // Tìm phần tử form liên quan đến nút được nhấn
                        const form = this.closest('form');

                        // Kiểm tra nếu form tồn tại
                        if (form) {
                            // Gửi form đi
                            form.submit();
                        }
                    });
                });
            });
        </script>
        <!-- Essential javascripts for application to work-->



        <!-- The javascript plugin to display page loading on top-->
        <script src="./new_assetss/js/plugins/pace.min.js"></script>
        <!-- Page specific javascripts-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
        <!-- Data table plugin-->
        <script type="text/javascript" src="js/plugins/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="js/plugins/dataTables.bootstrap.min.js"></script>
        <script type="text/javascript">$('#sampleTable').DataTable();</script>
        <script>
            function deleteRow(r) {
                var i = r.parentNode.parentNode.rowIndex;
                document.getElementById("myTable").deleteRow(i);
            }
            jQuery(function () {
                jQuery(".trash").click(function () {
                    swal({
                        title: "Cảnh báo",

                        text: "Đã xóa thành công!!",
                        buttons: ["Hủy bỏ", "Đồng ý"],
                    })
                            .then((willDelete) => {
                                if (willDelete) {
                                    swal("Đã xóa thành công.!", {

                                    });
                                }
                            });
                });
            });
            oTable = $('#sampleTable').dataTable();
            $('#all').click(function (e) {
                $('#sampleTable tbody :checkbox').prop('checked', $(this).is(':checked'));
                e.stopImmediatePropagation();
            });

            //EXCEL
            // $(document).ready(function () {
            //   $('#').DataTable({

            //     dom: 'Bfrtip',
            //     "buttons": [
            //       'excel'
            //     ]
            //   });
            // });


            //Thời Gian
            function time() {
                var today = new Date();
                var weekday = new Array(7);
                weekday[0] = "Chủ Nhật";
                weekday[1] = "Thứ Hai";
                weekday[2] = "Thứ Ba";
                weekday[3] = "Thứ Tư";
                weekday[4] = "Thứ Năm";
                weekday[5] = "Thứ Sáu";
                weekday[6] = "Thứ Bảy";
                var day = weekday[today.getDay()];
                var dd = today.getDate();
                var mm = today.getMonth() + 1;
                var yyyy = today.getFullYear();
                var h = today.getHours();
                var m = today.getMinutes();
                var s = today.getSeconds();
                m = checkTime(m);
                s = checkTime(s);
                nowTime = h + " giờ " + m + " phút " + s + " giây";
                if (dd < 10) {
                    dd = '0' + dd
                }
                if (mm < 10) {
                    mm = '0' + mm
                }
                today = day + ', ' + dd + '/' + mm + '/' + yyyy;
                tmp = '<span class="date"> ' + today + ' - ' + nowTime +
                        '</span>';
                document.getElementById("clock").innerHTML = tmp;
                clocktime = setTimeout("time()", "1000", "Javascript");

                function checkTime(i) {
                    if (i < 10) {
                        i = "0" + i;
                    }
                    return i;
                }
            }
            //In dữ liệu
            var myApp = new function () {
                this.printTable = function () {
                    var tab = document.getElementById('sampleTable');
                    var win = window.open('', '', 'height=700,width=700');
                    win.document.write(tab.outerHTML);
                    win.document.close();
                    win.print();
                }
            }
            //     //Sao chép dữ liệu
            //     var copyTextareaBtn = document.querySelector('.js-textareacopybtn');

            // copyTextareaBtn.addEventListener('click', function(event) {
            //   var copyTextarea = document.querySelector('.js-copytextarea');
            //   copyTextarea.focus();
            //   copyTextarea.select();

            //   try {
            //     var successful = document.execCommand('copy');
            //     var msg = successful ? 'successful' : 'unsuccessful';
            //     console.log('Copying text command was ' + msg);
            //   } catch (err) {    
            //     console.log('Oops, unable to copy');
            //   }
            // });


            //Modal
            $("#show-emp").on("click", function () {
                $("#ModalUP").modal({backdrop: false, keyboard: false})
            });
        </script>

    </body>

</html>

