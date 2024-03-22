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

        <title>List Order </title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <link rel="stylesheet" type="text/css" href="./css/home.css">
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
            .pagination .page-item.active .page-link {
                background-color: #007bff;
                border-color: #007bff;
                color: #fff; /* Màu chữ trắng */
            }
            .pagination .page-item.active .page-link {
                background-color: #007bff;
                border-color: #007bff;
                color: #fff; /* Màu chữ trắng */
            }


        </style>
        <jsp:useBean id="a" class="dal.orderDAO1" scope = "request"></jsp:useBean>
        </head>

        <body onload="time()" class="app sidebar-mini rtl">
            <!-- Navbar-->
            <header class="app-header">
                <a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
                   aria-label="Hide Sidebar"></a>

                <ul class="app-nav">
                <c:if test="${sessionScope.accS != null }">    <li><a class="app-nav__item" href="loginSystem?action=logout"><i class='bx bx-log-out bx-rotate-180'></i> </a>
                    </li></c:if>
                </ul>
            </header>

            <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
            <aside class="app-sidebar">
                <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="${sessionScope.accS.avatar}" width="50px"
                                                alt="User Image">
                <div>
                    <a href=""><p class="app-sidebar__user-name"><b style="color: yellow"> ${sessionScope.accS.userName}</b></p></a>   
                    <p class="app-sidebar__user-designation"></p>
                </div>
            </div>
            <hr>
            <ul class="app-menu">
                <ul class="app-menu">
                    <li><a class="app-menu__item haha">
                            <span class="app-menu__label">Saler Manager</span></a></li>
                    <li><a class="app-menu__item " href="pageOrder"><i class='app-menu__icon bx bx-dollar'></i><span
                                class="app-menu__label">Management Orders</span></a></li>
                </ul>
        </aside>
        <main class="app-content" style="margin-left: 250px;">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb side">
                    <li class="breadcrumb-item active"><a href="#"><b>List Orders</b></a></li>
                </ul>
                <div id="clock"></div>
            </div>
            <div class="search-form">
                <form action="sortProduct">
                    <select name="groupby" id="group">
                        <option selected="" value="1">All</option>
                        <optgroup label="Product Name">
                            <c:forEach items="${listProductName}" var="listProductName">
                                <option value="${listProductName}" ${listProductName.equals(request.getAttribute("valueName")) ? 'selected' : ''}>${listProductName}</option>
                            </c:forEach>
                        </optgroup>
                    </select>
                    <button  type="submit" class="search-button">
                        <i class="fa fa-search"></i>
                    </button>
                    <input name="search" value="" type="hidden">
                </form>
            </div>

            <div class="search-form">
                <form action="FilterOrderDateServletBySale" class="date-search-form">
                    <label for="startDate" class="search-label">From date:</label>
                    <input type="date" name="startDate" value="" class="date-input" required>

                    <label for="endDate" class="search-label">To date:</label>
                    <input type="date" name="endDate" value="" class="date-input" required>
                    <br>
                    <button type="submit" class="search-button">Search</button>
                </form>
            </div>
            <div style="margin-top: -2cm; margin-bottom: 5%"><div class="col-sm-2" >
                    <!--                    <form action="" method="post"> 
                                            <div  style="margin-left: 21.5cm"class="search-box">
                                                <button type="submit" class="btn-search" style="margin-right: 5px"><i class="fas fa-search"></i></button>
                                                <input type="text" class="input-search" placeholder="Search saler..." name="search2" value="${search2}" required>
                                            </div>
                                        </form> -->
                </div>
                <div class="col-sm-2">
                    <form action="" method="post">
                        <div style="margin-left: 21.5cm" class="search-box">
                            <button type="submit" class="btn-search" style="margin-right: 5px"><i class="fas fa-search"></i></button>
                            <input type="text" class="input-search" placeholder="Search order id..." name="oid" value="${search1}" required oninput="this.value = this.value.replace(/[^0-9]/g, '')">
                        </div>
                    </form>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-body">
                            <table class="table table-hover table-bordered js-copytextarea" cellpadding="0" cellspacing="0" border="0"
                                   id="sampleTable">
                                <thead>
                                    <tr>
                                        <th width="10"><input type="checkbox" id="all"></th>
                                        <th>ID</th>
                                        <th>Order date </th>
                                        <th>Recipient name </th>
                                        <th>Product </th>
                                        <th>Total cost</th>
                                        <th>Saler ID</th>
                                        <th>Assign saler</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items ="${listOrders}" var = "o" >
                                        <tr>
                                            <td width="10"><input type="checkbox" name="check1" value="1"></td>
                                            <td><a href="detailOrderForSaleServlet?oid=${o.getOrderID()}">${o.getOrderID()}</a></td>   
                                            <td>${o.getOrderDate()}</td>
                                            <td>${o.getOrderName()}</td>   
                                            <td><c:choose>
                                                    <c:when test="${not empty o.getProductName()}">
                                                        ${o.getProductName().get(0)} <!-- Hiển thị tên sản phẩm đầu tiên -->
                                                        <c:if test="${o.getProductName().size() > 1}">
                                                            và ${o.getProductName().size() - 1} sản phẩm khác <!-- Hiển thị số lượng sản phẩm khác -->
                                                        </c:if>
                                                    </c:when>
                                                    <c:otherwise>
                                                        No products
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>${o.getTotalCost()}</td>
                                            <td>
                                                ${o.getSellerID()}
                                            </td>
                                            <td>  
                                                <form action="assignSaler" id="filterForm" style="margin-top: 10px;">
                                                    <input type="text" id="id" name="oId" value="${o.getOrderID()}" hidden="">
                                                    <select name="groupby" id="group" style="padding: 5px; border: 1px solid #ccc; border-radius: 5px;">
                                                        <c:forEach items="${listInFORStaff}" var="listInFORStaff">
                                                            <option value="${listInFORStaff.userID}" style="background-color: #f0f0f0;">${listInFORStaff.userName} - ID: ${listInFORStaff.userID}</option>
                                                        </c:forEach>
                                                    </select>

                                                    <input type="submit" value="Save" style="background-color: #007BFF; color: #fff; padding: 5px 10px; border: none; border-radius: 5px; cursor: pointer;">
                                                </form>   
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <p class="text-center" style="color: blue ; background-color: white ; width: auto ; margin: auto ;padding: auto ; text-align: center ; border-radius: 50px;">${mess}
                            </p>
                            <nav aria-label="...">
                                <ul class="pagination pagination-sm">
                                    <c:forEach begin="1" end="${a.getNumberPage()}" var="i">
                                        <li class="page-item ${i == param.index ? 'active' : ''}">
                                            <a class="page-link" href="pageOrder?index=${i}">${i}</a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>      
        </main>

        <!--
        MODAL
        -->
        <div class="modal fade" id="ModalUP" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
             data-keyboard="false">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">

                    <div class="modal-body">


                        <BR>
                        <a href="#" style="    float: right;
                           font-weight: 600;
                           color: #ea0000;">Chỉnh sửa nâng cao</a>
                        <BR>
                        <BR>
                        <button class="btn btn-save" type="button">Lưu lại</button>
                        <a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
                        <BR>
                    </div>
                    <div class="modal-footer">
                    </div>
                </div>
            </div>
        </div>
        <!--
        MODAL
        -->
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
        <script src="./new_assetss/js/jquery-3.2.1.min_1.js"></script>
        <script src="./new_assetss/js/popper.min.js"></script>
        <script src="./new_assetss/js/bootstrap.min.js"></script>
        <script src="../ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="src/jquery.table2excel.js"></script>
        <script src="./new_assetss/js/main.js"></script>
        <!-- The javascript plugin to display page loading on top-->
        <script src="../new_assetssjs/plugins/pace.min.js"></script>
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

