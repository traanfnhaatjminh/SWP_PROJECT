<%-- 
    Document   : navigation
    Created on : Jan 20, 2024, 3:06:40 PM
    Author     : minh1
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

 <!-- NAVIGATION -->
    <nav id="navigation">
        <!-- container -->
        <div class="container">
            <!-- responsive-nav -->
            <div id="responsive-nav">
                <!-- NAV -->
                <ul class="main-nav nav navbar-nav">
                    <li class="active"><a href="home">Home</a></li>
                    <li><a href="#">Hot Deals</a></li>
                    <li><a href="blog">Blog</a></li>
                        <c:forEach items="${listC}" var="c">
                        <li><a href="categoryDetail?cid=${c.cid}">${c.cname}</a></li>
                        </c:forEach>
                </ul>
                <!-- /NAV -->
            </div>
            <!-- /responsive-nav -->
        </div>
        <!-- /container -->
    </nav>
