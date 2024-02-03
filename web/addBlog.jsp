<%-- 
    Document   : addBlog.jsp
    Created on : Feb 3, 2024, 5:08:06 PM
    Author     : minh1
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
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script><script src="./lib/ckeditor/ckeditor.js"></script>
        <script src="./ckeditor_4.23.0-lts_standard/ckeditor/ckeditor.js"></script>
    </head>
    <body>
        <form action="addBlog" method="post" class="form-horizontal">
            <fieldset>

                <!-- Form Name -->
                <legend style="text-align: center">Add a new blog</legend>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="title">Title</label>  
                    <div class="col-md-4">
                        <input name="title" placeholder="Title" class="form-control input-md" required="" type="text">
                    </div>
                </div>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="product_name">Image (Link URL)</label>  
                    <div class="col-md-4">
                        <input name="image" placeholder="Image" class="form-control input-md" required="" type="text">

                    </div>
                </div>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="product_name_fr">Publish Date</label>  
                    <div class="col-md-4">
                        <input name="date" placeholder="Publish Date" class="form-control input-md" required="" type="text">

                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-4 control-label" for="product_name_fr">Content</label>  
                    <div class="col-md-4">
                        <textarea name="content" id="cheditor" class="form-control" required></textarea>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-4 control-label" for="title">Author</label>  
                    <div class="col-md-4">
                        <input name="author" placeholder="Author" class="form-control input-md" required="" type="text">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-4 control-label" for="status">Status</label>  
                    <div class="col-md-4">
                        <select name="status" class="form-control input-md" required="">
                            <option value="public" selected>Public</option>
                            <option value="private">Private</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-4 control-label" for="title">Blog Category ID</label>  
                    <div class="col-md-4">
                        <input name="blogCateID" placeholder="Blog Category ID" class="form-control input-md" required="" type="text">
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
                        <a style="margin-left: 65%" href="post?menu=post" target="target">Back to manage blog</a>
                    </div>
                </div>

            </fieldset>
        </form>
        <script>
            CKEDITOR.replace('cheditor');
        </script>
    </body>
</html>
