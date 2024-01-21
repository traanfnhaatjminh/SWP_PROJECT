<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"
            />
        <style>
            .col-sm-12 button {
                position: absolute;
                right: 115px;
                padding: 6px;
                margin-top: 15px;
                background-color: black;
                color: white;
            }
            .container button{
                margin-top: 15px;
                padding: 6px;
                padding-left: 20px;
                padding-right: 20px;
                background-color: black;
                color: white;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="col-sm-12">
                <p style="background-color: rgb(63, 60, 60); color: white; padding: 30px 30px; text-align: center;">This is Edit about Your PassWord</p>
                <h3 style="">Edit Your PassWord</h3>
                <form action="customer?action=changepassword" method="POST">
                    <p style="color:red">${requestScope.ms}</p>
                    <p style="color:red">${requestScope.mess}</p>
                    <label class="form-label">Email</label>
                    <input type="text" class="form-control mb-1" name="email" value="${sessionScope.customer.email}">
                    <label class="form-label">Old PassWord</label>
                    <input type="text" class="form-control mb-1" name="oldpass" value="">
                    <label class="form-label">New PassWord</label>
                    <input type="text" class="form-control mb-1" name="newpass" value="">
                    <label class="form-label">Repeat PassWord</label>
                    <input type="text" class="form-control mb-1" name="repass" value="">
                    <button type="submit">Save Changes</button>
                </form>

            </div>    
                    <button><a href="profile.jsp">Back</a></button>  
        </div>


        <script
            src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
            integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
            crossorigin="anonymous"
        ></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
            integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
            crossorigin="anonymous"
        ></script>
    </body>
</html>
