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
                <c:if test="${sessionScope.accS != null }">    <li><a class="app-nav__item" href=""><i class='bx bx-log-out bx-rotate-180'></i> </a>
                    </li></c:if>
                </ul>
            </header>

            <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
            <aside class="app-sidebar">
                <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="${sessionScope.admin.avatar}" width="50px"
                                                alt="User Image">
                <div>
                    <a href="Profile.jsp"><p class="app-sidebar__user-name"><b style="color: yellow"> ${sessionScope.admin.userName}</b></p></a>   
                    <p class="app-sidebar__user-designation">Chào mừng bạn trở lại</p>
                </div>
            </div>
            <hr>
            <ul class="app-menu">
                <ul class="app-menu">
                    <li><a class="app-menu__item haha">
                            <span class="app-menu__label">Admin Management</span></a></li>
                    <li><a class="app-menu__item" href="userlist"><i
                                class='app-menu__icon bx bx-user-circle'></i><span class="app-menu__label">User List</span></a>
                    </li>
                    <!--                    <li><a class="app-menu__item" href="settingList"><i
                                                    class='app-menu__icon bx bx-wrench'></i><span class="app-menu__label">Setting List</span></a>
                                        </li>-->
                </ul>
        </aside>
        <main class="app-content">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb side">
                    <li class="breadcrumb-item active"><a href="#"><b>User List</b></a></li>
                </ul>
                <div id="clock"></div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-body">
                            <div class="row element-button">

                                <div class="col-sm-2">
                                    <a class="btn btn-add btn-sm" href="addUser" title="Thêm"><i class="fas fa-plus"></i>
                                        Create New Account</a>
                                </div>


                                <div class="col-sm-3 offset-sm-6" >
                                    <form action="userlist" method="get"> 
                                        <div class="search-box">                                                
                                            <input type="text" class="input-search" placeholder="Search..." name="search">
                                            <button type="submit" class="btn-search"><i class="fas fa-search"></i></button>
                                        </div>
                                    </form> 
                                </div>
                            </div>
                            <div class="col-sm-8" style="padding-left : 0px; padding-right: 0px">
                                <div class="search-form">
                                    <form action="userlist">
                                        <select name="filter" id="group" style="margin-right: 0px">
                                            <option ${filter=="default"?'selected':''} value="default">Default</option>
                                            <optgroup label="Gender">
                                                <option ${filter=="Male"?'selected':''} value="male">Male</option>
                                                <option ${filter=="Female"?'selected':''} value="female">Female</option>
                                                <option ${filter=="Other"?'selected':''} value="other">Other</option>
                                            </optgroup>
                                            <optgroup label="Role">
                                                <c:forEach items = "${listUserRole}" var = "o" >
                                                    <option ${filter==o.roleID.toString()?'selected':''} value="${o.roleID}">${o.roleName}</option>  
                                                </c:forEach>
                                            </optgroup>
                                            <optgroup label="Status">
                                                <option ${filter=="present"?'selected':''} value="present">Present</option>
                                                <option ${filter=="hidden"?'selected':''} value="hidden">Hidden</option>
                                            </optgroup>
                                        </select>

                                        <button  type="submit" class="search-button">
                                            <i class="fa fa-search"></i>
                                        </button>
                                        <input name="search" value="${search}" type="hidden">
                                    </form>
                                </div>

                                <div class="col-sm-6">
                                    <div class="search-form">
                                        <form action="userlist" method="post">
                                            <select name="sort" id="group">
                                                <option ${sort=="1"?'selected':''} value="1">Sort by ID</option>
                                                <optgroup label="Fullname">
                                                    <option ${sort=="2"?'selected':''} value="2">Fullname: A-Z</option>
                                                    <option ${sort=="3"?'selected':''} value="3">Fullname: Z-A</option>
                                                </optgroup>
                                                <option ${sort=="4"?'selected':''} value="4" style="font-weight: bold;">Gender</option>
                                                <optgroup label="Email">
                                                    <option ${sort=="5"?'selected':''} value="5">Email: A-Z</option>
                                                    <option ${sort=="6"?'selected':''} value="6">Email: Z-A</option>
                                                </optgroup>
                                                <option ${sort=="7"?'selected':''} value="7" style="font-weight: bold;">Phone Number</option>
                                                <optgroup label="Role">
                                                    <option ${sort=="8"?'selected':''} value="9">Role: A-Z</option>
                                                    <option ${sort=="9"?'selected':''} value="10">Role: Z-A</option>
                                                </optgroup>
                                            </select>
                                            <button  style="margin-left:-5px" type="submit" class="search-button">
                                                <i class="fa fa-search"></i>
                                            </button>
                                            <input name="search" value="${search}"  type="hidden" ></input>
                                            <input name="filter" value="${filter}"  type="hidden" ></input>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <table class="table table-hover table-bordered" id="sampleTable">
                                <thead>
                                    <tr>
                                        <th width="10">Num</th>
                                        <th style="text-align: center; vertical-align: middle;">ID</th>
                                        <th style="text-align: center; vertical-align: middle;">Full Name</th>
                                        <th style="text-align: center; vertical-align: middle;">Gender</th>
                                        <th style="text-align: center; vertical-align: middle;">Email</th>
                                        <th style="text-align: center; vertical-align: middle;">Phone</th>
                                        <th style="text-align: center; vertical-align: middle;">Role</th>
                                        <th style="text-align: center; vertical-align: middle;">Status</th>
                                        <th style="text-align: center; vertical-align: middle;">Option</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listUserDisplay}" var="u" varStatus="loop">
                                        <tr>
                                            <td style="text-align: center; vertical-align: middle;" width="10">${loop.index + 1}</td>
                                            <td style="text-align: center; vertical-align: middle;">${u.getUserID()}</td>
                                            <td style="text-align: center; vertical-align: middle;">${u.getUserName()}</td>
                                            <td style="text-align: center; vertical-align: middle;">${u.getGender()}</td>
                                            <td style="text-align: center; vertical-align: middle;">${u.getEmail()}</td>
                                            <td style="text-align: center; vertical-align: middle;">${u.getMobile()}</td>
                                            <td style="text-align: center; vertical-align: middle;">${u.getUser_role_name()}</td>
                                            <td class="table-td-center" width="106" style="text-align: center; vertical-align: middle;">  
                                                <form id="statusForm" action="changeuserstatus" method="post">
                                                    <input type="hidden" name="uid" value="${u.getUserID()}">
                                                    <label class="switch">
                                                        <input type="checkbox" id="statusCheckbox" name="status">
                                                        <span class="slider round"></span>
                                                    </label>  
                                                </form> </td>
                                            <td width="60">
                                                <ul style="list-style-type: none; display: flex;">
                                                    <li style="margin: 3px 5px">
                                                        <a href="userDetail?userId=${u.userID}">
                                                            <button class="btn btn-primary btn-sm view" type="button" title="View">
                                                                <i class="fas fa-eye"></i>
                                                            </button>
                                                        </a>    
                                                    </li>
                                                    <li style="margin: 3px 5px"><li style="margin: 3px 5px">
                                                        <form action="userEdit" method="get" >
                                                            <input type="hidden" name="userIdEdit" value="${u.getUserID()}">    
                                                            <button class="btn btn-primary btn-sm edit" type="submit" title="Edit">                                                           
                                                                <i class="fas fa-edit"></i>
                                                            </button>
                                                        </form>                                                      
                                                    </li>
                                                </ul>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <div class="col-md-12" style="height: 30px; display: flex; align-items: center; justify-content: space-between;"">

                                <div style="display: inline-block; display: flex; flex-direction: column; justify-content: center; align-items: center; height: 100%;" class="col-1-sm">
<!--                                    <form action="userlist" id="my-form">
                                        <label for="page_select">show</label>
                                        <select name="userPerPage" onchange="submitForm()">
                                            <option value="8" ${userPerPage == 8 ? 'selected':''}>8</option>
                                            <option value="9" ${userPerPage == 9 ? 'selected':''}>9</option>
                                            <option value="10" ${userPerPage == 10 ? 'selected':''}>10</option>
                                        </select>
                                        <input type="hidden" name="name">
                                        <input type="hidden" name="userContent" value="${userContent}"></input>
                                        <input type="hidden" name="filter" value="${filter}"></input>
                                        <input type="hidden" name="sort" value="${sort}"></input>
                                        <input type="hidden" name="currPage" value="${currPage}"></input>
                                        <span>Users by page</span>
                                    </form>-->
                                </div>

                                <!-- chon so thu tu trang -->
                                <%int numOfPage = (int) request.getAttribute("numOfPage");%>
                                <%int currPage = (int) request.getAttribute("currPage");%>
                                <div style="display: inline-block" class="col-10-sm">
                                    <ul style="list-style: none; display: flex; align-items: center; justify-content: space-between;" >
                                        <!-- Trang cuoi -->
                                        <li><a href="userlist?search=${search}&filter=${filter}&sort=${sort}&userPerPage=${userPerPage}&currPage=${numOfPage}"><span style="margin-right: 10px">Last Pages: ${numOfPage}</span></a></li>
                                        <!--Quay lại trang trước-->
                                        <% if (currPage > 1) { %>
                                        <li><a href="userlist?search=${search}&filter=${filter}&sort=${sort}&userPerPage=${userPerPage}&currPage=<%= currPage - 1 %>" style="color: #08C7B2"><<</a></li>
                                            <% } else { %>
                                        <li><<</li>
                                            <% } %>

                                        <!-- Hiển thì lựa chọn số trang -->
                                        <li>
                                            <form action="userlist" style="margin-left: 20px; margin-right: 20px">
                                                <input type="text" name="currPage" size="2" style="height: 35px" value="${currPage}"></input>
                                                <input type="hidden" name="search" value="${search}"></input>
                                                <input type="hidden" name="filter" value="${filter}"></input>
                                                <input type="hidden" name="sort" value="${sort}"></input>
                                                <input type="hidden" name="userPerPage" value="${userPerPage}"></input>                
                                            </form>
                                        </li>

                                        <!-- Tiến đến trang sau -->
                                        <% if (currPage < numOfPage) { %>
                                        <li><a href="userlist?search=${search}&filter=${filter}&sort=${sort}&userPerPage=${userPerPage}&currPage=<%= currPage + 1 %>" style="color: #08C7B2">>></a></li>
                                            <% } else { %>
                                        <li>>></li>
                                            <% } %>
                                    </ul>
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

