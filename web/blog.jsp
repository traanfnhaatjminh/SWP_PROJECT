<%-- 
    Document   : blog
    Created on : Jan 18, 2024, 11:36:21 AM
    Author     : minh1
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- /SECTION -->
<div class="container">
    <div class="store-filter clearfix center-content">
        <div class="store-sort">
            <label>
                Sort By:
                <select class="input-select">
                    <option value="0">Latest blog</option>
                    <option value="1">Oldest blog</option>
                </select>
            </label>

            <label>
                Show:
                <select class="input-select">
                    <option value="0">20</option>
                    <option value="1">50</option>
                </select>
            </label>
        </div>
    </div>

    <div class="row">

        <!-- Products tab & slick -->
        <div class="col-md-12">
            <div class="row">
                <div class="products-tabs">
                    <!-- tab -->
                    <div id="tab1" class="tab-pane active">
                        <div class="products-slick" data-nav="#slick-nav-1">
                            <!-- product -->
                            <c:forEach items="${listB}" var="c">
                                <div class="col-md-4">
                                    <div class="product-body">
                                        <img width="100%" src="${c.blogImage}" alt="Blog Image 1" class="img-fluid">
                                        <h3 class="product-name">${c.blogTitle}</h3>
                                        <p class="product-name">${c.content}</p>
                                        <a href="#" class="btn btn-default">Read More</a>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <div id="slick-nav-1" class="products-slick-nav">
                        </div>
                    </div>
                    <!-- /tab -->
                </div>
            </div>
        </div>
        <!-- Products tab & slick -->
    </div>
</div>