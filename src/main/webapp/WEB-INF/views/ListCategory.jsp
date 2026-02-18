<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Categories List | CodeVerse Admin</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900" rel="stylesheet">
    
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/nalika-icon.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/meanmenu.min.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/metisMenu/metisMenu.min.css">
    <link rel="stylesheet" href="css/metisMenu/metisMenu-vertical.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/responsive.css">
    
    <script src="js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
    <jsp:include page="AdminSidebar.jsp"></jsp:include>

    <div class="all-content-wrapper">
       

        <div class="header-advance-area">
            <div class="breadcome-area">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="breadcome-list">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <div class="breadcomb-wp">
                                            <div class="breadcomb-icon">
                                                <i class="icon nalika-folder"></i>
                                            </div>
                                            <div class="breadcomb-ctn">
                                                <h2>Competition Categories</h2>
                                                <p>Manage tracks and domains for <span class="bread-ntd">Hackathons</span></p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <div class="breadcomb-report">
                                            <button data-toggle="tooltip" title="Export List" class="btn"><i class="icon nalika-download"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="product-status mg-b-30">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="product-status-wrap">
                            <h4>Category Directory</h4>
                            <!-- div class="add-product">
                                <a href="newCategory">Create New</a>
                            </div-->
                            <table>
                                <thead>
                                    <tr>
                                        <th>Sr.No</th>
                                        <th>Category Name</th>
                                        <th>Status</th>
                                        <th>Setting</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="category" items="${categoryList}" varStatus="i">
                                        <tr>
                                            <td>${i.count}</td>
                                            <td style="color: #fff; font-weight: 600;">${category.categoryName}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${category.active}">
                                                        <button class="pd-setting">Active</button>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <button class="ds-setting">Inactive</button>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <button data-toggle="tooltip" title="Edit" class="pd-setting-ed" 
                                                        onclick="location.href='edit-category?categoryId=${category.categoryId}'">
                                                    <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                                </button>
                                                <button data-toggle="tooltip" title="Trash" class="pd-setting-ed" 
                                                        onclick="if(confirm('Are you sure you want to delete this category?')) location.href='deleteCategory?categoryId=${category.categoryId}'">
                                                    <i class="fa fa-trash-o" aria-hidden="true"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                    <c:if test="${empty categoryList}">
                                        <tr>
                                            <td colspan="4" style="text-align: center; padding: 60px; color: #94a3b8;">
                                                No categories found. Click "Create New" to get started!
                                            </td>
                                        </tr>
                                    </c:if>
                                </tbody>
                            </table>
                            
                            <div class="custom-pagination">
                                <ul class="pagination">
                                    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="footer-copyright-area">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="footer-copy-right">
                            <p>Copyright © 2026 CodeVerse. All rights reserved.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="js/vendor/jquery-1.12.4.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/metisMenu/metisMenu.min.js"></script>
    <script src="js/metisMenu/metisMenu-active.js"></script>
    <script src="js/main.js"></script>
</body>
</html>