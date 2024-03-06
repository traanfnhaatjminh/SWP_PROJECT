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
                <form action="customer?action=updateinfor" method="POST">
                    <p style="background-color: rgb(63, 60, 60); color: white; padding: 30px 30px; text-align: center;">This is Edit about personal</p>
                    <h3 style="">Edit Your Profile</h3>
                    <p style="color: green; align-content: center;">
                        ${requestScope.messageinfor}
                    </p>
                    <label class="form-label">FullName</label>
                    <input type="text" class="form-control mb-1" name="fullName" value="${sessionScope.accC.fullName}">
                    <label class="form-label">Phone</label>
                    <input type="tel" pattern="[0-9]{10}" class="form-control mb-1" name="phone" value="${sessionScope.accC.phone}">
                    <label class="form-label">Email</label>
                    <input type="text" class="form-control mb-1" readonly name="user_name" value="${sessionScope.accC.email}">
                    <label class="form-label">Adress</label>
                    <input type="text" class="form-control mb-1" name="address" value="${sessionScope.accC.address}">
                    <label class="form-label">Gender</label>
                    <select class="form-control mb-1" name="gender">
                        <option value="male" ${sessionScope.accC.gender == 'male' ? 'selected' : ''}>Male</option>
                        <option value="female" ${sessionScope.accC.gender == 'female' ? 'selected' : ''}>Female</option>
                    </select>
                    <label class="form-label">Avatar</label>
                    <input type="text" class="form-control mb-1" name="avatar" value="${sessionScope.accC.avatar}">
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
