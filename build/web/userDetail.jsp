<%-- 
    Document   : table-data-banned
    Created on : 26-09-2023, 02:04:01
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>${user.userName} | Quản trị Admin</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <link rel="stylesheet" href="./new_assetss/css/main.css"/>
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- or -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
        <link rel="stylesheet" href="../new_assets/css/FeedbackDetail.jsp"/>
        <!-- Font-icon css-->
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">

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
        
            <!-- Sidebar menu-->
        
            <main class="">
                <div class="app-title">
                    <ul class="app-breadcrumb breadcrumb side">
                        <li class="breadcrumb-item"><a href="userlist">User List</a></li>
                        <li class="breadcrumb-item"><a href="userDetail?userId=${user.userID}">User Detail</a></li>
                    </ul>
                    <div id="clock"></div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="tile">
                            <div class="tile-body">
                                <div class="row element-button">
                                    <div class="col-sm-2">

                                        <a class="btn btn-add btn-sm" href="" title="Thêm"><i class="fas fa-plus"></i>
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
                                    <div style="display: flex" class="col-md-12">
                                        <h3>Họ Và Tên: </h3> 
                                        <h3 style="color: #226e20"> ${user.userName}</h3>
                                        <div style="margin-left: auto">
                                            <form action="userEdit" method="get">
                                                <input type="hidden" name="userIdEdit" value="${user.userID}">    
                                                <button class="btn btn-primary btn-sm edit" type="submit" title="Edit">                                                           
                                                    <i class="fas fa-edit"></i>  Edit
                                                </button>
                                            </form>                                                      
                                        </div>
                                    </div>
                                    <br>
                                    <div class="container-content col-md-12" style="background-color: white; padding-top: 13px; padding-bottom: 11px; border-radius: 10px; filter: drop-shadow(0 0 -3px grey)">
                                        <h6>Giới tính: ${user.gender}</h6>
                                        <br>
                                        <h6>Email: ${user.email}</h6>
                                        <br>
                                        <h6>SĐT: ${user.mobile}</h6>
                                        <br>
                                        <h6>Vai Trò: ${user.user_role_name} </h6>
                                        <br>
                                        <h6>Địa Chỉ: ${user.address}</h6>
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
        <!-- Essential javascripts for application to work-->

        <script src="new_assetss/js/jquery-3.2.1.min.js"></script>
        <script src="new_assetss/js/popper.min.js"></script>
        <script src="new_assetss/js/bootstrap.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="src/jquery.table2excel.js"></script>
        <script src="new_assetss/js/main.js"></script>
        <!-- The javascript plugin to display page loading on top-->
        <script src="new_assetss/js/plugins/pace.min.js"></script>
        <!-- Page specific javascripts-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
        <!-- Data table plugin-->
        <script type="text/javascript" src="js/plugins/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="js/plugins/dataTables.bootstrap.min.js"></script>
        <script type="text/javascript">$('#sampleTable').DataTable();</script>
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
            function deleteRow(r) {
                var i = r.parentNode.parentNode.rowIndex;
                document.getElementById("myTable").deleteRow(i);
            }
            jQuery(function () {
                jQuery(".trash").click(function () {
                    swal({
                        title: "Cảnh báo",

                        text: "Bạn có chắc chắn là muốn xóa?",
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