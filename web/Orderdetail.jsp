<%-- 
    Document   : index1.jsp
    Created on : 26-09-2023, 00:49:46
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Danh sách nhân viên | Quản trị Admin</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <link rel="stylesheet" href="new_assetss/css/main.css"/>
        <link rel="stylesheet" type="text/css" href="css/main.css">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- or -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
        <!-- Font-icon css-->
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
        <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' rel='stylesheet'>
        <link href='#' rel='stylesheet'>
        <script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        <style type="text/css">
            body{
                background:#eee;
            }
            .card {
                box-shadow: 0 20px 27px 0 rgb(0 0 0 / 5%);
            }
            .card {
                position: relative;
                display: flex;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-color: #fff;
                background-clip: border-box;
                border: 0 solid rgba(0,0,0,.125);
                border-radius: 1rem;
            }
            .text-reset {
                --bs-text-opacity: 1;
                color: inherit!important;
            }
            a {
                color: #5465ff;
                text-decoration: none;
            }
        </style>
    </head>

    <body onload="time()" class="app sidebar-mini rtl">
        <!-- Navbar-->

        <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
        <aside class="app-sidebar" >
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
                            <span class="app-menu__label">Sale Management</span></a></li>
                    <li><a class="app-menu__item " href="pageOrdersServletBySale"><i class='app-menu__icon bx bx-dollar'></i><span
                                class="app-menu__label">Management Orders</span></a></li>
                    <li><a class="app-menu__item" href=""><i class='app-menu__icon bx bx-cog'></i><span class="app-menu__label">Change Password</span></a></li>
                </ul>
        </aside>
        <main class="app-content" style="margin-left: 250px">
            <div class="container">

                <div class="d-flex justify-content-between align-items-center py-3">
                    <h2 class="h5 mb-0"><a href="#" class="text-muted"></a> Order id #${sessionScope.orderDetail.orderID}</h2>
                </div>


                <div class="row">
                    <div class="col-lg-8">

                        <div class="card mb-4">
                            <div class="card-body">
                                <div class="mb-3 d-flex justify-content-between">
                                    <div>
                                        <span class="me-3">Id : ${sessionScope.orderDetail.orderID} </span>
                                        <br>
                                        <span class="me-3">Order Date :${sessionScope.orderDetail.orderDate}</span>
                                        <span class="me-3">-</span>
                                        <span class="badge rounded-pill bg-info"> <c:if test="${sessionScope.orderDetail.orderStatus == '1'}">Orders Pending Processing</c:if>
                                            <c:if test="${sessionScope.orderDetail.orderStatus == '2'}">Orders On Delivery</c:if>
                                            <c:if test="${sessionScope.orderDetail.orderStatus == '3'}">Order Successfully Delivered</c:if>
                                            <c:if test="${sessionScope.orderDetail.orderStatus == null || sessionScope.orderDetail.orderStatus != '1' && sessionScope.orderDetail.orderStatus != '2'&&sessionScope.orderDetail.orderStatus != '3'}">Đã Hủy</c:if></span>
                                        </div>

                                    </div>
                                    <table class="table table-borderless">
                                        <tr>
                                            <th>Information product</th>
                                            <th>Quantity</th>
                                            <th>Total cost</th> 
                                        </tr>

                                    <c:forEach items = "${listProductDetail}" var = "o" >    
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div class="d-flex mb-2">
                                                        <div class="flex-shrink-0">
                                                            <img src="${o.getProduct_img()}" alt width="35" class="img-fluid">
                                                        </div>
                                                        <div class="flex-lg-grow-1 ms-3">
                                                            <h6 class="small mb-0"><a href="#" class="text-reset">Tên sản phẩm: <b>${o.getProduct_name()}</b></a></h6>
                                                            <span class="small">Category :${o.getProduct_cate()}</span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>${o.getQuantity()}</td>
                                                <td class="text-end">${o.getTotalCost()} VNÐ</td>
                                            </tr>
                                        </tbody>
                                    </c:forEach>



                                    <tfoot>
                                        <tr class="fw-bold">
                                            <td colspan="2"> <b>TOTAL</b></td>
                                            <td class="text-end">${sessionScope.orderDetail.totalCost} VNÐ</td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>

                        <div class="card mb-4">

                        </div>

                    </div>
                    <div class="col-lg-4">

                        <div class="card mb-4">
                            <div class="card-body">
                                <h3 class="h6">Customer's information</h3>
                                Full name :<strong>${sessionScope.customerDetail.getFullName()}</strong>
                                <br>
                                Email :<strong>${sessionScope.customerDetail.getEmail()}</strong>
                                <br>
                                Mobile :<strong>${sessionScope.customerDetail.getPhone()}</strong>
                                <br>
                                Address :<strong>${sessionScope.customerDetail.getAddress()}</strong>
                                <br>

                            </div>
                        </div>
<!--                        <h3 class="h6">Change staff for this order</h3>
                        <form action="changeStaffServlet" id="filterForm" style="margin-top: 10px;">
                            <select name="groupby" id="group" style="padding: 5px; border: 1px solid #ccc; border-radius: 5px;">
                                <c:forEach items="${sessionScope.listInFORStaff}" var="listInFORStaff">
                                    <option value="${listInFORStaff.userID}" style="background-color: #f0f0f0;">${listInFORStaff.userName} - ID: ${listInFORStaff.userID}</option>\
                                </c:forEach>
                            </select>

                            <input type="submit" value="Save" style="background-color: #007BFF; color: #fff; padding: 5px 10px; border: none; border-radius: 5px; cursor: pointer;">
                        </form>-->
                        <div class="card mb-4">

                            <div class="card-body">
                                <h3 class="h6">Receiver's information</h3>
                                <hr>

                                Full name :<strong>${sessionScope.orderDetail.orderName}</strong>
                                <br>
                                Mobile :<strong>${sessionScope.orderDetail.orderPhone}</strong>
                                <br>
                                Address :<strong>${sessionScope.orderDetail.orderAddress}</strong>
                                <br>


                            </div>
                        </div>
                        <div class="d-flex justify-content-between align-items-center py-3" style="margin-left: 3.5cm">
                            <h2 class="h5 mb-0">
                                <a href="pageOrdersServletBySale" class="text-muted"><i class="bi bi-arrow-left"></i> Back</a>
                            </h2>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <script src="js/jquery-3.2.1.min.js"></script>

        <!--===============================================================================================-->
        <script src="new_assetss/js/jquery-3.2.1.min.js"></script>
        <script src="new_assetss/js/popper.min.js"></script>
        <script src="new_assetss/js/main.js"></script>
        <script src="new_assetss/js/bootstrap.min.js"></script>

        <script src="https://unpkg.com/boxicons@latest/dist/boxicons.js"></script>
        <!--===============================================================================================-->

        <!--===============================================================================================-->

        <!--===============================================================================================-->
        <script src="js/plugins/pace.min.js"></script>
        <script src="new_assetss/js/plugins/pace.min.js"></script>
        <!--===============================================================================================-->
        <script type="text/javascript" src="js/plugins/chart.js"></script>
        <script src="new_assetss/js/plugins/chart.js"></script>
        <!--===============================================================================================-->
        <script type="text/javascript">
        var data = {
            labels: ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6"],
            datasets: [{
                    label: "Dữ liệu đầu tiên",
                    fillColor: "rgba(255, 213, 59, 0.767), 212, 59)",
                    strokeColor: "rgb(255, 212, 59)",
                    pointColor: "rgb(255, 212, 59)",
                    pointStrokeColor: "rgb(255, 212, 59)",
                    pointHighlightFill: "rgb(255, 212, 59)",
                    pointHighlightStroke: "rgb(255, 212, 59)",
                    data: [20, 59, 90, 51, 56, 100]
                },
                {
                    label: "Dữ liệu kế tiếp",
                    fillColor: "rgba(9, 109, 239, 0.651)  ",
                    pointColor: "rgb(9, 109, 239)",
                    strokeColor: "rgb(9, 109, 239)",
                    pointStrokeColor: "rgb(9, 109, 239)",
                    pointHighlightFill: "rgb(9, 109, 239)",
                    pointHighlightStroke: "rgb(9, 109, 239)",
                    data: [48, 48, 49, 39, 86, 10]
                }
            ]
        };
        var ctxl = $("#lineChartDemo").get(0).getContext("2d");
        var lineChart = new Chart(ctxl).Line(data);

        var ctxb = $("#barChartDemo").get(0).getContext("2d");
        var barChart = new Chart(ctxb).Bar(data);
        </script>
        <script type="text/javascript">
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
        </script>
    </body>

</html>