<%-- 
    Document   : addProduct
    Created on : Mar 7, 2024, 8:39:38 PM
    Author     : DUONG VIET DUY
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Blog Page</title>

        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="./ckeditor_4.23.0-lts_standard/ckeditor/ckeditor.js"></script>
    </head>
    <body>
        <form action="addProduct" method="post" class="form-horizontal">
            <fieldset>

                <!-- Form Name -->
                <legend style="text-align: center">Add a new product</legend>
                <c:if test="${error == null}">
                    <p class="text-success">${success}</p>
                </c:if>
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label">Name</label>  
                    <div class="col-md-4">
                        <input name="name" placeholder="Name" class="form-control input-md" required="" type="text">
                    </div>
                </div>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label">Image (Link URL)</label>  
                    <div class="col-md-4">
                        <input name="image" placeholder="Image" class="form-control input-md" required="" type="text">

                    </div>
                </div>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label">Original Price</label>  
                    <div class="col-md-4">
                        <input name="original_price" placeholder="Original Price" class="form-control input-md" required="" type="text">
                    </div>
                </div>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label">Sale Price</label>  
                    <div class="col-md-4">
                        <input name="sale_price" placeholder="Sale Price" class="form-control input-md" required="" type="text">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-4 control-label">Quantity</label>  
                    <div class="col-md-4">
                        <input name="quantity" placeholder="Quantity" class="form-control input-md" required="" type="number">
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="col-md-4 control-label">Describe</label>  
                    <div class="col-md-4">
                        <textarea name="describe" id="cheditor" class="form-control" required></textarea>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-4 control-label">Category</label>  
                    <div class="col-md-4">
                        <select name="category" class="form-control input-md" required="">
                            <c:forEach items="${listCategory}" var="c">
                                <option value="${c.cid}">${c.cname}</option>
                            </c:forEach>
                        </select>
                        <c:if test="${error != null}">
                            <p class="text-danger">${error}</p>
                        </c:if>
                    </div>
                </div>

                <!-- Button -->
                <div class="form-group">
                    <div class="col-md-8" style="margin-left: 45%">
                        <button type="submit" class="btn btn-primary">Add</button>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-md-8">
                        <a style="margin-left: 65%" href="productList?menu=productList" target="target">Back to manage product</a>
                    </div>
                </div>

            </fieldset>
        </form>
        <script>
            CKEDITOR.replace('cheditor');
        </script>
    </body>
</html>
